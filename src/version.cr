module Aws::Sdk
  VERSION = "0.1.0"

  # TODO: Put your code here
end

require "http"
require "./clients/s3"
require "./clients/appconfig"
require "./build"

include AWSSdk

class MyClient < AWSSdk::Client
  include AmazonS3::Methods
  include AmazonAppConfig::Methods

  module CLientNames
    getter name = "UNdefined"
  end
end

my_client = MyClient.new

my_client.appconfig.update_configuration_profile("app", "config")

pp my_client.s3.put_object(
  bucket: "buckcket",
  key: "tex .txt",
  body: File.open("shard.yml")
)

enum Status
  Private
  Delegate
end
