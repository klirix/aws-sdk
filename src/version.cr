module Aws::Sdk
  VERSION = "0.1.0"

  # TODO: Put your code here
end

require "http"
require "./clients/s3"

include AWSSdk

class S3
  extend AmazonS3
end

S3.put_object(AmazonS3::PutObjectRequest.new(
  bucket: "buckcket",
  key: "tex .txt",
  body: File.open("shard.yml")
))
