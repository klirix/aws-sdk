require "json"

module Smithy
  abstract class Shape
    include JSON::Serializable

    use_json_discriminator "type", {
      service: ASTNodeService,
      structure: ASTNodeStructure,
      union: ASTNodeUnion,
      list: ASTNodeList,
      string: ASTNodeString,
      float: ASTNodeFloat,
      long: ASTNodeLong,
      blob: ASTNodeBlob,
      boolean: ASTNodeBoolean,
      integer: ASTNodeInteger,
      timestamp: ASTNodeTimestamp,
      map: ASTNodeMap,
      operation: ASTNodeOperation
    }

    property type : String
    property traits = {} of String => JSON::Any
  end

  PRIMITIVE_TYPENAMES = %w(String Float Blob Integer Timestamp Boolean Long)

  {% for primitive in PRIMITIVE_TYPENAMES%}
    class ASTNode{{primitive.id}} < Shape
    end
  {% end %}

  class ASTNodeMap < Shape
    property key : ShapeMember
    property value : ShapeMember
  end

  class ASTNodeStructure < Shape
    property members : Hash(String, ShapeMember)
  end

  class ASTNodeUnion < Shape
    property members : Hash(String, ShapeMember)
  end

  class ASTNodeList < Shape
    property member : ShapeMember
  end

  class ASTNodeOperation < Shape
    property input : ShapeMember?
    property output : ShapeMember?
    property errors : Array(ShapeMember)?
  end

  class ASTNodeService < Shape
    property operations : Array(ShapeMember)
  end

  class ShapeMember
    include JSON::Serializable

    property target : String
    property traits : Hash(String, JSON::Any) = Hash(String, JSON::Any).new
  end

end
