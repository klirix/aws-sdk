# TODO: Write documentation for `Aws::Sdk`
require "json"

module Smithy
  abstract class Shape
    include JSON::Serializable

    use_json_discriminator "type", {
      service: SmithyService,
      structure: SmithyStructure,
      list: SmithyList,
      string: SmithyString,
      float: SmithyFloat,
      blob: SmithyBlob,
      integer: SmithyInteger,
      timestamp: SmithyTimestamp,
      map: SmithyMap,
      operation: SmithyOperation
    }

    property type : String
    property traits : Hash(String, JSON::Any)?
  end

  class SmithyMap < Shape
    property key : ShapeMember
    property value : ShapeMember
  end

  class SmithyTimestamp < Shape
  end

  class SmithyInteger < Shape
  end

  class SmithyFloat < Shape
  end

  class SmithyOperation < Shape
    property input : ShapeMember
    property output : ShapeMember?
    property errors : Array(ShapeMember)
  end

  class SmithyService < Shape
    property operations : Array(ShapeMember)
  end

  class SmithyStructure < Shape
    property members : Hash(String, ShapeMember)
  end

  class SmithyList < Shape
    property member : ShapeMember
  end

  class SmithyString < Shape
  end

  class SmithyBlob < Shape
  end

  class ShapeMember
    include JSON::Serializable

    property target : String
    property traits : Hash(String, JSON::Any)?
  end

  class Namespace
    @shapes : Hash(String, Shape)

    def initialize(filename)
      @shapes = Hash(String, Smithy::Shape)
        .from_json(
          File.read("aws-models/appconfig.2019-10-09.json")
        )
    end

    def services
      @shapes.find
    end
  end
end

pp Hash(String, Smithy::Shape)
  .from_json(
    File.read("aws-models/appconfig.2019-10-09.json")
  )

