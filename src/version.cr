module Aws::Sdk
  VERSION = "0.1.0"

  # TODO: Put your code here
end

require "http"
require "./clients/s3"
require "./clients/lightsail"

include AWSSdk

class MyClient < AWSSdk::Client
  include AmazonS3::Methods
  include AmazonLightsail::Methods
end

s3client = MyClient.new

pp s3client.s3.put_object(
  bucket: "buckcket",
  key: "tex .txt",
  body: File.open("shard.yml")
)
