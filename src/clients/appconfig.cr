
require "../protocols/rest_json"

module AWSSdk::AmazonAppConfig
  ENDPOINT_PREFIX = "appconfig"


      # <p>An application in AppConfig is a logical unit of code that provides capabilities for your
  # customers. For example, an application can be a microservice that runs on Amazon EC2 instances,
  # a mobile application installed by your users, a serverless application using Amazon API
  # Gateway and AWS Lambda, or any system you run on behalf of others.</p>
  def create_application(input : CreateApplicationRequest) : Application
    path = "/applications"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 201)
  end



      # <p>Information that enables AppConfig to access the configuration source. Valid
  # configuration sources include Systems Manager (SSM) documents, SSM Parameter Store parameters, and
  # Amazon S3 objects. A configuration profile includes the following information.</p>
  # <ul>
  # <li>
  # <p>The Uri location of the configuration data.</p>
  # </li>
  # <li>
  # <p>The AWS Identity and Access Management (IAM) role that provides access to the configuration data.</p>
  # </li>
  # <li>
  # <p>A validator for the configuration data. Available validators include either a JSON
  # Schema or an AWS Lambda function.</p>
  # </li>
  # </ul>
  # <p>For more information, see <a href="http://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig-creating-configuration-and-profile.html">Create a
  # Configuration and a Configuration Profile</a> in the
  # <i>AWS AppConfig User Guide</i>.</p>
  def create_configuration_profile(input : CreateConfigurationProfileRequest) : ConfigurationProfile
    path = "/applications/{ApplicationId}/configurationprofiles"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 201)
  end



      # <p>A deployment strategy defines important criteria for rolling out your configuration to
  # the designated targets. A deployment strategy includes: the overall duration required, a
  # percentage of targets to receive the deployment during each interval, an algorithm that
  # defines how percentage grows, and bake time.</p>
  def create_deployment_strategy(input : CreateDeploymentStrategyRequest) : DeploymentStrategy
    path = "/deploymentstrategies"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 201)
  end



      # <p>For each application, you define one or more environments. An environment is a logical
  # deployment group of AppConfig targets, such as applications in a <code>Beta</code> or
  # <code>Production</code> environment. You can also define environments for application
  # subcomponents such as the <code>Web</code>, <code>Mobile</code> and <code>Back-end</code>
  # components for your application. You can configure Amazon CloudWatch alarms for each environment.
  # The system monitors alarms during a configuration deployment. If an alarm is triggered, the
  # system rolls back the configuration.</p>
  def create_environment(input : CreateEnvironmentRequest) : Environment
    path = "/applications/{ApplicationId}/environments"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 201)
  end



      # <p>Create a new configuration in the AppConfig configuration store.</p>
  def create_hosted_configuration_version(input : CreateHostedConfigurationVersionRequest) : HostedConfigurationVersion
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path.gsub("{ConfigurationProfileId}", label)
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 201)
  end



      # <p>Delete an application. Deleting an application does not delete a configuration from a
  # host.</p>
  def delete_application(input : DeleteApplicationRequest) :   NoReturn
    path = "/applications/{ApplicationId}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 204)
  end



      # <p>Delete a configuration profile. Deleting a configuration profile does not delete a
  # configuration from a host.</p>
  def delete_configuration_profile(input : DeleteConfigurationProfileRequest) :   NoReturn
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path.gsub("{ConfigurationProfileId}", label)
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 204)
  end



      # <p>Delete a deployment strategy. Deleting a deployment strategy does not delete a
  # configuration from a host.</p>
  def delete_deployment_strategy(input : DeleteDeploymentStrategyRequest) :   NoReturn
    path = "/deployementstrategies/{DeploymentStrategyId}"
    if label = input.deployment_strategy_id
      path.gsub("{DeploymentStrategyId}", label)
    else
      raise "No value provided for input HTTP label: DeploymentStrategyId"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 204)
  end



      # <p>Delete an environment. Deleting an environment does not delete a configuration from a
  # host.</p>
  def delete_environment(input : DeleteEnvironmentRequest) :   NoReturn
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path.gsub("{EnvironmentId}", label)
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 204)
  end



      # <p>Delete a version of a configuration from the AppConfig configuration store.</p>
  def delete_hosted_configuration_version(input : DeleteHostedConfigurationVersionRequest) :   NoReturn
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions/{VersionNumber}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path.gsub("{ConfigurationProfileId}", label)
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    if label = input.version_number
      path.gsub("{VersionNumber}", label)
    else
      raise "No value provided for input HTTP label: VersionNumber"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 204)
  end



      # <p>Retrieve information about an application.</p>
  def get_application(input : GetApplicationRequest) : Application
    path = "/applications/{ApplicationId}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Receive information about a configuration.</p>
  # <important>
  # <p>AWS AppConfig uses the value of the <code>ClientConfigurationVersion</code> parameter
  # to identify the configuration version on your clients. If you don’t send
  # <code>ClientConfigurationVersion</code> with each call to
  # <code>GetConfiguration</code>, your clients receive the current configuration. You
  # are charged each time your clients receive a configuration.</p>
  # <p>To avoid excess charges, we recommend that you include the
  # <code>ClientConfigurationVersion</code> value with every call to
  # <code>GetConfiguration</code>. This value must be saved on your client. Subsequent
  # calls to <code>GetConfiguration</code> must pass this value by using the
  # <code>ClientConfigurationVersion</code> parameter. </p>
  # </important>
  def get_configuration(input : GetConfigurationRequest) : Configuration
    path = "/applications/{Application}/environments/{Environment}/configurations/{Configuration}"
    if label = input.application
      path.gsub("{Application}", label)
    else
      raise "No value provided for input HTTP label: Application"
    end
    if label = input.environment
      path.gsub("{Environment}", label)
    else
      raise "No value provided for input HTTP label: Environment"
    end
    if label = input.configuration
      path.gsub("{Configuration}", label)
    else
      raise "No value provided for input HTTP label: Configuration"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Retrieve information about a configuration profile.</p>
  def get_configuration_profile(input : GetConfigurationProfileRequest) : ConfigurationProfile
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path.gsub("{ConfigurationProfileId}", label)
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Retrieve information about a configuration deployment.</p>
  def get_deployment(input : GetDeploymentRequest) : Deployment
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path.gsub("{EnvironmentId}", label)
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    if label = input.deployment_number
      path.gsub("{DeploymentNumber}", label)
    else
      raise "No value provided for input HTTP label: DeploymentNumber"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Retrieve information about a deployment strategy. A deployment strategy defines
  # important criteria for rolling out your configuration to the designated targets. A
  # deployment strategy includes: the overall duration required, a percentage of targets to
  # receive the deployment during each interval, an algorithm that defines how percentage
  # grows, and bake time.</p>
  def get_deployment_strategy(input : GetDeploymentStrategyRequest) : DeploymentStrategy
    path = "/deploymentstrategies/{DeploymentStrategyId}"
    if label = input.deployment_strategy_id
      path.gsub("{DeploymentStrategyId}", label)
    else
      raise "No value provided for input HTTP label: DeploymentStrategyId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Retrieve information about an environment. An environment is a logical deployment group
  # of AppConfig applications, such as applications in a <code>Production</code> environment or
  # in an <code>EU_Region</code> environment. Each configuration deployment targets an
  # environment. You can enable one or more Amazon CloudWatch alarms for an environment. If an alarm is
  # triggered during a deployment, AppConfig roles back the configuration.</p>
  def get_environment(input : GetEnvironmentRequest) : Environment
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path.gsub("{EnvironmentId}", label)
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Get information about a specific configuration version.</p>
  def get_hosted_configuration_version(input : GetHostedConfigurationVersionRequest) : HostedConfigurationVersion
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions/{VersionNumber}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path.gsub("{ConfigurationProfileId}", label)
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    if label = input.version_number
      path.gsub("{VersionNumber}", label)
    else
      raise "No value provided for input HTTP label: VersionNumber"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>List all applications in your AWS account.</p>
  def list_applications(input : ListApplicationsRequest) : Applications
    path = "/applications"
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Lists the configuration profiles for an application.</p>
  def list_configuration_profiles(input : ListConfigurationProfilesRequest) : ConfigurationProfiles
    path = "/applications/{ApplicationId}/configurationprofiles"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Lists the deployments for an environment.</p>
  def list_deployments(input : ListDeploymentsRequest) : Deployments
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path.gsub("{EnvironmentId}", label)
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>List deployment strategies.</p>
  def list_deployment_strategies(input : ListDeploymentStrategiesRequest) : DeploymentStrategies
    path = "/deploymentstrategies"
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>List the environments for an application.</p>
  def list_environments(input : ListEnvironmentsRequest) : Environments
    path = "/applications/{ApplicationId}/environments"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>View a list of configurations stored in the AppConfig configuration store by
  # version.</p>
  def list_hosted_configuration_versions(input : ListHostedConfigurationVersionsRequest) : HostedConfigurationVersions
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path.gsub("{ConfigurationProfileId}", label)
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Retrieves the list of key-value tags assigned to the resource.</p>
  def list_tags_for_resource(input : ListTagsForResourceRequest) : ResourceTags
    path = "/tags/{ResourceArn}"
    if label = input.resource_arn
      path.gsub("{ResourceArn}", label)
    else
      raise "No value provided for input HTTP label: ResourceArn"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Starts a deployment.</p>
  def start_deployment(input : StartDeploymentRequest) : Deployment
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path.gsub("{EnvironmentId}", label)
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 201)
  end



      # <p>Stops a deployment. This API action works only on deployments that have a status of
  # <code>DEPLOYING</code>. This action moves the deployment to a status of
  # <code>ROLLED_BACK</code>.</p>
  def stop_deployment(input : StopDeploymentRequest) : Deployment
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path.gsub("{EnvironmentId}", label)
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    if label = input.deployment_number
      path.gsub("{DeploymentNumber}", label)
    else
      raise "No value provided for input HTTP label: DeploymentNumber"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 202)
  end



      # <p>Metadata to assign to an AppConfig resource. Tags help organize and categorize your
  # AppConfig resources. Each tag consists of a key and an optional value, both of which you
  # define. You can specify a maximum of 50 tags for a resource.</p>
  def tag_resource(input : TagResourceRequest) :   NoReturn
    path = "/tags/{ResourceArn}"
    if label = input.resource_arn
      path.gsub("{ResourceArn}", label)
    else
      raise "No value provided for input HTTP label: ResourceArn"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 204)
  end



      # <p>Deletes a tag key and value from an AppConfig resource.</p>
  def untag_resource(input : UntagResourceRequest) :   NoReturn
    path = "/tags/{ResourceArn}"
    if label = input.resource_arn
      path.gsub("{ResourceArn}", label)
    else
      raise "No value provided for input HTTP label: ResourceArn"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 204)
  end



      # <p>Updates an application.</p>
  def update_application(input : UpdateApplicationRequest) : Application
    path = "/applications/{ApplicationId}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("PATCH", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Updates a configuration profile.</p>
  def update_configuration_profile(input : UpdateConfigurationProfileRequest) : ConfigurationProfile
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path.gsub("{ConfigurationProfileId}", label)
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    request = HTTP::Request.new("PATCH", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Updates a deployment strategy.</p>
  def update_deployment_strategy(input : UpdateDeploymentStrategyRequest) : DeploymentStrategy
    path = "/deploymentstrategies/{DeploymentStrategyId}"
    if label = input.deployment_strategy_id
      path.gsub("{DeploymentStrategyId}", label)
    else
      raise "No value provided for input HTTP label: DeploymentStrategyId"
    end
    request = HTTP::Request.new("PATCH", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Updates an environment.</p>
  def update_environment(input : UpdateEnvironmentRequest) : Environment
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path.gsub("{EnvironmentId}", label)
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    request = HTTP::Request.new("PATCH", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 200)
  end



      # <p>Uses the validators in a configuration profile to validate a configuration.</p>
  def validate_configuration(input : ValidateConfigurationRequest) :   NoReturn
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/validators"
    if label = input.application_id
      path.gsub("{ApplicationId}", label)
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path.gsub("{ConfigurationProfileId}", label)
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    AWSSdk::Client.send(request, success_code: 204)
  end





  class CreateApplicationRequest 
  include RestJson

  # <p>A name for the application.</p>
  @[Protocol::Field(location: :body, name: "Name", required: true)]
  property name : String
  # <p>A description of the application.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>Metadata to assign to the application. Tags help organize and categorize your AppConfig
  # resources. Each tag consists of a key and an optional value, both of which you
  # define.</p>
  @[Protocol::Field(location: :body, name: "Tags", required: false)]
  property tags : Hash(String, String)?
end

  class ApplicationStruct 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :body, name: "Id", required: false)]
  property id : String?
  # <p>The application name.</p>
  @[Protocol::Field(location: :body, name: "Name", required: false)]
  property name : String?
  # <p>The description of the application.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
