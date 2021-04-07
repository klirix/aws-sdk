module Aws::Sdk
  VERSION = "0.1.0"

  # TODO: Put your code here
end

require "http"
require "./clients/s3"

class S3
  extend AWSSdk::AmazonS3
end

pp S3.put_bucket_replication(AWSSdk::AmazonS3::PutBucketReplicationRequest.new("buck",
  replication_configuration: AWSSdk::AmazonS3::ReplicationConfigurationStruct.new(
    role: "role",
    rules: AWSSdk::AmazonS3::ReplicationRuleStruct.new(
      status: "status",
      destination: AWSSdk::AmazonS3::DestinationStruct.new(
        "buck2"
      )
    )
  )
))
