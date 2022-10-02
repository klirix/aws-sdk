require "json"
require "ecr"

module AWSCodegen
  BASE_TYPE     = %w(boolean double float integer long string timestamp)
  BASE_TYPE_MAP = {
    "boolean"   => "Bool",
    "double"    => "Float64",
    "string"    => "String",
    "timestamp" => "Time",
    "long"      => "Int32",
    "integer"   => "Int16",
    "float"     => "Float32",
  }

  class Service
    include JSON::Serializable

    getter version : String
    getter metadata : ServiceMetadata
    getter operations : Hash(String, Operation)

    @[JSON::Field(key: "shapes")]
    getter shape_data : Hash(String, ShapeData)

    @[JSON::Field(ignore: true)]
    @shapes = Hash(String, Shape).new

    def shapes
      if shape_data.size != @shapes.size
        shape_data.each do |k, v|
          @shapes[k] = Shape.new k, v, self
        end
      end
      @shapes
    end

    def to_code
      ECR.render "codegen/templates/service.ecr"
    end
  end

  struct ShapeMember
    include JSON::Serializable
    getter shape : String
    getter location : String?
    getter location_name : String?

    def to_type
      if BASE_TYPE.includes? shape
        BASE_TYPE_MAP[shape]
      else
        shape
      end
    end

    def initialize(@shape)
    end
  end

  class Operation
    include JSON::Serializable
    getter name : String
    getter http : OperationHttpData
    getter input : ShapeMember
    getter output : ShapeMember
    getter errors : Array(ShapeMember)

    class OperationHttpData
      include JSON::Serializable

      getter method : String
      getter requestUri : String
    end

    def to_code
      ECR.render "codegen/templates/operation.ecr"
    end
  end

  class ShapeData
    include JSON::Serializable

    getter type : String
    getter required : Array(String)?
    getter members : Hash(String, ShapeMember)?
    getter member : ShapeMember?
    getter key : ShapeMember?
    getter value : ShapeMember?
  end

  class Shape < ShapeData
    getter name : String

    def is_request?
      name.ends_with? "Request"
    end

    def is_result?
      name.ends_with? "Result"
    end

    def is_basetype?
      BASE_TYPE.includes? type
    end

    def to_type
      if type == "list"
        "Array(#{shape_type(member.not_nil!.shape)})"
      elsif type == "map"
        "Hash(#{shape_type(key.not_nil!.shape)},#{shape_type(value.not_nil!.shape)})"
      elsif is_basetype?
        BASE_TYPE_MAP[type]
      else
        name
      end
    end

    def shape_type(shape : String)
      @service.shapes[shape].to_type
    end

    def initialize(name : String, data : ShapeData, @service : Service)
      @name = name
      @type = data.type
      @required = data.required
      @members = data.members
      @member = data.member
      @key = data.key
      @value = data.value
    end

    def to_code
      if members == nil
        # pp self
      end
      ECR.render "codegen/templates/shape.ecr"
    end
  end

  struct ServiceMetadata
    include JSON::Serializable

    getter apiVersion : String
    getter endpointPrefix : String
    getter jsonVersion : String
    getter protocol : String
    getter serviceFullName : String
    getter serviceId : String
    getter signatureVersion : String
    getter targetPrefix : String
    getter uid : String
  end
end