end

  class BadRequestException < Exception
  include RestJson

  # 
  @[Protocol::Field(location: :body, name: "Message", required: false)]
  property message : String?
end

  class InternalServerException < Exception
  include RestJson

  # 
  @[Protocol::Field(location: :body, name: "Message", required: false)]
  property message : String?
end

  class ValidatorStruct 
  include RestJson

  # <p>AppConfig supports validators of type <code>JSON_SCHEMA</code> and
  # <code>LAMBDA</code>
  # </p>
  @[Protocol::Field(location: :body, name: "Type", required: true)]
  property type : String
  # <p>Either the JSON Schema content or the Amazon Resource Name (ARN) of an AWS Lambda
  # function.</p>
  @[Protocol::Field(location: :body, name: "Content", required: true)]
  property content : String
end

  class CreateConfigurationProfileRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>A name for the configuration profile.</p>
  @[Protocol::Field(location: :body, name: "Name", required: true)]
  property name : String
  # <p>A description of the configuration profile.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>A URI to locate the configuration. You can specify a Systems Manager (SSM) document, an SSM
  # Parameter Store parameter, or an Amazon S3 object. For an SSM document, specify either the
  # document name in the format <code>ssm-document://<Document_name></code> or the Amazon
  # Resource Name (ARN). For a parameter, specify either the parameter name in the format
  # <code>ssm-parameter://<Parameter_name></code> or the ARN. For an Amazon S3 object,
  # specify the URI in the following format: <code>s3://<bucket>/<objectKey>
  # </code>. Here is an example: s3://my-bucket/my-app/us-east-1/my-config.json</p>
  @[Protocol::Field(location: :body, name: "LocationUri", required: true)]
  property location_uri : String
  # <p>The ARN of an IAM role with permission to access the configuration at the specified
  # LocationUri.</p>
  @[Protocol::Field(location: :body, name: "RetrievalRoleArn", required: false)]
  property retrieval_role_arn : String?
  # <p>A list of methods for validating the configuration.</p>
  @[Protocol::Field(location: :body, name: "Validators", required: false)]
  property validators : Array(ValidatorStruct)?
  # <p>Metadata to assign to the configuration profile. Tags help organize and categorize your
  # AppConfig resources. Each tag consists of a key and an optional value, both of which you
  # define.</p>
  @[Protocol::Field(location: :body, name: "Tags", required: false)]
  property tags : Hash(String, String)?
