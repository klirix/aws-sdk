require "xml"

module AWSSdk
  annotation Field
  end
  module RestXML
    module Structure

      def serialize(xml : XML::Builder)
        {% begin %}
          {% properties = {} of Nil => Nil %}
          {% for ivar in @type.instance_vars %}
            {% ann = ivar.annotation(AWSSdk::Field) %}
            {%
              properties[ivar.id] = {
                type:         ivar.type,
                key:          ((ann && ann[:key]) || ivar).id.stringify,
                has_default:  ivar.has_default_value?,
                default:      ivar.default_value,
                nilable:      ivar.type.nilable?,
                location:     ann && ann[:location],
                name:         ann && ann[:name],
                is_structure: ann && ann[:structure] || false,

              }
            %}
          {% end %}
          {% for name, props in properties %}
          {% puts props %}
            {% if props[:location] == :body %}
              {% if props[:is_structure] %}
                if serializable = {{name.id}}
                  xml.element({{props[:name]}}) {
                    serializable.serialize(xml)
                  }
                end
              {% elsif props[:type] <= Array %}
                {{name.id}}.each do |el|
                  xml.element({{props[:name]}}) {
                    {% if [String, Float32, Int32].includes? props[:type].type_vars[0]  %}
                      xml.text el if el
                    {% else %}
                      el.serialize(xml)
                    {% end %}
                  }
                end
              {% else %}
                if scalar = {{name.id}}
                  xml.element({{props[:name]}}) {
                    xml.text scalar.to_s
                  }
                end
              {% end %}
            {% end %}
          {% end %}
        {% end %}
      end
      def process(request : HTTP::Request)
        {% begin %}
          {% properties = {} of Nil => Nil %}
          {% for ivar in @type.instance_vars %}
            {% ann = ivar.annotation(AWSSdk::Field) %}
            {%
              properties[ivar.id] = {
                type:         ivar.type,
                key:          ((ann && ann[:key]) || ivar).id.stringify,
                has_default:  ivar.has_default_value?,
                default:      ivar.default_value,
                nilable:      ivar.type.nilable?,
                location:     ann && ann[:location],
                name:         ann && ann[:name],
                is_structure: ann && ann[:structure] || false,

              }
            %}
          {% end %}
          {% for name, props in properties %}
            {% if props[:location] == :query %}
              if q_param = @{{name.id}}
                request.query_params[{{props[:name]}}] = q_param.to_s
              end
            {% elsif props[:location] == :body_io %}
              {% if props[:is_structure] == true %}
                request.body = XML.build(indent: "  ") do |xml|
                  xml.element({{props[:name]}}) do
                    {{name.id}}.serialize(xml)
                  end
                end
              {% else %}
                if (payload = {{name.id}}) && payload.responds_to? :size
                  request.body = payload
                  request.content_length = payload.size
                end
              {% end %}
            {% elsif props[:location] == :header %}
              if h_param = @{{name.id}}
                request.headers[{{props[:name]}}] = h_param.to_s
              end
            {% end %}
          {% end %}
          request
        {% end %}
      end
      macro included
        def self.deserialize(xml : XML::Node)
          {% begin %}
            {% properties = {} of Nil => Nil %}
            {% for ivar in @type.instance_vars %}
              {% ann = ivar.annotation(AWSSdk::Field) %}
              {%
                properties[ivar.id] = {
                  type:         ivar.type,
                  key:          ((ann && ann[:key]) || ivar).id.stringify,
                  has_default:  ivar.has_default_value?,
                  default:      ivar.default_value,
                  nilable:      ivar.type.nilable?,
                  location:     ann && ann[:location],
                  name:         ann && ann[:name],
                  is_structure: ann && ann[:structure] || false,

                }
              %}
            {% end %}
            {% for name, props in properties %}
              {% if props[:location] == :body %}
                {% if props[:is_structure] %}
                  @{{name}} = {{props[:type]}}.deserialize(
                    xml.xpath_node({{props[:name]}})
                  )
                {% elsif props[:type] <= Array %}
                  {{name.id}} = xml.xpath_nodeset({{props[:name]}}).map do |node|
                    {% if props[:type].type_vars[0] === String %}
                      node.content
                    {% elsif props[:type].type_vars[0] === Float32 %}
                      node.content.to_f32
                    {% elsif props[:type].type_vars[0] === Float64 %}
                      node.content.to_f64
                    {% else %}
                      {{props[:type]}}.deserialize(xml)
                    {% end %}
                  end
                {% else %}
                  xml.element({{props[:name]}}) { xml.text {{name.id}}}
                {% end %}
              {% end %}
            {% end %}
          {% end %}
        end
        def self.from_response(request : HTTP::Client::Response)
          {% begin %}
          {% properties = {} of Nil => Nil %}
          {% for ivar in @type.instance_vars %}
            {% ann = ivar.annotation(RestXML::Protocol) %}
            {%
              properties[ivar.id] = {
                type:         ivar.type,
                key:          ((ann && ann[:key]) || ivar).id.stringify,
                has_default:  ivar.has_default_value?,
                default:      ivar.default_value,
                nilable:      ivar.type.nilable?,
                location:     ann && ann[:location],
                name:         ann && ann[:name],
                is_structure: ann && ann[:structure] || false,

              }
            %}
          {% end %}
          node = XML.parse(request.body)
          new(
            {% for name, props in properties %}
            {% if props[:location] == :body_io %}
              {% if props[:is_structure] == true %}
                {{name.id}}: {{props[:type]}}.deserialize(
                  node.xpath_node({{props[:name]}}).not_nil!
                ),
              {% else %}
                {{name.id}}: request.body.bytes,
              {% end %}
            {% elsif props[:location] == :header %}
              {%if props[:type] == String %}
                {{name.id}}: request.headers[{{props[:name]}}],
              {% end %}
            {% end %}
          {% end %}
          )
          {% end %}
        end
      end
    end
  end
end
