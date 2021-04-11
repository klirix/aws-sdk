# aws-sdk

WIP!!!

This is not as much as an AWS library itself, as much as a reverse-engeneered codegen for smithy json AST + simple general aws client.

Smithy types are up to date with typescript aws sdk v3 library/

TODO: 
- [x] Turn Smithy JSON-AST into AST nodes
- [x] Turn the AST nodes into Type structures with traits
- [x] Accurately parse traits according to types
- [x] Turn the Type --structures into macros-- generate code via ECR

--- OBSOLETE ---
- [x] Process request to set query vars
- [x] Process request to set headers
- [ ] Make the scalar structures be both JSON and XML serializable
- - [ ] Process request to set xml body
- - [ ] Process response to parse xml
- [ ] Process request to set json
--- /OBSOLETE --- 

- [x] Place location data into annotations
- [ ] Protocols
- - [x] XML Rest (Functional! 💫)
- - 1. [x] Serialize \ Deserialize
- - 2. [x] Request \ Response processing
- - 3. [ ] Exceptions
- - [ ] JSON Rest
- - 1. [ ] Serialize \ Deserialize
- - 2. [ ] Request \ Response processing
- - 3. [ ] Exceptions
- - [ ] JSON 1.1
- - 1. [ ] Serialize \ Deserialize
- - 2. [ ] Request \ Response processing
- - 3. [ ] Exceptions
- - [ ] Query
- - 1. [ ] Serialize \ Deserialize
- - 2. [ ] Request \ Response processing
- - 3. [ ] Exceptions
- - [ ] EC2
- - 1. [ ] Serialize \ Deserialize
- - 2. [ ] Request \ Response processing
- - 3. [ ] Exceptions
- [x] Figure out modular client architecture
- [ ] Add macro settings for the client
- [ ] Use awscr-signer to sign requests
- [ ] Specs and docs

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     aws-sdk:
       github: klirix/aws-sdk
   ```

2. Run `shards install`

## Usage

## Do not

Do not use it for now

```ruby
class MyClient < AWSSDK::Client
  include AmazonS3::Methods
  include AmazonLightsail::Methods

  access_key ENV["ACCESS_KEY"]
  secret_key ENV["SECRET_KEY"]
  region "us-east-1"
end

aws_client = MyClient.new(region: "region_override")

buckets = aws_client.s3.get_bucket_objects "buck"
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/klirix/aws-sdk/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Askhat Saiapov](https://github.com/your-github-user) - creator and maintainer