end

  class ConfigurationProfileStruct 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :body, name: "ApplicationId", required: false)]
  property application_id : String?
  # <p>The configuration profile ID.</p>
  @[Protocol::Field(location: :body, name: "Id", required: false)]
  property id : String?
  # <p>The name of the configuration profile.</p>
  @[Protocol::Field(location: :body, name: "Name", required: false)]
  property name : String?
  # <p>The configuration profile description.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>The URI location of the configuration.</p>
  @[Protocol::Field(location: :body, name: "LocationUri", required: false)]
  property location_uri : String?
  # <p>The ARN of an IAM role with permission to access the configuration at the specified
  # LocationUri.</p>
  @[Protocol::Field(location: :body, name: "RetrievalRoleArn", required: false)]
  property retrieval_role_arn : String?
  # <p>A list of methods for validating the configuration.</p>
  @[Protocol::Field(location: :body, name: "Validators", required: false)]
  property validators : Array(ValidatorStruct)?
end

  class ResourceNotFoundException < Exception
  include RestJson

  # 
  @[Protocol::Field(location: :body, name: "Message", required: false)]
  property message : String?
  # 
  @[Protocol::Field(location: :body, name: "ResourceName", required: false)]
  property resource_name : String?
end

  class CreateDeploymentStrategyRequest 
  include RestJson

  # <p>A name for the deployment strategy.</p>
  @[Protocol::Field(location: :body, name: "Name", required: true)]
  property name : String
  # <p>A description of the deployment strategy.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>Total amount of time for a deployment to last.</p>
  @[Protocol::Field(location: :body, name: "DeploymentDurationInMinutes", required: true)]
  property deployment_duration_in_minutes : Int32
  # <p>The amount of time AppConfig monitors for alarms before considering the deployment to be
  # complete and no longer eligible for automatic roll back.</p>
  @[Protocol::Field(location: :body, name: "FinalBakeTimeInMinutes", required: false)]
  property final_bake_time_in_minutes : Int32?
  # <p>The percentage of targets to receive a deployed configuration during each
  # interval.</p>
  @[Protocol::Field(location: :body, name: "GrowthFactor", required: true)]
  property growth_factor : Float32
  # <p>The algorithm used to define how percentage grows over time. AWS AppConfig supports the
  # following growth types:</p>
  # <p>
  # <b>Linear</b>: For this type, AppConfig processes the
  # deployment by dividing the total number of targets by the value specified for <code>Step
  # percentage</code>. For example, a linear deployment that uses a <code>Step
  # percentage</code> of 10 deploys the configuration to 10 percent of the hosts. After
  # those deployments are complete, the system deploys the configuration to the next 10
  # percent. This continues until 100% of the targets have successfully received the
  # configuration.</p>
  # 
  # <p>
  # <b>Exponential</b>: For this type, AppConfig processes the
  # deployment exponentially using the following formula: <code>G*(2^N)</code>. In this
  # formula, <code>G</code> is the growth factor specified by the user and <code>N</code> is
  # the number of steps until the configuration is deployed to all targets. For example, if you
  # specify a growth factor of 2, then the system rolls out the configuration as
  # follows:</p>
  # <p>
  # <code>2*(2^0)</code>
  # </p>
  # <p>
  # <code>2*(2^1)</code>
  # </p>
  # <p>
  # <code>2*(2^2)</code>
  # </p>
  # <p>Expressed numerically, the deployment rolls out as follows: 2% of the targets, 4% of the
  # targets, 8% of the targets, and continues until the configuration has been deployed to all
  # targets.</p>
  @[Protocol::Field(location: :body, name: "GrowthType", required: false)]
  property growth_type : String?
  # <p>Save the deployment strategy to a Systems Manager (SSM) document.</p>
  @[Protocol::Field(location: :body, name: "ReplicateTo", required: true)]
  property replicate_to : String
  # <p>Metadata to assign to the deployment strategy. Tags help organize and categorize your
  # AppConfig resources. Each tag consists of a key and an optional value, both of which you
  # define.</p>
  @[Protocol::Field(location: :body, name: "Tags", required: false)]
  property tags : Hash(String, String)?
