module Aws::Sdk
  VERSION = "0.1.0"

  # TODO: Put your code here
end

require "http"
require "./clients/s3"

class S3
  extend AWSSdk::AmazonS3
end

pp S3.list_objects(AWSSdk::AmazonS3::ListObjectsRequest.new("test"))
