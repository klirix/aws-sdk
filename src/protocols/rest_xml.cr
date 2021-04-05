require "./protocol.cr"

module AWSSdk
  module RestXML
    include Protocol
    module Structure
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
      def serialize(xml : XML::Builder)
        {% for name, props in properties %}
          {% if props[:location] == :body %}
            {% if props[:structure] %}
              xml.element({{props[:name]}}) {
                {{name.id}}.serialize(xml)
              }
            {% elsif props[:type] <= Array %}
              {{name.id}}.each do |el|
                xml.element({{props[:name]}}) {
                  {% if [String, Float32, Int32].includes? props[:type].type_vars[0]  %}
                    xml.text el
                  {% else %}
                    xml.text el
                  {% end %}
                }
              end
            {% else %}
              xml.element({{props[:name]}}) { xml.text {{name.id}}}
            {% end %}
          {% end %}
        {% end %}
      end
      def self.deserialize(xml : XML::Node)
        {% for name, props in properties %}
          {% if props[:location] == :body %}
            {% if props[:structure] %}
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
      end
      def process(request : HTTP::Request)
        {% for name, props in properties %}
          {% if props[:location] == :query %}
            request.query[{{props[:name]}}] = @{{name.id}}
          {% elsif props[:location] == :header %}
            request.headers[{{props[:name]}}] = @{{name.id}}
          {% end %}
        {% end %}
      end
      {% end %}
    end
  end
end