end

  class DeploymentStrategyStruct 
  include RestJson

  # <p>The deployment strategy ID.</p>
  @[Protocol::Field(location: :body, name: "Id", required: false)]
  property id : String?
  # <p>The name of the deployment strategy.</p>
  @[Protocol::Field(location: :body, name: "Name", required: false)]
  property name : String?
  # <p>The description of the deployment strategy.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>Total amount of time the deployment lasted.</p>
  @[Protocol::Field(location: :body, name: "DeploymentDurationInMinutes", required: false)]
  property deployment_duration_in_minutes : Int32?
  # <p>The algorithm used to define how percentage grew over time.</p>
  @[Protocol::Field(location: :body, name: "GrowthType", required: false)]
  property growth_type : String?
  # <p>The percentage of targets that received a deployed configuration during each
  # interval.</p>
  @[Protocol::Field(location: :body, name: "GrowthFactor", required: false)]
  property growth_factor : Float32?
  # <p>The amount of time AppConfig monitored for alarms before considering the deployment to be
  # complete and no longer eligible for automatic roll back.</p>
  @[Protocol::Field(location: :body, name: "FinalBakeTimeInMinutes", required: false)]
  property final_bake_time_in_minutes : Int32?
  # <p>Save the deployment strategy to a Systems Manager (SSM) document.</p>
  @[Protocol::Field(location: :body, name: "ReplicateTo", required: false)]
  property replicate_to : String?
end

  class MonitorStruct 
  include RestJson

  # <p>ARN of the Amazon CloudWatch alarm.</p>
  @[Protocol::Field(location: :body, name: "AlarmArn", required: false)]
  property alarm_arn : String?
  # <p>ARN of an IAM role for AppConfig to monitor <code>AlarmArn</code>.</p>
  @[Protocol::Field(location: :body, name: "AlarmRoleArn", required: false)]
  property alarm_role_arn : String?
end

  class CreateEnvironmentRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>A name for the environment.</p>
  @[Protocol::Field(location: :body, name: "Name", required: true)]
  property name : String
  # <p>A description of the environment.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>Amazon CloudWatch alarms to monitor during the deployment process.</p>
  @[Protocol::Field(location: :body, name: "Monitors", required: false)]
  property monitors : Array(MonitorStruct)?
  # <p>Metadata to assign to the environment. Tags help organize and categorize your AppConfig
  # resources. Each tag consists of a key and an optional value, both of which you
  # define.</p>
  @[Protocol::Field(location: :body, name: "Tags", required: false)]
  property tags : Hash(String, String)?
end

  class EnvironmentStruct 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :body, name: "ApplicationId", required: false)]
  property application_id : String?
  # <p>The environment ID.</p>
  @[Protocol::Field(location: :body, name: "Id", required: false)]
  property id : String?
  # <p>The name of the environment.</p>
  @[Protocol::Field(location: :body, name: "Name", required: false)]
  property name : String?
  # <p>The description of the environment.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>The state of the environment. An environment can be in one of the following states:
  # <code>READY_FOR_DEPLOYMENT</code>, <code>DEPLOYING</code>, <code>ROLLING_BACK</code>, or
  # <code>ROLLED_BACK</code>
  # </p>
  @[Protocol::Field(location: :body, name: "State", required: false)]
  property state : String?
  # <p>Amazon CloudWatch alarms monitored during the deployment.</p>
  @[Protocol::Field(location: :body, name: "Monitors", required: false)]
  property monitors : Array(MonitorStruct)?
end

  class CreateHostedConfigurationVersionRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The configuration profile ID.</p>
  @[Protocol::Field(location: :uri, name: "ConfigurationProfileId", required: true)]
  property configuration_profile_id : String
  # <p>A description of the configuration.</p>
  @[Protocol::Field(location: :header, name: "Description", required: false)]
  property description : String?
  # <p>The content of the configuration or the configuration data.</p>
  @[Protocol::Field(location: :body_io, required: true)]
  property content : Bytes
  # <p>A standard MIME type describing the format of the configuration content. For more
  # information, see <a href="https://docs.aws.amazon.com/https:/www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.</p>
  @[Protocol::Field(location: :header, name: "Content-Type", required: true)]
  property content_type : String
  # <p>An optional locking token used to prevent race conditions from overwriting configuration
  # updates when creating a new version. To ensure your data is not overwritten when creating
  # multiple hosted configuration versions in rapid succession, specify the version of the
  # latest hosted configuration version.</p>
  @[Protocol::Field(location: :header, name: "Latest-Version-Number", required: false)]
  property latest_version_number : Int32?
end

  class HostedConfigurationVersionStruct 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :header, name: "Application-Id", required: false)]
  property application_id : String?
  # <p>The configuration profile ID.</p>
  @[Protocol::Field(location: :header, name: "Configuration-Profile-Id", required: false)]
  property configuration_profile_id : String?
  # <p>The configuration version.</p>
  @[Protocol::Field(location: :header, name: "Version-Number", required: false)]
  property version_number : Int32?
  # <p>A description of the configuration.</p>
  @[Protocol::Field(location: :header, name: "Description", required: false)]
  property description : String?
  # <p>The content of the configuration or the configuration data.</p>
  @[Protocol::Field(location: :body_io, required: false)]
  property content : Bytes?
  # <p>A standard MIME type describing the format of the configuration content. For more
  # information, see <a href="https://docs.aws.amazon.com/https:/www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.</p>
  @[Protocol::Field(location: :header, name: "Content-Type", required: false)]
  property content_type : String?
end

  class ConflictException < Exception
  include RestJson

  # 
  @[Protocol::Field(location: :body, name: "Message", required: false)]
  property message : String?
end

  class PayloadTooLargeException < Exception
  include RestJson

  # 
  @[Protocol::Field(location: :body, name: "Message", required: false)]
  property message : String?
  # 
  @[Protocol::Field(location: :body, name: "Measure", required: false)]
  property measure : String?
  # 
  @[Protocol::Field(location: :body, name: "Limit", required: false)]
  property limit : Float32?
  # 
  @[Protocol::Field(location: :body, name: "Size", required: false)]
  property size : Float32?
end

  class ServiceQuotaExceededException < Exception
  include RestJson

  # 
  @[Protocol::Field(location: :body, name: "Message", required: false)]
  property message : String?
