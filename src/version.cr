module Aws::Sdk
  VERSION = "0.1.0"

  # TODO: Put your code here
end

require "http"
require "./clients/s3"
require "./clients/appconfig"
require "./clients/lightsail"
require "./build"

include AWSSdk

class MyClient < AWSSdk::Client
  include AmazonS3::Methods
  include Lightsail::Methods
end

my_client = MyClient.new

result = my_client.lightsail.get_static_ips(Lightsail::GetStaticIpsRequest.new)

pp result
