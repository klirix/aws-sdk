# TODO: Write documentation for `Aws::Sdk`
require "json"
require "./json-ast"
require "ecr"

module Smithy

  abstract class AbstractType(T)

    def_equals @id

    def_hash @id

    property id : String
    property traits = Hash(String, JSON::Any).new
    property namespace : Namespace


    def name : String
      @id.split('#')[1]
    end

    def domain : String
      @id.split('#')[0]
    end

    def initialize(@namespace, @id, @node : T)
    end

    def new_data_type(namespace, id, shape : Shape) : DataType
      {% begin %}
        case shape
          {% for type in %w{Structure Map List Union}+PRIMITIVE_TYPENAMES%}
          when ASTNode{{type.id}}
            {{type.id}}Type.new(namespace, id, shape)
          {% end %}
        else
          pp shape
          raise "What kind of type is that??"
        end
      {% end %}
    end
  end


  class ServiceType < AbstractType(ASTNodeService)
    property operations : Array(OperationType)

    def initialize(@namespace, @id, @node : ASTNodeService)
      @traits = @node.traits
      @operations = @namespace.shapes
        .select(@node.operations.map &.target)
        .map do |id, node|
          OperationType.new(@namespace, id, node.as(ASTNodeOperation))
        end
    end

    def protocol
      case traits
      when .has_key? "aws.protocols#restJson1"
        :rest_json
      when .has_key? "aws.protocols#restXml"
        :rest_xml
      when .has_key? "aws.protocols#awsJson1_1"
        :json1_1
      else
        raise "Protocol unavailable"
      end
    end

    def protocol_module
      case traits
      when .has_key? "aws.protocols#restJson1"
        "RestJson"
      when .has_key? "aws.protocols#restXml"
        "RestXML"
      when .has_key? "aws.protocols#awsJson1_1"
        "JSON1_1"
      else
        raise "Protocol unavailable"
      end
    end

    def to_code
      ECR.render "codegen/service.ecr"
    end
  end

  class OperationType < AbstractType(ASTNodeOperation)
    property input : DataType?
    property output : DataType?
    property errors : Array(DataType)?

    def initialize(@namespace, @id, @node : ASTNodeOperation)
      @traits = @node.traits
      if input = @node.input
        @input = new_data_type(@namespace, input.target, @namespace.shapes[input.target])
      end
      if output = @node.output
        @output = new_data_type(@namespace, output.target, @namespace.shapes[output.target])
      end
      if errors = @node.errors
        @errors = @namespace.shapes
          .select(errors.map &.target)
          .map do |id, shape|
            new_data_type(@namespace, id, shape)
          end
      end
    end

    def to_code
      traits = @traits.not_nil!
      ECR.render "codegen/operation.ecr"
    end
  end

  alias DataType = DoubleType | UnionType | LongType | BooleanType | StructureType | MapType | ListType | IntegerType | FloatType | BlobType | StringType | TimestampType

  class StructureType < AbstractType(ASTNodeStructure)
    property members = Hash(String, DataType).new
    property memberTraits = Hash(String, Hash(String, JSON::Any)).new
    def initialize(@namespace, @id, @node : ASTNodeStructure)
      @traits = @node.traits
      @node.members.each do |name, member|
        shape = @namespace.shapes[member.target]
        @members[name] = new_data_type(@namespace, member.target, shape)
        @memberTraits[name] = member.traits
      end
      @namespace.structures << self
    end

    def input?
      name.ends_with?("Request")
    end

    def output?
      name.ends_with?("Output")
    end

    def exception?

      @traits.try &.has_key?("smithy.api#error")
    end

    def scalar?
      !(input? || output? || exception?)
    end

    def to_code
      # traits = @traits.not_nil!
      ECR.render "codegen/structure.ecr"
    end

    def to_type
      scalar? ? "#{name}Struct" : name
    end
  end


  class UnionType < AbstractType(ASTNodeUnion)
    property members = Hash(String, DataType).new
    def initialize(@namespace, @id, @node : ASTNodeUnion)
      @node.members.each do |name, member|
        shape = @namespace.shapes[member.target]
        @members[name] = new_data_type(@namespace, member.target, shape)
      end
      @namespace.unions << self
    end

    def to_code
      ECR.render "codegen/union.ecr"
    end

    def to_type
      "#{name}Struct"
    end
  end

  class ListType < AbstractType(ASTNodeList)
    property member : DataType
    property member_traits : Hash(String, JSON::Any)?
    def initialize(@namespace, @id, @node : ASTNodeList)
      shape = @namespace.shapes[@node.member.target]
      @member = new_data_type(@namespace, @node.member.target, shape)
      @member_traits = @node.traits
    end

    def to_type
      "Array(#{member.to_type})"
    end
  end

  class MapType < AbstractType(ASTNodeMap)
    property key : DataType
    property value : DataType
    def initialize(@namespace, @id, @node : ASTNodeMap)
      shape = @namespace.shapes[@node.key.target]
      @key = new_data_type(@namespace, @node.key.target, shape)
      shape = @namespace.shapes[@node.value.target]
      @value = new_data_type(@namespace, @node.value.target, shape)
    end

    def to_type
      "Hash(#{key.to_type}, #{value.to_type})"
    end
  end

  {% for primitive in PRIMITIVE_TYPENAMES %}
    class {{primitive.id}}Type < AbstractType(ASTNode{{primitive.id}})
    end
  {% end %}

  class StringType
    def to_type
      "String"
    end
  end

  class FloatType
    def to_type
      "Float32"
    end
  end

  class DoubleType
    def to_type
      "Float64"
    end
  end

  class BlobType
    def to_type
      "Bytes"
    end
  end

  class IntegerType
    def to_type
      "Int32"
    end
  end

  class TimestampType
    def to_type
      "Time"
    end
  end

  class BooleanType
    def to_type
      "Bool"
    end
  end

  class LongType
    def to_type
      "Int64"
    end
  end


  class Namespace
    property shapes : Hash(String, Shape)
    property structures : Set(StructureType) = Set(StructureType).new
    property unions = Set(UnionType).new
    getter service : ServiceType?

    def initialize(filename)
      @shapes = Hash(String, Smithy::Shape).from_json(File.read(filename), "shapes")
      id, node = @shapes.find {|_, x| x.type == "service"}.not_nil!
      @service = ServiceType.new(self, id, node.as(ASTNodeService))
    end
  end
end

appconfig = Smithy::Namespace.new("aws-models/appconfig.json")
begin
  file = File.open("src/clients/appconfig.cr", "w")
  file.puts appconfig.service.try &.to_code
# rescue exception
#   puts "Failed to write to file"
#   pp exception
ensure
  file.close if file
end