end

  class DeleteApplicationRequest 
  include RestJson

  # <p>The ID of the application to delete.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
end

  class DeleteConfigurationProfileRequest 
  include RestJson

  # <p>The application ID that includes the configuration profile you want to delete.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The ID of the configuration profile you want to delete.</p>
  @[Protocol::Field(location: :uri, name: "ConfigurationProfileId", required: true)]
  property configuration_profile_id : String
end

  class DeleteDeploymentStrategyRequest 
  include RestJson

  # <p>The ID of the deployment strategy you want to delete.</p>
  @[Protocol::Field(location: :uri, name: "DeploymentStrategyId", required: true)]
  property deployment_strategy_id : String
end

  class DeleteEnvironmentRequest 
  include RestJson

  # <p>The application ID that includes the environment you want to delete.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The ID of the environment you want to delete.</p>
  @[Protocol::Field(location: :uri, name: "EnvironmentId", required: true)]
  property environment_id : String
end

  class DeleteHostedConfigurationVersionRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The configuration profile ID.</p>
  @[Protocol::Field(location: :uri, name: "ConfigurationProfileId", required: true)]
  property configuration_profile_id : String
  # <p>The versions number to delete.</p>
  @[Protocol::Field(location: :uri, name: "VersionNumber", required: true)]
  property version_number : Int32
end

  class GetApplicationRequest 
  include RestJson

  # <p>The ID of the application you want to get.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
end

  class GetConfigurationRequest 
  include RestJson

  # <p>The application to get. Specify either the application name or the application
  # ID.</p>
  @[Protocol::Field(location: :uri, name: "Application", required: true)]
  property application : String
  # <p>The environment to get. Specify either the environment name or the environment
  # ID.</p>
  @[Protocol::Field(location: :uri, name: "Environment", required: true)]
  property environment : String
  # <p>The configuration to get. Specify either the configuration name or the configuration
  # ID.</p>
  @[Protocol::Field(location: :uri, name: "Configuration", required: true)]
  property configuration : String
  # <p>A unique ID to identify the client for the configuration. This ID enables AppConfig to
  # deploy the configuration in intervals, as defined in the deployment strategy.</p>
  @[Protocol::Field(location: :query, name: "client_id", required: true)]
  property client_id : String
  # <p>The configuration version returned in the most recent <code>GetConfiguration</code>
  # response.</p>
  # <important>
  # <p>AWS AppConfig uses the value of the <code>ClientConfigurationVersion</code> parameter
  # to identify the configuration version on your clients. If you don’t send
  # <code>ClientConfigurationVersion</code> with each call to
  # <code>GetConfiguration</code>, your clients receive the current configuration. You
  # are charged each time your clients receive a configuration.</p>
  # <p>To avoid excess charges, we recommend that you include the
  # <code>ClientConfigurationVersion</code> value with every call to
  # <code>GetConfiguration</code>. This value must be saved on your client. Subsequent
  # calls to <code>GetConfiguration</code> must pass this value by using the
  # <code>ClientConfigurationVersion</code> parameter. </p>
  # </important>
  # <p>For more information about working with configurations, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig-retrieving-the-configuration.html">Retrieving the Configuration</a> in the
  # <i>AWS AppConfig User Guide</i>.</p>
  @[Protocol::Field(location: :query, name: "client_configuration_version", required: false)]
  property client_configuration_version : String?
end

  class ConfigurationStruct 
  include RestJson

  # <p>The content of the configuration or the configuration data.</p>
  @[Protocol::Field(location: :body_io, required: false)]
  property content : Bytes?
  # <p>The configuration version.</p>
  @[Protocol::Field(location: :header, name: "Configuration-Version", required: false)]
  property configuration_version : String?
  # <p>A standard MIME type describing the format of the configuration content. For more
  # information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.</p>
  @[Protocol::Field(location: :header, name: "Content-Type", required: false)]
  property content_type : String?
end

  class GetConfigurationProfileRequest 
  include RestJson

  # <p>The ID of the application that includes the configuration profile you want to
  # get.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The ID of the configuration profile you want to get.</p>
  @[Protocol::Field(location: :uri, name: "ConfigurationProfileId", required: true)]
  property configuration_profile_id : String
end

  class GetDeploymentRequest 
  include RestJson

  # <p>The ID of the application that includes the deployment you want to get. </p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The ID of the environment that includes the deployment you want to get. </p>
  @[Protocol::Field(location: :uri, name: "EnvironmentId", required: true)]
  property environment_id : String
  # <p>The sequence number of the deployment.</p>
  @[Protocol::Field(location: :uri, name: "DeploymentNumber", required: true)]
  property deployment_number : Int32
end

  class DeploymentEventStruct 
  include RestJson

  # <p>The type of deployment event. Deployment event types include the start, stop, or
  # completion of a deployment; a percentage update; the start or stop of a bake period; the
  # start or completion of a rollback.</p>
  @[Protocol::Field(location: :body, name: "EventType", required: false)]
  property event_type : String?
  # <p>The entity that triggered the deployment event. Events can be triggered by a user, AWS
  # AppConfig, an Amazon CloudWatch alarm, or an internal error.</p>
  @[Protocol::Field(location: :body, name: "TriggeredBy", required: false)]
  property triggered_by : String?
  # <p>A description of the deployment event. Descriptions include, but are not limited to, the
  # user account or the CloudWatch alarm ARN that initiated a rollback, the percentage of hosts
  # that received the deployment, or in the case of an internal error, a recommendation to
  # attempt a new deployment.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>The date and time the event occurred.</p>
  @[Protocol::Field(location: :body, name: "OccurredAt", required: false)]
  property occurred_at : Time?
