require "json"

module Smithy
  abstract class Shape
    include JSON::Serializable

    use_json_discriminator "type", {
      service: ASTNodeService,
      structure: ASTNodeStructure,
      list: ASTNodeList,
      string: ASTNodeString,
      float: ASTNodeFloat,
      blob: ASTNodeBlob,
      integer: ASTNodeInteger,
      timestamp: ASTNodeTimestamp,
      map: ASTNodeMap,
      operation: ASTNodeOperation
    }

    property type : String
    property traits : Hash(String, JSON::Any)?
  end

  class ASTNodeMap < Shape
    property key : ShapeMember
    property value : ShapeMember
  end

  class ASTNodeTimestamp < Shape
  end

  class ASTNodeInteger < Shape
  end

  class ASTNodeFloat < Shape
  end

  class ASTNodeOperation < Shape
    property input : ShapeMember
    property output : ShapeMember?
    property errors : Array(ShapeMember)
  end

  class ASTNodeService < Shape
    property operations : Array(ShapeMember)
  end

  class ASTNodeStructure < Shape
    property members : Hash(String, ShapeMember)
  end

  class ASTNodeList < Shape
    property member : ShapeMember
  end

  class ASTNodeString < Shape
  end

  class ASTNodeBlob < Shape
  end

  class ShapeMember
    include JSON::Serializable

    property target : String
    property traits : Hash(String, JSON::Any)?
  end

end
