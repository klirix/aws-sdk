require "json"

module AWSCodegen
  BASE_TYPE = %w(boolean string double float integer)

  class Service
    include JSON::Serializable

    getter version : String
    getter metadata : ServiceMetadata
    getter shape_data : Hash(String, ShapeData)

    def shapes
    end
  end

  class ShapesSerializer
    def from_json(pull : JSON::PullParser)
      pull
    end
  end

  class ShapeData
    include JSON::Serializable

    getter type : String
    getter required : Array(String)?
    getter members : Hash(String, ShapeMember)?

    struct ShapeMember
      include JSON::Serializable
      getter shape : String
    end
  end

  class Shape < ShapeData
    getter name : String

    def isRequest?
      name.ends_with? "Request"
    end

    def isResponse?
      name.ends_with? "Response"
    end

    def isBasetype?
      BASE_TYPE.includes? name
    end

    def initialize(name : String, data : ShapeData)
      @name = name
      @type = @data.type
      @required = @data.required
      @members = @data.members
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