end

  class DeploymentStruct 
  include RestJson

  # <p>The ID of the application that was deployed.</p>
  @[Protocol::Field(location: :body, name: "ApplicationId", required: false)]
  property application_id : String?
  # <p>The ID of the environment that was deployed.</p>
  @[Protocol::Field(location: :body, name: "EnvironmentId", required: false)]
  property environment_id : String?
  # <p>The ID of the deployment strategy that was deployed.</p>
  @[Protocol::Field(location: :body, name: "DeploymentStrategyId", required: false)]
  property deployment_strategy_id : String?
  # <p>The ID of the configuration profile that was deployed.</p>
  @[Protocol::Field(location: :body, name: "ConfigurationProfileId", required: false)]
  property configuration_profile_id : String?
  # <p>The sequence number of the deployment.</p>
  @[Protocol::Field(location: :body, name: "DeploymentNumber", required: false)]
  property deployment_number : Int32?
  # <p>The name of the configuration.</p>
  @[Protocol::Field(location: :body, name: "ConfigurationName", required: false)]
  property configuration_name : String?
  # <p>Information about the source location of the configuration.</p>
  @[Protocol::Field(location: :body, name: "ConfigurationLocationUri", required: false)]
  property configuration_location_uri : String?
  # <p>The configuration version that was deployed.</p>
  @[Protocol::Field(location: :body, name: "ConfigurationVersion", required: false)]
  property configuration_version : String?
  # <p>The description of the deployment.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>Total amount of time the deployment lasted.</p>
  @[Protocol::Field(location: :body, name: "DeploymentDurationInMinutes", required: false)]
  property deployment_duration_in_minutes : Int32?
  # <p>The algorithm used to define how percentage grew over time.</p>
  @[Protocol::Field(location: :body, name: "GrowthType", required: false)]
  property growth_type : String?
  # <p>The percentage of targets to receive a deployed configuration during each
  # interval.</p>
  @[Protocol::Field(location: :body, name: "GrowthFactor", required: false)]
  property growth_factor : Float32?
  # <p>The amount of time AppConfig monitored for alarms before considering the deployment to be
  # complete and no longer eligible for automatic roll back.</p>
  @[Protocol::Field(location: :body, name: "FinalBakeTimeInMinutes", required: false)]
  property final_bake_time_in_minutes : Int32?
  # <p>The state of the deployment.</p>
  @[Protocol::Field(location: :body, name: "State", required: false)]
  property state : String?
  # <p>A list containing all events related to a deployment. The most recent events are
  # displayed first.</p>
  @[Protocol::Field(location: :body, name: "EventLog", required: false)]
  property event_log : Array(DeploymentEventStruct)?
  # <p>The percentage of targets for which the deployment is available.</p>
  @[Protocol::Field(location: :body, name: "PercentageComplete", required: false)]
  property percentage_complete : Float32?
  # <p>The time the deployment started.</p>
  @[Protocol::Field(location: :body, name: "StartedAt", required: false)]
  property started_at : Time?
  # <p>The time the deployment completed. </p>
  @[Protocol::Field(location: :body, name: "CompletedAt", required: false)]
  property completed_at : Time?
end

  class GetDeploymentStrategyRequest 
  include RestJson

  # <p>The ID of the deployment strategy to get.</p>
  @[Protocol::Field(location: :uri, name: "DeploymentStrategyId", required: true)]
  property deployment_strategy_id : String
end

  class GetEnvironmentRequest 
  include RestJson

  # <p>The ID of the application that includes the environment you want to get.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The ID of the environment you wnat to get.</p>
  @[Protocol::Field(location: :uri, name: "EnvironmentId", required: true)]
  property environment_id : String
end

  class GetHostedConfigurationVersionRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The configuration profile ID.</p>
  @[Protocol::Field(location: :uri, name: "ConfigurationProfileId", required: true)]
  property configuration_profile_id : String
  # <p>The version.</p>
  @[Protocol::Field(location: :uri, name: "VersionNumber", required: true)]
  property version_number : Int32
end

  class ListApplicationsRequest 
  include RestJson

  # <p>The maximum number of items to return for this call. The call also returns a token that
  # you can specify in a subsequent call to get the next set of results.</p>
  @[Protocol::Field(location: :query, name: "max_results", required: false)]
  property max_results : Int32?
  # <p>A token to start the list. Use this token to get the next set of results.</p>
  @[Protocol::Field(location: :query, name: "next_token", required: false)]
  property next_token : String?
end

  class ApplicationsStruct 
  include RestJson

  # <p>The elements from this collection.</p>
  @[Protocol::Field(location: :body, name: "Items", required: false)]
  property items : Array(ApplicationStruct)?
  # <p>The token for the next set of items to return. Use this token to get the next set of
  # results.</p>
  @[Protocol::Field(location: :body, name: "NextToken", required: false)]
  property next_token : String?
end

  class ListConfigurationProfilesRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The maximum number of items to return for this call. The call also returns a token that
  # you can specify in a subsequent call to get the next set of results.</p>
  @[Protocol::Field(location: :query, name: "max_results", required: false)]
  property max_results : Int32?
  # <p>A token to start the list. Use this token to get the next set of results.</p>
  @[Protocol::Field(location: :query, name: "next_token", required: false)]
  property next_token : String?
end

  class ConfigurationProfileSummaryStruct 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :body, name: "ApplicationId", required: false)]
  property application_id : String?
  # <p>The ID of the configuration profile.</p>
  @[Protocol::Field(location: :body, name: "Id", required: false)]
  property id : String?
  # <p>The name of the configuration profile.</p>
  @[Protocol::Field(location: :body, name: "Name", required: false)]
  property name : String?
  # <p>The URI location of the configuration.</p>
  @[Protocol::Field(location: :body, name: "LocationUri", required: false)]
  property location_uri : String?
  # <p>The types of validators in the configuration profile.</p>
  @[Protocol::Field(location: :body, name: "ValidatorTypes", required: false)]
  property validator_types : Array(String)?
end

  class ConfigurationProfilesStruct 
  include RestJson

  # <p>The elements from this collection.</p>
  @[Protocol::Field(location: :body, name: "Items", required: false)]
  property items : Array(ConfigurationProfileSummaryStruct)?
  # <p>The token for the next set of items to return. Use this token to get the next set of
  # results.</p>
  @[Protocol::Field(location: :body, name: "NextToken", required: false)]
  property next_token : String?
end

  class ListDeploymentsRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The environment ID.</p>
  @[Protocol::Field(location: :uri, name: "EnvironmentId", required: true)]
  property environment_id : String
  # <p>The maximum number of items to return for this call. The call also returns a token that
  # you can specify in a subsequent call to get the next set of results.</p>
  @[Protocol::Field(location: :query, name: "max_results", required: false)]
  property max_results : Int32?
  # <p>A token to start the list. Use this token to get the next set of results.</p>
  @[Protocol::Field(location: :query, name: "next_token", required: false)]
  property next_token : String?
