require "../codegen/aws_codegen.cr"

service = AWSCodegen::Service.from_json(File.read(ARGV[0]))

pp service
