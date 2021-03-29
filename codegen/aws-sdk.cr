# TODO: Write documentation for `Aws::Sdk`
require "json"
require "./json-ast"

module Smithy

  abstract class AbstractType(T)

    def_equals @id

    def_hash @id

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
    property errors : Array(DataType)?

    def initialize(@namespace, @id, @node : ASTNodeOperation)
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
  end

  alias DataType = UnionType | LongType | BooleanType | StructureType | MapType | ListType | IntegerType | FloatType | BlobType | StringType | TimestampType

  class StructureType < AbstractType(ASTNodeStructure)
    property members = Hash(String, DataType).new
    def initialize(@namespace, @id, @node : ASTNodeStructure)
      @node.members.each do |name, member|
        shape = @namespace.shapes[member.target]
        @members[name] = new_data_type(@namespace, member.target, shape)
      end
      @namespace.structures << self
    end

    def to_s(io)
      io << "Structure of: \n"
      @members.each do |name, dt|
        io << "  #{name}: #{(dt.is_a? self)? dt.name : dt}\n"
      end
    end
  end

  class UnionType < AbstractType(ASTNodeUnion)
    property members = Hash(String, DataType).new
    def initialize(@namespace, @id, @node : ASTNodeUnion)
      @node.members.each do |name, member|
        shape = @namespace.shapes[member.target]
        @members[name] = new_data_type(@namespace, member.target, shape)
      end
    end

    def to_s(io)
      io << "Union of: "
      @members.each do |name, dt|
        io << "#{name}: #{(dt.is_a? StructureType)? dt.name : dt}, "
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
      io << "List of #{(member.is_a? StructureType) ? member.name : member}"
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
      io << "Map of #{key.to_s} => #{(value.is_a? StructureType) ? value.name : value}"
    end
  end

  {% for primitive in PRIMITIVE_TYPENAMES %}
    class {{primitive.id}}Type < AbstractType(ASTNode{{primitive.id}})
      def to_s(io)
        io << \{{@type.stringify.id}}
      end
    end
  {% end %}

  class Namespace
    property shapes : Hash(String, Shape)
    property structures : Set(StructureType) = Set(StructureType).new
    getter service

    def initialize(filename)
      @shapes = Hash(String, Smithy::Shape).from_json(File.read(filename))
      id, node = @shapes.find {|_, x| x.type == "service"}.not_nil!
      @service = ServiceType.new(self, id, node.as(ASTNodeService))

    end
  end
end

appconfig = Smithy::Namespace.new("aws-models/s3.json")
puts "Structures:"
appconfig.structures.each do |str|
  print str.name
  puts " = #{str.to_s}"
end
appconfig.service.not_nil!.tap do |service|
  puts "Service #{service.name}"
  puts "Traits:"
  p service.traits
  puts "Operations:"
  service.operations.each do |op|
    puts "Operation #{op.name}"
    print "Input: "
    puts op.input.try &.name || "none"
    print "Output: "
    puts op.output.try &.name || "none"
    print "errors: "
    p op.errors.try &.map &.name
  end
end