end

  class DeploymentSummaryStruct 
  include RestJson

  # <p>The sequence number of the deployment.</p>
  @[Protocol::Field(location: :body, name: "DeploymentNumber", required: false)]
  property deployment_number : Int32?
  # <p>The name of the configuration.</p>
  @[Protocol::Field(location: :body, name: "ConfigurationName", required: false)]
  property configuration_name : String?
  # <p>The version of the configuration.</p>
  @[Protocol::Field(location: :body, name: "ConfigurationVersion", required: false)]
  property configuration_version : String?
  # <p>Total amount of time the deployment lasted.</p>
  @[Protocol::Field(location: :body, name: "DeploymentDurationInMinutes", required: false)]
  property deployment_duration_in_minutes : Int32?
  # <p>The algorithm used to define how percentage grows over time.</p>
  @[Protocol::Field(location: :body, name: "GrowthType", required: false)]
  property growth_type : String?
  # <p>The percentage of targets to receive a deployed configuration during each
  # interval.</p>
  @[Protocol::Field(location: :body, name: "GrowthFactor", required: false)]
  property growth_factor : Float32?
  # <p>The amount of time AppConfig monitors for alarms before considering the deployment to be
  # complete and no longer eligible for automatic roll back.</p>
  @[Protocol::Field(location: :body, name: "FinalBakeTimeInMinutes", required: false)]
  property final_bake_time_in_minutes : Int32?
  # <p>The state of the deployment.</p>
  @[Protocol::Field(location: :body, name: "State", required: false)]
  property state : String?
  # <p>The percentage of targets for which the deployment is available.</p>
  @[Protocol::Field(location: :body, name: "PercentageComplete", required: false)]
  property percentage_complete : Float32?
  # <p>Time the deployment started.</p>
  @[Protocol::Field(location: :body, name: "StartedAt", required: false)]
  property started_at : Time?
  # <p>Time the deployment completed.</p>
  @[Protocol::Field(location: :body, name: "CompletedAt", required: false)]
  property completed_at : Time?
end

  class DeploymentsStruct 
  include RestJson

  # <p>The elements from this collection.</p>
  @[Protocol::Field(location: :body, name: "Items", required: false)]
  property items : Array(DeploymentSummaryStruct)?
  # <p>The token for the next set of items to return. Use this token to get the next set of
  # results.</p>
  @[Protocol::Field(location: :body, name: "NextToken", required: false)]
  property next_token : String?
end

  class ListDeploymentStrategiesRequest 
  include RestJson

  # <p>The maximum number of items to return for this call. The call also returns a token that
  # you can specify in a subsequent call to get the next set of results.</p>
  @[Protocol::Field(location: :query, name: "max_results", required: false)]
  property max_results : Int32?
  # <p>A token to start the list. Use this token to get the next set of results.</p>
  @[Protocol::Field(location: :query, name: "next_token", required: false)]
  property next_token : String?
end

  class DeploymentStrategiesStruct 
  include RestJson

  # <p>The elements from this collection.</p>
  @[Protocol::Field(location: :body, name: "Items", required: false)]
  property items : Array(DeploymentStrategyStruct)?
  # <p>The token for the next set of items to return. Use this token to get the next set of
  # results.</p>
  @[Protocol::Field(location: :body, name: "NextToken", required: false)]
  property next_token : String?
end

  class ListEnvironmentsRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The maximum number of items to return for this call. The call also returns a token that
  # you can specify in a subsequent call to get the next set of results.</p>
  @[Protocol::Field(location: :query, name: "max_results", required: false)]
  property max_results : Int32?
  # <p>A token to start the list. Use this token to get the next set of results.</p>
  @[Protocol::Field(location: :query, name: "next_token", required: false)]
  property next_token : String?
end

  class EnvironmentsStruct 
  include RestJson

  # <p>The elements from this collection.</p>
  @[Protocol::Field(location: :body, name: "Items", required: false)]
  property items : Array(EnvironmentStruct)?
  # <p>The token for the next set of items to return. Use this token to get the next set of
  # results.</p>
  @[Protocol::Field(location: :body, name: "NextToken", required: false)]
  property next_token : String?
end

  class ListHostedConfigurationVersionsRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The configuration profile ID.</p>
  @[Protocol::Field(location: :uri, name: "ConfigurationProfileId", required: true)]
  property configuration_profile_id : String
  # <p>The maximum number of items to return for this call. The call also returns a token that
  # you can specify in a subsequent call to get the next set of results.</p>
  @[Protocol::Field(location: :query, name: "max_results", required: false)]
  property max_results : Int32?
  # <p>A token to start the list. Use this token to get the next set of results. </p>
  @[Protocol::Field(location: :query, name: "next_token", required: false)]
  property next_token : String?
end

  class HostedConfigurationVersionSummaryStruct 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :body, name: "ApplicationId", required: false)]
  property application_id : String?
  # <p>The configuration profile ID.</p>
  @[Protocol::Field(location: :body, name: "ConfigurationProfileId", required: false)]
  property configuration_profile_id : String?
  # <p>The configuration version.</p>
  @[Protocol::Field(location: :body, name: "VersionNumber", required: false)]
  property version_number : Int32?
  # <p>A description of the configuration.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>A standard MIME type describing the format of the configuration content. For more
  # information, see <a href="https://docs.aws.amazon.com/https:/www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.</p>
  @[Protocol::Field(location: :body, name: "ContentType", required: false)]
  property content_type : String?
end

  class HostedConfigurationVersionsStruct 
  include RestJson

  # <p>The elements from this collection.</p>
  @[Protocol::Field(location: :body, name: "Items", required: false)]
  property items : Array(HostedConfigurationVersionSummaryStruct)?
  # <p>The token for the next set of items to return. Use this token to get the next set of
  # results.</p>
  @[Protocol::Field(location: :body, name: "NextToken", required: false)]
  property next_token : String?
end

  class ListTagsForResourceRequest 
  include RestJson

  # <p>The resource ARN.</p>
  @[Protocol::Field(location: :uri, name: "ResourceArn", required: true)]
  property resource_arn : String
end

  class ResourceTagsStruct 
  include RestJson

  # <p>Metadata to assign to AppConfig resources. Tags help organize and categorize your
  # AppConfig resources. Each tag consists of a key and an optional value, both of which you
  # define.</p>
  @[Protocol::Field(location: :body, name: "Tags", required: false)]
  property tags : Hash(String, String)?
