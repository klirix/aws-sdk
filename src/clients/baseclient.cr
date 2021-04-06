require "http"

class AWSSdk::Client

  class_property region : String?

  def self.send(request : HTTP::Request, prefix : String, success_code : Int = 200)
    http = HTTP::Client.new "#{prefix}#{region ? "-#{region}" : ""}.amazonaws.com"
    http.exec request
  end

end
