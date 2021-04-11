require "http"

abstract class AWSSdk::Client

  setter region : String?

  DEFAULT_REGION = "us-east-1"

  def region : String
    @region || DEFAULT_REGION
  end

  def send(request : HTTP::Request, prefix : String, success_code : Int32? = 200)
    http = HTTP::Client.new "#{prefix}.#{region}.amazonaws.com"
    http.exec request
  end

  def initialize(region_override : String? = nil)
    @region = region_override if region_override
  end

end
