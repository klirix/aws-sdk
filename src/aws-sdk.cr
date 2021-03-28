# TODO: Write documentation for `Aws::Sdk`
require "json"
require "./json-ast"

module Smithy

  abstract class AbstractType(T)
    property id : String
    property traits : Hash(String, JSON::Any)?
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
          {% for type in %w{Structure Map List Integer Float Blob String Timestamp}%}
          when ASTNode{{type.id}}
            {{type.id}}Type.new(namespace, id, shape)
          {% end %}
        else
          raise "What kind of type is that??"
        end
      {% end %}
    end
  end


  class ServiceType < AbstractType(ASTNodeService)
    property operations : Array(OperationType)

    def initialize(@namespace, @id, @node : ASTNodeService)
      @operations = @namespace.shapes
        .select(@node.operations.map &.target)
        .map do |id, node|
          OperationType.new(@namespace, id, node.as(ASTNodeOperation))
        end
    end
  end

  class OperationType < AbstractType(ASTNodeOperation)
    property input : DataType?
    property output : DataType?
    property errors : Array(DataType)

    def initialize(@namespace, @id, @node : ASTNodeOperation)
      @input = new_data_type(@namespace, @node.input.target, @namespace.shapes[@node.input.target])
      if output = @node.output
        @output = new_data_type(@namespace, output.target, @namespace.shapes[output.target])
      end
      @errors = @namespace.shapes
        .select(@node.errors.map &.target)
        .map do |id, shape|
          new_data_type(@namespace, id, shape)
        end
    end
  end

  alias DataType = StructureType | MapType | ListType | IntegerType | FloatType | BlobType | StringType | TimestampType

  class StructureType < AbstractType(ASTNodeStructure)
    property members = Hash(String, DataType).new
    def initialize(@namespace, @id, @node : ASTNodeStructure)
      @node.members.each do |name, member|
        shape = @namespace.shapes[member.target]
        @members[name] = new_data_type(@namespace, member.target, shape)
      end
    end

    def to_s(io)
      io << "Structure of: \n"
      @members.each do |name, dt|
        io << "  #{name}: #{dt}\n"
      end
    end
  end

  class ListType < AbstractType(ASTNodeList)
    property member : DataType
    def initialize(@namespace, @id, @node : ASTNodeList)
      shape = @namespace.shapes[@node.member.target]
      @member = new_data_type(@namespace, @node.member.target, shape)
    end

    def to_s(io)
      io << "List of #{member.to_s}"
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

    def to_s(io)
      io << "Map of #{key.to_s} => #{value.to_s}"
    end
  end

  {% for primitive in %w(Integer Float Blob String Timestamp) %}
    class {{primitive.id}}Type < AbstractType(ASTNode{{primitive.id}})
      def to_s(io)
        io << \{{@type.stringify.id}}
      end
    end
  {% end %}

  DATA_TYPES = {
    "structure" => StructureType,
    "list" => ListType,
    "map" => MapType,
    "integer" => IntegerType,
    "float" => FloatType,
    "blob" => BlobType,
    "string" => StringType,
    "timestamp" => TimestampType
  }
  AST_TYPES = {
    "structure" => ASTNodeStructure,
    "list" => ASTNodeList,
    "map" => ASTNodeMap,
    "integer" => ASTNodeInteger,
    "float" => ASTNodeFloat,
    "blob" => ASTNodeBlob,
    "string" => ASTNodeString,
    "timestamp" => ASTNodeTimestamp
  }

  class Namespace
    property shapes : Hash(String, Shape)

    def initialize(filename)
      @shapes = Hash(String, Smithy::Shape)
        .from_json(File.read(filename))
    end

    def service : ServiceType
      if rec = @shapes.find {|_, x| x.type == "service"}
        id, node = rec
        ServiceType.new(self, id, node.as(ASTNodeService))
      else
        raise "Lmao what even is this?"
      end
    end
  end
end

appconfig = Smithy::Namespace.new("aws-models/appconfig.2019-10-09.json")
appconfig.service.tap do |service|
  puts "Service #{service.name}"
  puts "Traits:"
  p service.traits
  puts "Operations:"
  service.operations.each do |op|
    puts "Operation #{op.name}"
    print "Input: "
    puts op.input.to_s
    print "oputput: "
    puts op.output.to_s
    print "errors: "
    op.errors.each do |err|
      puts err
    end
  end
end
