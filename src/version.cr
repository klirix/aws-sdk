module Aws::Sdk
  VERSION = "0.1.0"

  # TODO: Put your code here
end

require "http"
require "./clients/s3"

include AWSSdk

class MyClient < AWSSdk::Client
  include AmazonS3::Methods
end

s3client = MyClient.new

pp s3client.put_object(AmazonS3::PutObjectRequest.new(
  bucket: "buckcket",
  key: "tex .txt",
  body: File.open("shard.yml")
))