end

  class StartDeploymentRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The environment ID.</p>
  @[Protocol::Field(location: :uri, name: "EnvironmentId", required: true)]
  property environment_id : String
  # <p>The deployment strategy ID.</p>
  @[Protocol::Field(location: :body, name: "DeploymentStrategyId", required: true)]
  property deployment_strategy_id : String
  # <p>The configuration profile ID.</p>
  @[Protocol::Field(location: :body, name: "ConfigurationProfileId", required: true)]
  property configuration_profile_id : String
  # <p>The configuration version to deploy.</p>
  @[Protocol::Field(location: :body, name: "ConfigurationVersion", required: true)]
  property configuration_version : String
  # <p>A description of the deployment.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>Metadata to assign to the deployment. Tags help organize and categorize your AppConfig
  # resources. Each tag consists of a key and an optional value, both of which you
  # define.</p>
  @[Protocol::Field(location: :body, name: "Tags", required: false)]
  property tags : Hash(String, String)?
end

  class StopDeploymentRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The environment ID.</p>
  @[Protocol::Field(location: :uri, name: "EnvironmentId", required: true)]
  property environment_id : String
  # <p>The sequence number of the deployment.</p>
  @[Protocol::Field(location: :uri, name: "DeploymentNumber", required: true)]
  property deployment_number : Int32
end

  class TagResourceRequest 
  include RestJson

  # <p>The ARN of the resource for which to retrieve tags.</p>
  @[Protocol::Field(location: :uri, name: "ResourceArn", required: true)]
  property resource_arn : String
  # <p>The key-value string map. The valid character set is [a-zA-Z+-=._:/]. The tag key can be
  # up to 128 characters and must not start with <code>aws:</code>. The tag value can be up to
  # 256 characters.</p>
  @[Protocol::Field(location: :body, name: "Tags", required: true)]
  property tags : Hash(String, String)
end

  class UntagResourceRequest 
  include RestJson

  # <p>The ARN of the resource for which to remove tags.</p>
  @[Protocol::Field(location: :uri, name: "ResourceArn", required: true)]
  property resource_arn : String
  # <p>The tag keys to delete.</p>
  @[Protocol::Field(location: :query, name: "tagKeys", required: true)]
  property tag_keys : Array(String)
end

  class UpdateApplicationRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The name of the application.</p>
  @[Protocol::Field(location: :body, name: "Name", required: false)]
  property name : String?
  # <p>A description of the application.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
end

  class UpdateConfigurationProfileRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The ID of the configuration profile.</p>
  @[Protocol::Field(location: :uri, name: "ConfigurationProfileId", required: true)]
  property configuration_profile_id : String
  # <p>The name of the configuration profile.</p>
  @[Protocol::Field(location: :body, name: "Name", required: false)]
  property name : String?
  # <p>A description of the configuration profile.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>The ARN of an IAM role with permission to access the configuration at the specified
  # LocationUri.</p>
  @[Protocol::Field(location: :body, name: "RetrievalRoleArn", required: false)]
  property retrieval_role_arn : String?
  # <p>A list of methods for validating the configuration.</p>
  @[Protocol::Field(location: :body, name: "Validators", required: false)]
  property validators : Array(ValidatorStruct)?
end

  class UpdateDeploymentStrategyRequest 
  include RestJson

  # <p>The deployment strategy ID.</p>
  @[Protocol::Field(location: :uri, name: "DeploymentStrategyId", required: true)]
  property deployment_strategy_id : String
  # <p>A description of the deployment strategy.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>Total amount of time for a deployment to last.</p>
  @[Protocol::Field(location: :body, name: "DeploymentDurationInMinutes", required: false)]
  property deployment_duration_in_minutes : Int32?
  # <p>The amount of time AppConfig monitors for alarms before considering the deployment to be
  # complete and no longer eligible for automatic roll back.</p>
  @[Protocol::Field(location: :body, name: "FinalBakeTimeInMinutes", required: false)]
  property final_bake_time_in_minutes : Int32?
  # <p>The percentage of targets to receive a deployed configuration during each
  # interval.</p>
  @[Protocol::Field(location: :body, name: "GrowthFactor", required: false)]
  property growth_factor : Float32?
  # <p>The algorithm used to define how percentage grows over time. AWS AppConfig supports the
  # following growth types:</p>
  # <p>
  # <b>Linear</b>: For this type, AppConfig processes the
  # deployment by increments of the growth factor evenly distributed over the deployment time.
  # For example, a linear deployment that uses a growth factor of 20 initially makes the
  # configuration available to 20 percent of the targets. After 1/5th of the deployment time
  # has passed, the system updates the percentage to 40 percent. This continues until 100% of
  # the targets are set to receive the deployed configuration.</p>
  # 
  # <p>
  # <b>Exponential</b>: For this type, AppConfig processes the
  # deployment exponentially using the following formula: <code>G*(2^N)</code>. In this
  # formula, <code>G</code> is the growth factor specified by the user and <code>N</code> is
  # the number of steps until the configuration is deployed to all targets. For example, if you
  # specify a growth factor of 2, then the system rolls out the configuration as
  # follows:</p>
  # <p>
  # <code>2*(2^0)</code>
  # </p>
  # <p>
  # <code>2*(2^1)</code>
  # </p>
  # <p>
  # <code>2*(2^2)</code>
  # </p>
  # <p>Expressed numerically, the deployment rolls out as follows: 2% of the targets, 4% of the
  # targets, 8% of the targets, and continues until the configuration has been deployed to all
  # targets.</p>
  @[Protocol::Field(location: :body, name: "GrowthType", required: false)]
  property growth_type : String?
end

  class UpdateEnvironmentRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The environment ID.</p>
  @[Protocol::Field(location: :uri, name: "EnvironmentId", required: true)]
  property environment_id : String
  # <p>The name of the environment.</p>
  @[Protocol::Field(location: :body, name: "Name", required: false)]
  property name : String?
  # <p>A description of the environment.</p>
  @[Protocol::Field(location: :body, name: "Description", required: false)]
  property description : String?
  # <p>Amazon CloudWatch alarms to monitor during the deployment process.</p>
  @[Protocol::Field(location: :body, name: "Monitors", required: false)]
  property monitors : Array(MonitorStruct)?
end

  class ValidateConfigurationRequest 
  include RestJson

  # <p>The application ID.</p>
  @[Protocol::Field(location: :uri, name: "ApplicationId", required: true)]
  property application_id : String
  # <p>The configuration profile ID.</p>
  @[Protocol::Field(location: :uri, name: "ConfigurationProfileId", required: true)]
  property configuration_profile_id : String
  # <p>The version of the configuration to validate.</p>
  @[Protocol::Field(location: :query, name: "configuration_version", required: true)]
  property configuration_version : String
end



end
