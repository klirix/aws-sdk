
require "../protocols/rest_json"

require "./baseclient"
module AmazonAppConfig
  ENDPOINT_PREFIX = "appconfig"

  module Methods
    abstract def send( request : HTTP::Request, prefix : String, success_code : Int32? )

    def appconfig : AmazonAppConfigMethods
      if internal = @internal_AmazonAppConfig
        internal
      else
        @internal_AmazonAppConfig = AmazonAppConfigMethods.new(self)
      end
    end

    class AmazonAppConfigMethods
      def initialize(@parent : AmazonAppConfig::Methods)
      end

      def send( request : HTTP::Request, prefix : String, success_code : Int32? )
        @parent.send( request, prefix, success_code )
      end

      
            # <p>An application in AppConfig is a logical unit of code that provides capabilities for your
  # customers. For example, an application can be a microservice that runs on Amazon EC2 instances,
  # a mobile application installed by your users, a serverless application using Amazon API
  # Gateway and AWS Lambda, or any system you run on behalf of others.</p>
  def create_application(name : String, description : String? = nil, tags : Hash(String, String)? = nil) : ApplicationStruct
    create_application(CreateApplicationRequest.new(
      name: name, description: description, tags: tags
    ))
  end
  def create_application(input : CreateApplicationRequest) : ApplicationStruct
    path = "/applications"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = send(request, success_code: 201, prefix: ENDPOINT_PREFIX)

    Application.from_response(response)
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
  def create_configuration_profile(application_id : String, name : String, location_uri : String, description : String? = nil, retrieval_role_arn : String? = nil, validators : Array(ValidatorStruct)? = nil, tags : Hash(String, String)? = nil) : ConfigurationProfileStruct
    create_configuration_profile(CreateConfigurationProfileRequest.new(
      application_id: application_id, name: name, description: description, location_uri: location_uri, retrieval_role_arn: retrieval_role_arn, validators: validators, tags: tags
    ))
  end
  def create_configuration_profile(input : CreateConfigurationProfileRequest) : ConfigurationProfileStruct
    path = "/applications/{ApplicationId}/configurationprofiles"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = send(request, success_code: 201, prefix: ENDPOINT_PREFIX)

    ConfigurationProfile.from_response(response)
  end


      
            # <p>A deployment strategy defines important criteria for rolling out your configuration to
  # the designated targets. A deployment strategy includes: the overall duration required, a
  # percentage of targets to receive the deployment during each interval, an algorithm that
  # defines how percentage grows, and bake time.</p>
  def create_deployment_strategy(name : String, deployment_duration_in_minutes : Int32, growth_factor : Float32, replicate_to : String, description : String? = nil, final_bake_time_in_minutes : Int32? = nil, growth_type : String? = nil, tags : Hash(String, String)? = nil) : DeploymentStrategyStruct
    create_deployment_strategy(CreateDeploymentStrategyRequest.new(
      name: name, description: description, deployment_duration_in_minutes: deployment_duration_in_minutes, final_bake_time_in_minutes: final_bake_time_in_minutes, growth_factor: growth_factor, growth_type: growth_type, replicate_to: replicate_to, tags: tags
    ))
  end
  def create_deployment_strategy(input : CreateDeploymentStrategyRequest) : DeploymentStrategyStruct
    path = "/deploymentstrategies"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = send(request, success_code: 201, prefix: ENDPOINT_PREFIX)

    DeploymentStrategy.from_response(response)
  end


      
            # <p>For each application, you define one or more environments. An environment is a logical
  # deployment group of AppConfig targets, such as applications in a <code>Beta</code> or
  # <code>Production</code> environment. You can also define environments for application
  # subcomponents such as the <code>Web</code>, <code>Mobile</code> and <code>Back-end</code>
  # components for your application. You can configure Amazon CloudWatch alarms for each environment.
  # The system monitors alarms during a configuration deployment. If an alarm is triggered, the
  # system rolls back the configuration.</p>
  def create_environment(application_id : String, name : String, description : String? = nil, monitors : Array(MonitorStruct)? = nil, tags : Hash(String, String)? = nil) : EnvironmentStruct
    create_environment(CreateEnvironmentRequest.new(
      application_id: application_id, name: name, description: description, monitors: monitors, tags: tags
    ))
  end
  def create_environment(input : CreateEnvironmentRequest) : EnvironmentStruct
    path = "/applications/{ApplicationId}/environments"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = send(request, success_code: 201, prefix: ENDPOINT_PREFIX)

    Environment.from_response(response)
  end


      
            # <p>Create a new configuration in the AppConfig configuration store.</p>
  def create_hosted_configuration_version(application_id : String, configuration_profile_id : String, content : (IO | String | Bytes), content_type : String, description : String? = nil, latest_version_number : Int32? = nil) : HostedConfigurationVersionStruct
    create_hosted_configuration_version(CreateHostedConfigurationVersionRequest.new(
      application_id: application_id, configuration_profile_id: configuration_profile_id, description: description, content: content, content_type: content_type, latest_version_number: latest_version_number
    ))
  end
  def create_hosted_configuration_version(input : CreateHostedConfigurationVersionRequest) : HostedConfigurationVersionStruct
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path = path.gsub("{ConfigurationProfileId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = send(request, success_code: 201, prefix: ENDPOINT_PREFIX)

    HostedConfigurationVersion.from_response(response)
  end


      
            # <p>Delete an application. Deleting an application does not delete a configuration from a
  # host.</p>
  def delete_application(application_id : String) :     Nil
    delete_application(DeleteApplicationRequest.new(
      application_id: application_id
    ))
  end
  def delete_application(input : DeleteApplicationRequest) :   Nil
    path = "/applications/{ApplicationId}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = send(request, success_code: 204, prefix: ENDPOINT_PREFIX)

    nil
  end


      
            # <p>Delete a configuration profile. Deleting a configuration profile does not delete a
  # configuration from a host.</p>
  def delete_configuration_profile(application_id : String, configuration_profile_id : String) :     Nil
    delete_configuration_profile(DeleteConfigurationProfileRequest.new(
      application_id: application_id, configuration_profile_id: configuration_profile_id
    ))
  end
  def delete_configuration_profile(input : DeleteConfigurationProfileRequest) :   Nil
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path = path.gsub("{ConfigurationProfileId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = send(request, success_code: 204, prefix: ENDPOINT_PREFIX)

    nil
  end


      
            # <p>Delete a deployment strategy. Deleting a deployment strategy does not delete a
  # configuration from a host.</p>
  def delete_deployment_strategy(deployment_strategy_id : String) :     Nil
    delete_deployment_strategy(DeleteDeploymentStrategyRequest.new(
      deployment_strategy_id: deployment_strategy_id
    ))
  end
  def delete_deployment_strategy(input : DeleteDeploymentStrategyRequest) :   Nil
    path = "/deployementstrategies/{DeploymentStrategyId}"
    if label = input.deployment_strategy_id
      path = path.gsub("{DeploymentStrategyId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: DeploymentStrategyId"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = send(request, success_code: 204, prefix: ENDPOINT_PREFIX)

    nil
  end


      
            # <p>Delete an environment. Deleting an environment does not delete a configuration from a
  # host.</p>
  def delete_environment(application_id : String, environment_id : String) :     Nil
    delete_environment(DeleteEnvironmentRequest.new(
      application_id: application_id, environment_id: environment_id
    ))
  end
  def delete_environment(input : DeleteEnvironmentRequest) :   Nil
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path = path.gsub("{EnvironmentId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = send(request, success_code: 204, prefix: ENDPOINT_PREFIX)

    nil
  end


      
            # <p>Delete a version of a configuration from the AppConfig configuration store.</p>
  def delete_hosted_configuration_version(application_id : String, configuration_profile_id : String, version_number : Int32) :     Nil
    delete_hosted_configuration_version(DeleteHostedConfigurationVersionRequest.new(
      application_id: application_id, configuration_profile_id: configuration_profile_id, version_number: version_number
    ))
  end
  def delete_hosted_configuration_version(input : DeleteHostedConfigurationVersionRequest) :   Nil
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions/{VersionNumber}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path = path.gsub("{ConfigurationProfileId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    if label = input.version_number
      path = path.gsub("{VersionNumber}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: VersionNumber"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = send(request, success_code: 204, prefix: ENDPOINT_PREFIX)

    nil
  end


      
            # <p>Retrieve information about an application.</p>
  def get_application(application_id : String) : ApplicationStruct
    get_application(GetApplicationRequest.new(
      application_id: application_id
    ))
  end
  def get_application(input : GetApplicationRequest) : ApplicationStruct
    path = "/applications/{ApplicationId}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    Application.from_response(response)
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
  def get_configuration(application : String, environment : String, configuration : String, client_id : String, client_configuration_version : String? = nil) : ConfigurationStruct
    get_configuration(GetConfigurationRequest.new(
      application: application, environment: environment, configuration: configuration, client_id: client_id, client_configuration_version: client_configuration_version
    ))
  end
  def get_configuration(input : GetConfigurationRequest) : ConfigurationStruct
    path = "/applications/{Application}/environments/{Environment}/configurations/{Configuration}"
    if label = input.application
      path = path.gsub("{Application}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: Application"
    end
    if label = input.environment
      path = path.gsub("{Environment}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: Environment"
    end
    if label = input.configuration
      path = path.gsub("{Configuration}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: Configuration"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    Configuration.from_response(response)
  end


      
            # <p>Retrieve information about a configuration profile.</p>
  def get_configuration_profile(application_id : String, configuration_profile_id : String) : ConfigurationProfileStruct
    get_configuration_profile(GetConfigurationProfileRequest.new(
      application_id: application_id, configuration_profile_id: configuration_profile_id
    ))
  end
  def get_configuration_profile(input : GetConfigurationProfileRequest) : ConfigurationProfileStruct
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path = path.gsub("{ConfigurationProfileId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    ConfigurationProfile.from_response(response)
  end


      
            # <p>Retrieve information about a configuration deployment.</p>
  def get_deployment(application_id : String, environment_id : String, deployment_number : Int32) : DeploymentStruct
    get_deployment(GetDeploymentRequest.new(
      application_id: application_id, environment_id: environment_id, deployment_number: deployment_number
    ))
  end
  def get_deployment(input : GetDeploymentRequest) : DeploymentStruct
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path = path.gsub("{EnvironmentId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    if label = input.deployment_number
      path = path.gsub("{DeploymentNumber}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: DeploymentNumber"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    Deployment.from_response(response)
  end


      
            # <p>Retrieve information about a deployment strategy. A deployment strategy defines
  # important criteria for rolling out your configuration to the designated targets. A
  # deployment strategy includes: the overall duration required, a percentage of targets to
  # receive the deployment during each interval, an algorithm that defines how percentage
  # grows, and bake time.</p>
  def get_deployment_strategy(deployment_strategy_id : String) : DeploymentStrategyStruct
    get_deployment_strategy(GetDeploymentStrategyRequest.new(
      deployment_strategy_id: deployment_strategy_id
    ))
  end
  def get_deployment_strategy(input : GetDeploymentStrategyRequest) : DeploymentStrategyStruct
    path = "/deploymentstrategies/{DeploymentStrategyId}"
    if label = input.deployment_strategy_id
      path = path.gsub("{DeploymentStrategyId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: DeploymentStrategyId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    DeploymentStrategy.from_response(response)
  end


      
            # <p>Retrieve information about an environment. An environment is a logical deployment group
  # of AppConfig applications, such as applications in a <code>Production</code> environment or
  # in an <code>EU_Region</code> environment. Each configuration deployment targets an
  # environment. You can enable one or more Amazon CloudWatch alarms for an environment. If an alarm is
  # triggered during a deployment, AppConfig roles back the configuration.</p>
  def get_environment(application_id : String, environment_id : String) : EnvironmentStruct
    get_environment(GetEnvironmentRequest.new(
      application_id: application_id, environment_id: environment_id
    ))
  end
  def get_environment(input : GetEnvironmentRequest) : EnvironmentStruct
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path = path.gsub("{EnvironmentId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    Environment.from_response(response)
  end


      
            # <p>Get information about a specific configuration version.</p>
  def get_hosted_configuration_version(application_id : String, configuration_profile_id : String, version_number : Int32) : HostedConfigurationVersionStruct
    get_hosted_configuration_version(GetHostedConfigurationVersionRequest.new(
      application_id: application_id, configuration_profile_id: configuration_profile_id, version_number: version_number
    ))
  end
  def get_hosted_configuration_version(input : GetHostedConfigurationVersionRequest) : HostedConfigurationVersionStruct
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions/{VersionNumber}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path = path.gsub("{ConfigurationProfileId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    if label = input.version_number
      path = path.gsub("{VersionNumber}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: VersionNumber"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    HostedConfigurationVersion.from_response(response)
  end


      
            # <p>List all applications in your AWS account.</p>
  def list_applications(max_results : Int32? = nil, next_token : String? = nil) : ApplicationsStruct
    list_applications(ListApplicationsRequest.new(
      max_results: max_results, next_token: next_token
    ))
  end
  def list_applications(input : ListApplicationsRequest) : ApplicationsStruct
    path = "/applications"
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    Applications.from_response(response)
  end


      
            # <p>Lists the configuration profiles for an application.</p>
  def list_configuration_profiles(application_id : String, max_results : Int32? = nil, next_token : String? = nil) : ConfigurationProfilesStruct
    list_configuration_profiles(ListConfigurationProfilesRequest.new(
      application_id: application_id, max_results: max_results, next_token: next_token
    ))
  end
  def list_configuration_profiles(input : ListConfigurationProfilesRequest) : ConfigurationProfilesStruct
    path = "/applications/{ApplicationId}/configurationprofiles"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    ConfigurationProfiles.from_response(response)
  end


      
            # <p>Lists the deployments for an environment.</p>
  def list_deployments(application_id : String, environment_id : String, max_results : Int32? = nil, next_token : String? = nil) : DeploymentsStruct
    list_deployments(ListDeploymentsRequest.new(
      application_id: application_id, environment_id: environment_id, max_results: max_results, next_token: next_token
    ))
  end
  def list_deployments(input : ListDeploymentsRequest) : DeploymentsStruct
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path = path.gsub("{EnvironmentId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    Deployments.from_response(response)
  end


      
            # <p>List deployment strategies.</p>
  def list_deployment_strategies(max_results : Int32? = nil, next_token : String? = nil) : DeploymentStrategiesStruct
    list_deployment_strategies(ListDeploymentStrategiesRequest.new(
      max_results: max_results, next_token: next_token
    ))
  end
  def list_deployment_strategies(input : ListDeploymentStrategiesRequest) : DeploymentStrategiesStruct
    path = "/deploymentstrategies"
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    DeploymentStrategies.from_response(response)
  end


      
            # <p>List the environments for an application.</p>
  def list_environments(application_id : String, max_results : Int32? = nil, next_token : String? = nil) : EnvironmentsStruct
    list_environments(ListEnvironmentsRequest.new(
      application_id: application_id, max_results: max_results, next_token: next_token
    ))
  end
  def list_environments(input : ListEnvironmentsRequest) : EnvironmentsStruct
    path = "/applications/{ApplicationId}/environments"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    Environments.from_response(response)
  end


      
            # <p>View a list of configurations stored in the AppConfig configuration store by
  # version.</p>
  def list_hosted_configuration_versions(application_id : String, configuration_profile_id : String, max_results : Int32? = nil, next_token : String? = nil) : HostedConfigurationVersionsStruct
    list_hosted_configuration_versions(ListHostedConfigurationVersionsRequest.new(
      application_id: application_id, configuration_profile_id: configuration_profile_id, max_results: max_results, next_token: next_token
    ))
  end
  def list_hosted_configuration_versions(input : ListHostedConfigurationVersionsRequest) : HostedConfigurationVersionsStruct
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path = path.gsub("{ConfigurationProfileId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    HostedConfigurationVersions.from_response(response)
  end


      
            # <p>Retrieves the list of key-value tags assigned to the resource.</p>
  def list_tags_for_resource(resource_arn : String) : ResourceTagsStruct
    list_tags_for_resource(ListTagsForResourceRequest.new(
      resource_arn: resource_arn
    ))
  end
  def list_tags_for_resource(input : ListTagsForResourceRequest) : ResourceTagsStruct
    path = "/tags/{ResourceArn}"
    if label = input.resource_arn
      path = path.gsub("{ResourceArn}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ResourceArn"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    ResourceTags.from_response(response)
  end


      
            # <p>Starts a deployment.</p>
  def start_deployment(application_id : String, environment_id : String, deployment_strategy_id : String, configuration_profile_id : String, configuration_version : String, description : String? = nil, tags : Hash(String, String)? = nil) : DeploymentStruct
    start_deployment(StartDeploymentRequest.new(
      application_id: application_id, environment_id: environment_id, deployment_strategy_id: deployment_strategy_id, configuration_profile_id: configuration_profile_id, configuration_version: configuration_version, description: description, tags: tags
    ))
  end
  def start_deployment(input : StartDeploymentRequest) : DeploymentStruct
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path = path.gsub("{EnvironmentId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = send(request, success_code: 201, prefix: ENDPOINT_PREFIX)

    Deployment.from_response(response)
  end


      
            # <p>Stops a deployment. This API action works only on deployments that have a status of
  # <code>DEPLOYING</code>. This action moves the deployment to a status of
  # <code>ROLLED_BACK</code>.</p>
  def stop_deployment(application_id : String, environment_id : String, deployment_number : Int32) : DeploymentStruct
    stop_deployment(StopDeploymentRequest.new(
      application_id: application_id, environment_id: environment_id, deployment_number: deployment_number
    ))
  end
  def stop_deployment(input : StopDeploymentRequest) : DeploymentStruct
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path = path.gsub("{EnvironmentId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    if label = input.deployment_number
      path = path.gsub("{DeploymentNumber}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: DeploymentNumber"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = send(request, success_code: 202, prefix: ENDPOINT_PREFIX)

    Deployment.from_response(response)
  end


      
            # <p>Metadata to assign to an AppConfig resource. Tags help organize and categorize your
  # AppConfig resources. Each tag consists of a key and an optional value, both of which you
  # define. You can specify a maximum of 50 tags for a resource.</p>
  def tag_resource(resource_arn : String, tags : Hash(String, String)) :     Nil
    tag_resource(TagResourceRequest.new(
      resource_arn: resource_arn, tags: tags
    ))
  end
  def tag_resource(input : TagResourceRequest) :   Nil
    path = "/tags/{ResourceArn}"
    if label = input.resource_arn
      path = path.gsub("{ResourceArn}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ResourceArn"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = send(request, success_code: 204, prefix: ENDPOINT_PREFIX)

    nil
  end


      
            # <p>Deletes a tag key and value from an AppConfig resource.</p>
  def untag_resource(resource_arn : String, tag_keys : Array(String)) :     Nil
    untag_resource(UntagResourceRequest.new(
      resource_arn: resource_arn, tag_keys: tag_keys
    ))
  end
  def untag_resource(input : UntagResourceRequest) :   Nil
    path = "/tags/{ResourceArn}"
    if label = input.resource_arn
      path = path.gsub("{ResourceArn}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ResourceArn"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = send(request, success_code: 204, prefix: ENDPOINT_PREFIX)

    nil
  end


      
            # <p>Updates an application.</p>
  def update_application(application_id : String, name : String? = nil, description : String? = nil) : ApplicationStruct
    update_application(UpdateApplicationRequest.new(
      application_id: application_id, name: name, description: description
    ))
  end
  def update_application(input : UpdateApplicationRequest) : ApplicationStruct
    path = "/applications/{ApplicationId}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    request = HTTP::Request.new("PATCH", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    Application.from_response(response)
  end


      
            # <p>Updates a configuration profile.</p>
  def update_configuration_profile(application_id : String, configuration_profile_id : String, name : String? = nil, description : String? = nil, retrieval_role_arn : String? = nil, validators : Array(ValidatorStruct)? = nil) : ConfigurationProfileStruct
    update_configuration_profile(UpdateConfigurationProfileRequest.new(
      application_id: application_id, configuration_profile_id: configuration_profile_id, name: name, description: description, retrieval_role_arn: retrieval_role_arn, validators: validators
    ))
  end
  def update_configuration_profile(input : UpdateConfigurationProfileRequest) : ConfigurationProfileStruct
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path = path.gsub("{ConfigurationProfileId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    request = HTTP::Request.new("PATCH", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    ConfigurationProfile.from_response(response)
  end


      
            # <p>Updates a deployment strategy.</p>
  def update_deployment_strategy(deployment_strategy_id : String, description : String? = nil, deployment_duration_in_minutes : Int32? = nil, final_bake_time_in_minutes : Int32? = nil, growth_factor : Float32? = nil, growth_type : String? = nil) : DeploymentStrategyStruct
    update_deployment_strategy(UpdateDeploymentStrategyRequest.new(
      deployment_strategy_id: deployment_strategy_id, description: description, deployment_duration_in_minutes: deployment_duration_in_minutes, final_bake_time_in_minutes: final_bake_time_in_minutes, growth_factor: growth_factor, growth_type: growth_type
    ))
  end
  def update_deployment_strategy(input : UpdateDeploymentStrategyRequest) : DeploymentStrategyStruct
    path = "/deploymentstrategies/{DeploymentStrategyId}"
    if label = input.deployment_strategy_id
      path = path.gsub("{DeploymentStrategyId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: DeploymentStrategyId"
    end
    request = HTTP::Request.new("PATCH", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    DeploymentStrategy.from_response(response)
  end


      
            # <p>Updates an environment.</p>
  def update_environment(application_id : String, environment_id : String, name : String? = nil, description : String? = nil, monitors : Array(MonitorStruct)? = nil) : EnvironmentStruct
    update_environment(UpdateEnvironmentRequest.new(
      application_id: application_id, environment_id: environment_id, name: name, description: description, monitors: monitors
    ))
  end
  def update_environment(input : UpdateEnvironmentRequest) : EnvironmentStruct
    path = "/applications/{ApplicationId}/environments/{EnvironmentId}"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.environment_id
      path = path.gsub("{EnvironmentId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: EnvironmentId"
    end
    request = HTTP::Request.new("PATCH", path)
    request = input.process(request)
    response = send(request, success_code: 200, prefix: ENDPOINT_PREFIX)

    Environment.from_response(response)
  end


      
            # <p>Uses the validators in a configuration profile to validate a configuration.</p>
  def validate_configuration(application_id : String, configuration_profile_id : String, configuration_version : String) :     Nil
    validate_configuration(ValidateConfigurationRequest.new(
      application_id: application_id, configuration_profile_id: configuration_profile_id, configuration_version: configuration_version
    ))
  end
  def validate_configuration(input : ValidateConfigurationRequest) :   Nil
    path = "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/validators"
    if label = input.application_id
      path = path.gsub("{ApplicationId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ApplicationId"
    end
    if label = input.configuration_profile_id
      path = path.gsub("{ConfigurationProfileId}", URI.encode(label))
    else
      raise "No value provided for input HTTP label: ConfigurationProfileId"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = send(request, success_code: 204, prefix: ENDPOINT_PREFIX)

    nil
  end


      
    end 
  end


  class CreateApplicationRequest
    include AWSSdk::RestJSON::Structure

    # <p>A name for the application.</p>
    @[AWSSdk::Field(location: :body, name: "Name", structure: false)]
    property name : String
    # <p>A description of the application.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>Metadata to assign to the application. Tags help organize and categorize your AppConfig
    # resources. Each tag consists of a key and an optional value, both of which you
    # define.</p>
    @[AWSSdk::Field(location: :body, name: "Tags", structure: false)]
    property tags : Hash(String, String)?

    def initialize(@name : String, @description : String? = nil, @tags : Hash(String, String)? = nil)
    end
  end

  class ApplicationStruct
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :body, name: "Id", structure: false)]
    property id : String?
    # <p>The application name.</p>
    @[AWSSdk::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>The description of the application.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?

    def initialize(@id : String? = nil, @name : String? = nil, @description : String? = nil)
    end
  end

  class BadRequestException
    include AWSSdk::RestJSON::Structure

    # 
    @[AWSSdk::Field(location: :body, name: "Message", structure: false)]
    property message : String?

    def initialize(@message : String? = nil)
    end
  end

  class InternalServerException
    include AWSSdk::RestJSON::Structure

    # 
    @[AWSSdk::Field(location: :body, name: "Message", structure: false)]
    property message : String?

    def initialize(@message : String? = nil)
    end
  end

  class ValidatorStruct
    include AWSSdk::RestJSON::Structure

    # <p>AppConfig supports validators of type <code>JSON_SCHEMA</code> and
    # <code>LAMBDA</code>
    # </p>
    @[AWSSdk::Field(location: :body, name: "Type", structure: false)]
    property type : String
    # <p>Either the JSON Schema content or the Amazon Resource Name (ARN) of an AWS Lambda
    # function.</p>
    @[AWSSdk::Field(location: :body, name: "Content", structure: false)]
    property content : String

    def initialize(@type : String, @content : String)
    end
  end

  class CreateConfigurationProfileRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>A name for the configuration profile.</p>
    @[AWSSdk::Field(location: :body, name: "Name", structure: false)]
    property name : String
    # <p>A description of the configuration profile.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>A URI to locate the configuration. You can specify a Systems Manager (SSM) document, an SSM
    # Parameter Store parameter, or an Amazon S3 object. For an SSM document, specify either the
    # document name in the format <code>ssm-document://<Document_name></code> or the Amazon
    # Resource Name (ARN). For a parameter, specify either the parameter name in the format
    # <code>ssm-parameter://<Parameter_name></code> or the ARN. For an Amazon S3 object,
    # specify the URI in the following format: <code>s3://<bucket>/<objectKey>
    # </code>. Here is an example: s3://my-bucket/my-app/us-east-1/my-config.json</p>
    @[AWSSdk::Field(location: :body, name: "LocationUri", structure: false)]
    property location_uri : String
    # <p>The ARN of an IAM role with permission to access the configuration at the specified
    # LocationUri.</p>
    @[AWSSdk::Field(location: :body, name: "RetrievalRoleArn", structure: false)]
    property retrieval_role_arn : String?
    # <p>A list of methods for validating the configuration.</p>
    @[AWSSdk::Field(location: :body, name: "Validators", structure: true)]
    property validators : Array(ValidatorStruct)?
    # <p>Metadata to assign to the configuration profile. Tags help organize and categorize your
    # AppConfig resources. Each tag consists of a key and an optional value, both of which you
    # define.</p>
    @[AWSSdk::Field(location: :body, name: "Tags", structure: false)]
    property tags : Hash(String, String)?

    def initialize(@application_id : String, @name : String, @location_uri : String, @description : String? = nil, @retrieval_role_arn : String? = nil, @validators : Array(ValidatorStruct)? = nil, @tags : Hash(String, String)? = nil)
    end
  end

  class ConfigurationProfileStruct
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :body, name: "ApplicationId", structure: false)]
    property application_id : String?
    # <p>The configuration profile ID.</p>
    @[AWSSdk::Field(location: :body, name: "Id", structure: false)]
    property id : String?
    # <p>The name of the configuration profile.</p>
    @[AWSSdk::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>The configuration profile description.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>The URI location of the configuration.</p>
    @[AWSSdk::Field(location: :body, name: "LocationUri", structure: false)]
    property location_uri : String?
    # <p>The ARN of an IAM role with permission to access the configuration at the specified
    # LocationUri.</p>
    @[AWSSdk::Field(location: :body, name: "RetrievalRoleArn", structure: false)]
    property retrieval_role_arn : String?
    # <p>A list of methods for validating the configuration.</p>
    @[AWSSdk::Field(location: :body, name: "Validators", structure: true)]
    property validators : Array(ValidatorStruct)?

    def initialize(@application_id : String? = nil, @id : String? = nil, @name : String? = nil, @description : String? = nil, @location_uri : String? = nil, @retrieval_role_arn : String? = nil, @validators : Array(ValidatorStruct)? = nil)
    end
  end

  class ResourceNotFoundException
    include AWSSdk::RestJSON::Structure

    # 
    @[AWSSdk::Field(location: :body, name: "Message", structure: false)]
    property message : String?
    # 
    @[AWSSdk::Field(location: :body, name: "ResourceName", structure: false)]
    property resource_name : String?

    def initialize(@message : String? = nil, @resource_name : String? = nil)
    end
  end

  class CreateDeploymentStrategyRequest
    include AWSSdk::RestJSON::Structure

    # <p>A name for the deployment strategy.</p>
    @[AWSSdk::Field(location: :body, name: "Name", structure: false)]
    property name : String
    # <p>A description of the deployment strategy.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>Total amount of time for a deployment to last.</p>
    @[AWSSdk::Field(location: :body, name: "DeploymentDurationInMinutes", structure: false)]
    property deployment_duration_in_minutes : Int32
    # <p>The amount of time AppConfig monitors for alarms before considering the deployment to be
    # complete and no longer eligible for automatic roll back.</p>
    @[AWSSdk::Field(location: :body, name: "FinalBakeTimeInMinutes", structure: false)]
    property final_bake_time_in_minutes : Int32?
    # <p>The percentage of targets to receive a deployed configuration during each
    # interval.</p>
    @[AWSSdk::Field(location: :body, name: "GrowthFactor", structure: false)]
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
    @[AWSSdk::Field(location: :body, name: "GrowthType", structure: false)]
    property growth_type : String?
    # <p>Save the deployment strategy to a Systems Manager (SSM) document.</p>
    @[AWSSdk::Field(location: :body, name: "ReplicateTo", structure: false)]
    property replicate_to : String
    # <p>Metadata to assign to the deployment strategy. Tags help organize and categorize your
    # AppConfig resources. Each tag consists of a key and an optional value, both of which you
    # define.</p>
    @[AWSSdk::Field(location: :body, name: "Tags", structure: false)]
    property tags : Hash(String, String)?

    def initialize(@name : String, @deployment_duration_in_minutes : Int32, @growth_factor : Float32, @replicate_to : String, @description : String? = nil, @final_bake_time_in_minutes : Int32? = nil, @growth_type : String? = nil, @tags : Hash(String, String)? = nil)
    end
  end

  class DeploymentStrategyStruct
    include AWSSdk::RestJSON::Structure

    # <p>The deployment strategy ID.</p>
    @[AWSSdk::Field(location: :body, name: "Id", structure: false)]
    property id : String?
    # <p>The name of the deployment strategy.</p>
    @[AWSSdk::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>The description of the deployment strategy.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>Total amount of time the deployment lasted.</p>
    @[AWSSdk::Field(location: :body, name: "DeploymentDurationInMinutes", structure: false)]
    property deployment_duration_in_minutes : Int32?
    # <p>The algorithm used to define how percentage grew over time.</p>
    @[AWSSdk::Field(location: :body, name: "GrowthType", structure: false)]
    property growth_type : String?
    # <p>The percentage of targets that received a deployed configuration during each
    # interval.</p>
    @[AWSSdk::Field(location: :body, name: "GrowthFactor", structure: false)]
    property growth_factor : Float32?
    # <p>The amount of time AppConfig monitored for alarms before considering the deployment to be
    # complete and no longer eligible for automatic roll back.</p>
    @[AWSSdk::Field(location: :body, name: "FinalBakeTimeInMinutes", structure: false)]
    property final_bake_time_in_minutes : Int32?
    # <p>Save the deployment strategy to a Systems Manager (SSM) document.</p>
    @[AWSSdk::Field(location: :body, name: "ReplicateTo", structure: false)]
    property replicate_to : String?

    def initialize(@id : String? = nil, @name : String? = nil, @description : String? = nil, @deployment_duration_in_minutes : Int32? = nil, @growth_type : String? = nil, @growth_factor : Float32? = nil, @final_bake_time_in_minutes : Int32? = nil, @replicate_to : String? = nil)
    end
  end

  class MonitorStruct
    include AWSSdk::RestJSON::Structure

    # <p>ARN of the Amazon CloudWatch alarm.</p>
    @[AWSSdk::Field(location: :body, name: "AlarmArn", structure: false)]
    property alarm_arn : String?
    # <p>ARN of an IAM role for AppConfig to monitor <code>AlarmArn</code>.</p>
    @[AWSSdk::Field(location: :body, name: "AlarmRoleArn", structure: false)]
    property alarm_role_arn : String?

    def initialize(@alarm_arn : String? = nil, @alarm_role_arn : String? = nil)
    end
  end

  class CreateEnvironmentRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>A name for the environment.</p>
    @[AWSSdk::Field(location: :body, name: "Name", structure: false)]
    property name : String
    # <p>A description of the environment.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>Amazon CloudWatch alarms to monitor during the deployment process.</p>
    @[AWSSdk::Field(location: :body, name: "Monitors", structure: true)]
    property monitors : Array(MonitorStruct)?
    # <p>Metadata to assign to the environment. Tags help organize and categorize your AppConfig
    # resources. Each tag consists of a key and an optional value, both of which you
    # define.</p>
    @[AWSSdk::Field(location: :body, name: "Tags", structure: false)]
    property tags : Hash(String, String)?

    def initialize(@application_id : String, @name : String, @description : String? = nil, @monitors : Array(MonitorStruct)? = nil, @tags : Hash(String, String)? = nil)
    end
  end

  class EnvironmentStruct
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :body, name: "ApplicationId", structure: false)]
    property application_id : String?
    # <p>The environment ID.</p>
    @[AWSSdk::Field(location: :body, name: "Id", structure: false)]
    property id : String?
    # <p>The name of the environment.</p>
    @[AWSSdk::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>The description of the environment.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>The state of the environment. An environment can be in one of the following states:
    # <code>READY_FOR_DEPLOYMENT</code>, <code>DEPLOYING</code>, <code>ROLLING_BACK</code>, or
    # <code>ROLLED_BACK</code>
    # </p>
    @[AWSSdk::Field(location: :body, name: "State", structure: false)]
    property state : String?
    # <p>Amazon CloudWatch alarms monitored during the deployment.</p>
    @[AWSSdk::Field(location: :body, name: "Monitors", structure: true)]
    property monitors : Array(MonitorStruct)?

    def initialize(@application_id : String? = nil, @id : String? = nil, @name : String? = nil, @description : String? = nil, @state : String? = nil, @monitors : Array(MonitorStruct)? = nil)
    end
  end

  class CreateHostedConfigurationVersionRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The configuration profile ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ConfigurationProfileId", structure: false)]
    property configuration_profile_id : String
    # <p>A description of the configuration.</p>
    @[AWSSdk::Field(location: :header, name: "Description", structure: false)]
    property description : String?
    # <p>The content of the configuration or the configuration data.</p>
    @[AWSSdk::Field(location: :body_io, name: "nil", structure: false)]
    property content : (IO | String | Bytes)
    # <p>A standard MIME type describing the format of the configuration content. For more
    # information, see <a href="https://docs.aws.amazon.com/https:/www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.</p>
    @[AWSSdk::Field(location: :header, name: "Content-Type", structure: false)]
    property content_type : String
    # <p>An optional locking token used to prevent race conditions from overwriting configuration
    # updates when creating a new version. To ensure your data is not overwritten when creating
    # multiple hosted configuration versions in rapid succession, specify the version of the
    # latest hosted configuration version.</p>
    @[AWSSdk::Field(location: :header, name: "Latest-Version-Number", structure: false)]
    property latest_version_number : Int32?

    def initialize(@application_id : String, @configuration_profile_id : String, @content : (IO | String | Bytes), @content_type : String, @description : String? = nil, @latest_version_number : Int32? = nil)
    end
  end

  class HostedConfigurationVersionStruct
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :header, name: "Application-Id", structure: false)]
    property application_id : String?
    # <p>The configuration profile ID.</p>
    @[AWSSdk::Field(location: :header, name: "Configuration-Profile-Id", structure: false)]
    property configuration_profile_id : String?
    # <p>The configuration version.</p>
    @[AWSSdk::Field(location: :header, name: "Version-Number", structure: false)]
    property version_number : Int32?
    # <p>A description of the configuration.</p>
    @[AWSSdk::Field(location: :header, name: "Description", structure: false)]
    property description : String?
    # <p>The content of the configuration or the configuration data.</p>
    @[AWSSdk::Field(location: :body_io, name: "nil", structure: false)]
    property content : (IO | String | Bytes)?
    # <p>A standard MIME type describing the format of the configuration content. For more
    # information, see <a href="https://docs.aws.amazon.com/https:/www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.</p>
    @[AWSSdk::Field(location: :header, name: "Content-Type", structure: false)]
    property content_type : String?

    def initialize(@application_id : String? = nil, @configuration_profile_id : String? = nil, @version_number : Int32? = nil, @description : String? = nil, @content : (IO | String | Bytes)? = nil, @content_type : String? = nil)
    end
  end

  class ConflictException
    include AWSSdk::RestJSON::Structure

    # 
    @[AWSSdk::Field(location: :body, name: "Message", structure: false)]
    property message : String?

    def initialize(@message : String? = nil)
    end
  end

  class PayloadTooLargeException
    include AWSSdk::RestJSON::Structure

    # 
    @[AWSSdk::Field(location: :body, name: "Message", structure: false)]
    property message : String?
    # 
    @[AWSSdk::Field(location: :body, name: "Measure", structure: false)]
    property measure : String?
    # 
    @[AWSSdk::Field(location: :body, name: "Limit", structure: false)]
    property limit : Float32?
    # 
    @[AWSSdk::Field(location: :body, name: "Size", structure: false)]
    property size : Float32?

    def initialize(@message : String? = nil, @measure : String? = nil, @limit : Float32? = nil, @size : Float32? = nil)
    end
  end

  class ServiceQuotaExceededException
    include AWSSdk::RestJSON::Structure

    # 
    @[AWSSdk::Field(location: :body, name: "Message", structure: false)]
    property message : String?

    def initialize(@message : String? = nil)
    end
  end

  class DeleteApplicationRequest
    include AWSSdk::RestJSON::Structure

    # <p>The ID of the application to delete.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String

    def initialize(@application_id : String)
    end
  end

  class DeleteConfigurationProfileRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID that includes the configuration profile you want to delete.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The ID of the configuration profile you want to delete.</p>
    @[AWSSdk::Field(location: :uri, name: "ConfigurationProfileId", structure: false)]
    property configuration_profile_id : String

    def initialize(@application_id : String, @configuration_profile_id : String)
    end
  end

  class DeleteDeploymentStrategyRequest
    include AWSSdk::RestJSON::Structure

    # <p>The ID of the deployment strategy you want to delete.</p>
    @[AWSSdk::Field(location: :uri, name: "DeploymentStrategyId", structure: false)]
    property deployment_strategy_id : String

    def initialize(@deployment_strategy_id : String)
    end
  end

  class DeleteEnvironmentRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID that includes the environment you want to delete.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The ID of the environment you want to delete.</p>
    @[AWSSdk::Field(location: :uri, name: "EnvironmentId", structure: false)]
    property environment_id : String

    def initialize(@application_id : String, @environment_id : String)
    end
  end

  class DeleteHostedConfigurationVersionRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The configuration profile ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ConfigurationProfileId", structure: false)]
    property configuration_profile_id : String
    # <p>The versions number to delete.</p>
    @[AWSSdk::Field(location: :uri, name: "VersionNumber", structure: false)]
    property version_number : Int32

    def initialize(@application_id : String, @configuration_profile_id : String, @version_number : Int32)
    end
  end

  class GetApplicationRequest
    include AWSSdk::RestJSON::Structure

    # <p>The ID of the application you want to get.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String

    def initialize(@application_id : String)
    end
  end

  class GetConfigurationRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application to get. Specify either the application name or the application
    # ID.</p>
    @[AWSSdk::Field(location: :uri, name: "Application", structure: false)]
    property application : String
    # <p>The environment to get. Specify either the environment name or the environment
    # ID.</p>
    @[AWSSdk::Field(location: :uri, name: "Environment", structure: false)]
    property environment : String
    # <p>The configuration to get. Specify either the configuration name or the configuration
    # ID.</p>
    @[AWSSdk::Field(location: :uri, name: "Configuration", structure: false)]
    property configuration : String
    # <p>A unique ID to identify the client for the configuration. This ID enables AppConfig to
    # deploy the configuration in intervals, as defined in the deployment strategy.</p>
    @[AWSSdk::Field(location: :query, name: "client_id", structure: false)]
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
    @[AWSSdk::Field(location: :query, name: "client_configuration_version", structure: false)]
    property client_configuration_version : String?

    def initialize(@application : String, @environment : String, @configuration : String, @client_id : String, @client_configuration_version : String? = nil)
    end
  end

  class ConfigurationStruct
    include AWSSdk::RestJSON::Structure

    # <p>The content of the configuration or the configuration data.</p>
    @[AWSSdk::Field(location: :body_io, name: "nil", structure: false)]
    property content : (IO | String | Bytes)?
    # <p>The configuration version.</p>
    @[AWSSdk::Field(location: :header, name: "Configuration-Version", structure: false)]
    property configuration_version : String?
    # <p>A standard MIME type describing the format of the configuration content. For more
    # information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.</p>
    @[AWSSdk::Field(location: :header, name: "Content-Type", structure: false)]
    property content_type : String?

    def initialize(@content : (IO | String | Bytes)? = nil, @configuration_version : String? = nil, @content_type : String? = nil)
    end
  end

  class GetConfigurationProfileRequest
    include AWSSdk::RestJSON::Structure

    # <p>The ID of the application that includes the configuration profile you want to
    # get.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The ID of the configuration profile you want to get.</p>
    @[AWSSdk::Field(location: :uri, name: "ConfigurationProfileId", structure: false)]
    property configuration_profile_id : String

    def initialize(@application_id : String, @configuration_profile_id : String)
    end
  end

  class GetDeploymentRequest
    include AWSSdk::RestJSON::Structure

    # <p>The ID of the application that includes the deployment you want to get. </p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The ID of the environment that includes the deployment you want to get. </p>
    @[AWSSdk::Field(location: :uri, name: "EnvironmentId", structure: false)]
    property environment_id : String
    # <p>The sequence number of the deployment.</p>
    @[AWSSdk::Field(location: :uri, name: "DeploymentNumber", structure: false)]
    property deployment_number : Int32

    def initialize(@application_id : String, @environment_id : String, @deployment_number : Int32)
    end
  end

  class DeploymentEventStruct
    include AWSSdk::RestJSON::Structure

    # <p>The type of deployment event. Deployment event types include the start, stop, or
    # completion of a deployment; a percentage update; the start or stop of a bake period; the
    # start or completion of a rollback.</p>
    @[AWSSdk::Field(location: :body, name: "EventType", structure: false)]
    property event_type : String?
    # <p>The entity that triggered the deployment event. Events can be triggered by a user, AWS
    # AppConfig, an Amazon CloudWatch alarm, or an internal error.</p>
    @[AWSSdk::Field(location: :body, name: "TriggeredBy", structure: false)]
    property triggered_by : String?
    # <p>A description of the deployment event. Descriptions include, but are not limited to, the
    # user account or the CloudWatch alarm ARN that initiated a rollback, the percentage of hosts
    # that received the deployment, or in the case of an internal error, a recommendation to
    # attempt a new deployment.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>The date and time the event occurred.</p>
    @[AWSSdk::Field(location: :body, name: "OccurredAt", structure: false)]
    property occurred_at : Time?

    def initialize(@event_type : String? = nil, @triggered_by : String? = nil, @description : String? = nil, @occurred_at : Time? = nil)
    end
  end

  class DeploymentStruct
    include AWSSdk::RestJSON::Structure

    # <p>The ID of the application that was deployed.</p>
    @[AWSSdk::Field(location: :body, name: "ApplicationId", structure: false)]
    property application_id : String?
    # <p>The ID of the environment that was deployed.</p>
    @[AWSSdk::Field(location: :body, name: "EnvironmentId", structure: false)]
    property environment_id : String?
    # <p>The ID of the deployment strategy that was deployed.</p>
    @[AWSSdk::Field(location: :body, name: "DeploymentStrategyId", structure: false)]
    property deployment_strategy_id : String?
    # <p>The ID of the configuration profile that was deployed.</p>
    @[AWSSdk::Field(location: :body, name: "ConfigurationProfileId", structure: false)]
    property configuration_profile_id : String?
    # <p>The sequence number of the deployment.</p>
    @[AWSSdk::Field(location: :body, name: "DeploymentNumber", structure: false)]
    property deployment_number : Int32?
    # <p>The name of the configuration.</p>
    @[AWSSdk::Field(location: :body, name: "ConfigurationName", structure: false)]
    property configuration_name : String?
    # <p>Information about the source location of the configuration.</p>
    @[AWSSdk::Field(location: :body, name: "ConfigurationLocationUri", structure: false)]
    property configuration_location_uri : String?
    # <p>The configuration version that was deployed.</p>
    @[AWSSdk::Field(location: :body, name: "ConfigurationVersion", structure: false)]
    property configuration_version : String?
    # <p>The description of the deployment.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>Total amount of time the deployment lasted.</p>
    @[AWSSdk::Field(location: :body, name: "DeploymentDurationInMinutes", structure: false)]
    property deployment_duration_in_minutes : Int32?
    # <p>The algorithm used to define how percentage grew over time.</p>
    @[AWSSdk::Field(location: :body, name: "GrowthType", structure: false)]
    property growth_type : String?
    # <p>The percentage of targets to receive a deployed configuration during each
    # interval.</p>
    @[AWSSdk::Field(location: :body, name: "GrowthFactor", structure: false)]
    property growth_factor : Float32?
    # <p>The amount of time AppConfig monitored for alarms before considering the deployment to be
    # complete and no longer eligible for automatic roll back.</p>
    @[AWSSdk::Field(location: :body, name: "FinalBakeTimeInMinutes", structure: false)]
    property final_bake_time_in_minutes : Int32?
    # <p>The state of the deployment.</p>
    @[AWSSdk::Field(location: :body, name: "State", structure: false)]
    property state : String?
    # <p>A list containing all events related to a deployment. The most recent events are
    # displayed first.</p>
    @[AWSSdk::Field(location: :body, name: "EventLog", structure: true)]
    property event_log : Array(DeploymentEventStruct)?
    # <p>The percentage of targets for which the deployment is available.</p>
    @[AWSSdk::Field(location: :body, name: "PercentageComplete", structure: false)]
    property percentage_complete : Float32?
    # <p>The time the deployment started.</p>
    @[AWSSdk::Field(location: :body, name: "StartedAt", structure: false)]
    property started_at : Time?
    # <p>The time the deployment completed. </p>
    @[AWSSdk::Field(location: :body, name: "CompletedAt", structure: false)]
    property completed_at : Time?

    def initialize(@application_id : String? = nil, @environment_id : String? = nil, @deployment_strategy_id : String? = nil, @configuration_profile_id : String? = nil, @deployment_number : Int32? = nil, @configuration_name : String? = nil, @configuration_location_uri : String? = nil, @configuration_version : String? = nil, @description : String? = nil, @deployment_duration_in_minutes : Int32? = nil, @growth_type : String? = nil, @growth_factor : Float32? = nil, @final_bake_time_in_minutes : Int32? = nil, @state : String? = nil, @event_log : Array(DeploymentEventStruct)? = nil, @percentage_complete : Float32? = nil, @started_at : Time? = nil, @completed_at : Time? = nil)
    end
  end

  class GetDeploymentStrategyRequest
    include AWSSdk::RestJSON::Structure

    # <p>The ID of the deployment strategy to get.</p>
    @[AWSSdk::Field(location: :uri, name: "DeploymentStrategyId", structure: false)]
    property deployment_strategy_id : String

    def initialize(@deployment_strategy_id : String)
    end
  end

  class GetEnvironmentRequest
    include AWSSdk::RestJSON::Structure

    # <p>The ID of the application that includes the environment you want to get.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The ID of the environment you wnat to get.</p>
    @[AWSSdk::Field(location: :uri, name: "EnvironmentId", structure: false)]
    property environment_id : String

    def initialize(@application_id : String, @environment_id : String)
    end
  end

  class GetHostedConfigurationVersionRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The configuration profile ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ConfigurationProfileId", structure: false)]
    property configuration_profile_id : String
    # <p>The version.</p>
    @[AWSSdk::Field(location: :uri, name: "VersionNumber", structure: false)]
    property version_number : Int32

    def initialize(@application_id : String, @configuration_profile_id : String, @version_number : Int32)
    end
  end

  class ListApplicationsRequest
    include AWSSdk::RestJSON::Structure

    # <p>The maximum number of items to return for this call. The call also returns a token that
    # you can specify in a subsequent call to get the next set of results.</p>
    @[AWSSdk::Field(location: :query, name: "max_results", structure: false)]
    property max_results : Int32?
    # <p>A token to start the list. Use this token to get the next set of results.</p>
    @[AWSSdk::Field(location: :query, name: "next_token", structure: false)]
    property next_token : String?

    def initialize(@max_results : Int32? = nil, @next_token : String? = nil)
    end
  end

  class ApplicationsStruct
    include AWSSdk::RestJSON::Structure

    # <p>The elements from this collection.</p>
    @[AWSSdk::Field(location: :body, name: "Items", structure: true)]
    property items : Array(ApplicationStruct)?
    # <p>The token for the next set of items to return. Use this token to get the next set of
    # results.</p>
    @[AWSSdk::Field(location: :body, name: "NextToken", structure: false)]
    property next_token : String?

    def initialize(@items : Array(ApplicationStruct)? = nil, @next_token : String? = nil)
    end
  end

  class ListConfigurationProfilesRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The maximum number of items to return for this call. The call also returns a token that
    # you can specify in a subsequent call to get the next set of results.</p>
    @[AWSSdk::Field(location: :query, name: "max_results", structure: false)]
    property max_results : Int32?
    # <p>A token to start the list. Use this token to get the next set of results.</p>
    @[AWSSdk::Field(location: :query, name: "next_token", structure: false)]
    property next_token : String?

    def initialize(@application_id : String, @max_results : Int32? = nil, @next_token : String? = nil)
    end
  end

  class ConfigurationProfileSummaryStruct
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :body, name: "ApplicationId", structure: false)]
    property application_id : String?
    # <p>The ID of the configuration profile.</p>
    @[AWSSdk::Field(location: :body, name: "Id", structure: false)]
    property id : String?
    # <p>The name of the configuration profile.</p>
    @[AWSSdk::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>The URI location of the configuration.</p>
    @[AWSSdk::Field(location: :body, name: "LocationUri", structure: false)]
    property location_uri : String?
    # <p>The types of validators in the configuration profile.</p>
    @[AWSSdk::Field(location: :body, name: "ValidatorTypes", structure: false)]
    property validator_types : Array(String)?

    def initialize(@application_id : String? = nil, @id : String? = nil, @name : String? = nil, @location_uri : String? = nil, @validator_types : Array(String)? = nil)
    end
  end

  class ConfigurationProfilesStruct
    include AWSSdk::RestJSON::Structure

    # <p>The elements from this collection.</p>
    @[AWSSdk::Field(location: :body, name: "Items", structure: true)]
    property items : Array(ConfigurationProfileSummaryStruct)?
    # <p>The token for the next set of items to return. Use this token to get the next set of
    # results.</p>
    @[AWSSdk::Field(location: :body, name: "NextToken", structure: false)]
    property next_token : String?

    def initialize(@items : Array(ConfigurationProfileSummaryStruct)? = nil, @next_token : String? = nil)
    end
  end

  class ListDeploymentsRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The environment ID.</p>
    @[AWSSdk::Field(location: :uri, name: "EnvironmentId", structure: false)]
    property environment_id : String
    # <p>The maximum number of items to return for this call. The call also returns a token that
    # you can specify in a subsequent call to get the next set of results.</p>
    @[AWSSdk::Field(location: :query, name: "max_results", structure: false)]
    property max_results : Int32?
    # <p>A token to start the list. Use this token to get the next set of results.</p>
    @[AWSSdk::Field(location: :query, name: "next_token", structure: false)]
    property next_token : String?

    def initialize(@application_id : String, @environment_id : String, @max_results : Int32? = nil, @next_token : String? = nil)
    end
  end

  class DeploymentSummaryStruct
    include AWSSdk::RestJSON::Structure

    # <p>The sequence number of the deployment.</p>
    @[AWSSdk::Field(location: :body, name: "DeploymentNumber", structure: false)]
    property deployment_number : Int32?
    # <p>The name of the configuration.</p>
    @[AWSSdk::Field(location: :body, name: "ConfigurationName", structure: false)]
    property configuration_name : String?
    # <p>The version of the configuration.</p>
    @[AWSSdk::Field(location: :body, name: "ConfigurationVersion", structure: false)]
    property configuration_version : String?
    # <p>Total amount of time the deployment lasted.</p>
    @[AWSSdk::Field(location: :body, name: "DeploymentDurationInMinutes", structure: false)]
    property deployment_duration_in_minutes : Int32?
    # <p>The algorithm used to define how percentage grows over time.</p>
    @[AWSSdk::Field(location: :body, name: "GrowthType", structure: false)]
    property growth_type : String?
    # <p>The percentage of targets to receive a deployed configuration during each
    # interval.</p>
    @[AWSSdk::Field(location: :body, name: "GrowthFactor", structure: false)]
    property growth_factor : Float32?
    # <p>The amount of time AppConfig monitors for alarms before considering the deployment to be
    # complete and no longer eligible for automatic roll back.</p>
    @[AWSSdk::Field(location: :body, name: "FinalBakeTimeInMinutes", structure: false)]
    property final_bake_time_in_minutes : Int32?
    # <p>The state of the deployment.</p>
    @[AWSSdk::Field(location: :body, name: "State", structure: false)]
    property state : String?
    # <p>The percentage of targets for which the deployment is available.</p>
    @[AWSSdk::Field(location: :body, name: "PercentageComplete", structure: false)]
    property percentage_complete : Float32?
    # <p>Time the deployment started.</p>
    @[AWSSdk::Field(location: :body, name: "StartedAt", structure: false)]
    property started_at : Time?
    # <p>Time the deployment completed.</p>
    @[AWSSdk::Field(location: :body, name: "CompletedAt", structure: false)]
    property completed_at : Time?

    def initialize(@deployment_number : Int32? = nil, @configuration_name : String? = nil, @configuration_version : String? = nil, @deployment_duration_in_minutes : Int32? = nil, @growth_type : String? = nil, @growth_factor : Float32? = nil, @final_bake_time_in_minutes : Int32? = nil, @state : String? = nil, @percentage_complete : Float32? = nil, @started_at : Time? = nil, @completed_at : Time? = nil)
    end
  end

  class DeploymentsStruct
    include AWSSdk::RestJSON::Structure

    # <p>The elements from this collection.</p>
    @[AWSSdk::Field(location: :body, name: "Items", structure: true)]
    property items : Array(DeploymentSummaryStruct)?
    # <p>The token for the next set of items to return. Use this token to get the next set of
    # results.</p>
    @[AWSSdk::Field(location: :body, name: "NextToken", structure: false)]
    property next_token : String?

    def initialize(@items : Array(DeploymentSummaryStruct)? = nil, @next_token : String? = nil)
    end
  end

  class ListDeploymentStrategiesRequest
    include AWSSdk::RestJSON::Structure

    # <p>The maximum number of items to return for this call. The call also returns a token that
    # you can specify in a subsequent call to get the next set of results.</p>
    @[AWSSdk::Field(location: :query, name: "max_results", structure: false)]
    property max_results : Int32?
    # <p>A token to start the list. Use this token to get the next set of results.</p>
    @[AWSSdk::Field(location: :query, name: "next_token", structure: false)]
    property next_token : String?

    def initialize(@max_results : Int32? = nil, @next_token : String? = nil)
    end
  end

  class DeploymentStrategiesStruct
    include AWSSdk::RestJSON::Structure

    # <p>The elements from this collection.</p>
    @[AWSSdk::Field(location: :body, name: "Items", structure: true)]
    property items : Array(DeploymentStrategyStruct)?
    # <p>The token for the next set of items to return. Use this token to get the next set of
    # results.</p>
    @[AWSSdk::Field(location: :body, name: "NextToken", structure: false)]
    property next_token : String?

    def initialize(@items : Array(DeploymentStrategyStruct)? = nil, @next_token : String? = nil)
    end
  end

  class ListEnvironmentsRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The maximum number of items to return for this call. The call also returns a token that
    # you can specify in a subsequent call to get the next set of results.</p>
    @[AWSSdk::Field(location: :query, name: "max_results", structure: false)]
    property max_results : Int32?
    # <p>A token to start the list. Use this token to get the next set of results.</p>
    @[AWSSdk::Field(location: :query, name: "next_token", structure: false)]
    property next_token : String?

    def initialize(@application_id : String, @max_results : Int32? = nil, @next_token : String? = nil)
    end
  end

  class EnvironmentsStruct
    include AWSSdk::RestJSON::Structure

    # <p>The elements from this collection.</p>
    @[AWSSdk::Field(location: :body, name: "Items", structure: true)]
    property items : Array(EnvironmentStruct)?
    # <p>The token for the next set of items to return. Use this token to get the next set of
    # results.</p>
    @[AWSSdk::Field(location: :body, name: "NextToken", structure: false)]
    property next_token : String?

    def initialize(@items : Array(EnvironmentStruct)? = nil, @next_token : String? = nil)
    end
  end

  class ListHostedConfigurationVersionsRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The configuration profile ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ConfigurationProfileId", structure: false)]
    property configuration_profile_id : String
    # <p>The maximum number of items to return for this call. The call also returns a token that
    # you can specify in a subsequent call to get the next set of results.</p>
    @[AWSSdk::Field(location: :query, name: "max_results", structure: false)]
    property max_results : Int32?
    # <p>A token to start the list. Use this token to get the next set of results. </p>
    @[AWSSdk::Field(location: :query, name: "next_token", structure: false)]
    property next_token : String?

    def initialize(@application_id : String, @configuration_profile_id : String, @max_results : Int32? = nil, @next_token : String? = nil)
    end
  end

  class HostedConfigurationVersionSummaryStruct
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :body, name: "ApplicationId", structure: false)]
    property application_id : String?
    # <p>The configuration profile ID.</p>
    @[AWSSdk::Field(location: :body, name: "ConfigurationProfileId", structure: false)]
    property configuration_profile_id : String?
    # <p>The configuration version.</p>
    @[AWSSdk::Field(location: :body, name: "VersionNumber", structure: false)]
    property version_number : Int32?
    # <p>A description of the configuration.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>A standard MIME type describing the format of the configuration content. For more
    # information, see <a href="https://docs.aws.amazon.com/https:/www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.</p>
    @[AWSSdk::Field(location: :body, name: "ContentType", structure: false)]
    property content_type : String?

    def initialize(@application_id : String? = nil, @configuration_profile_id : String? = nil, @version_number : Int32? = nil, @description : String? = nil, @content_type : String? = nil)
    end
  end

  class HostedConfigurationVersionsStruct
    include AWSSdk::RestJSON::Structure

    # <p>The elements from this collection.</p>
    @[AWSSdk::Field(location: :body, name: "Items", structure: true)]
    property items : Array(HostedConfigurationVersionSummaryStruct)?
    # <p>The token for the next set of items to return. Use this token to get the next set of
    # results.</p>
    @[AWSSdk::Field(location: :body, name: "NextToken", structure: false)]
    property next_token : String?

    def initialize(@items : Array(HostedConfigurationVersionSummaryStruct)? = nil, @next_token : String? = nil)
    end
  end

  class ListTagsForResourceRequest
    include AWSSdk::RestJSON::Structure

    # <p>The resource ARN.</p>
    @[AWSSdk::Field(location: :uri, name: "ResourceArn", structure: false)]
    property resource_arn : String

    def initialize(@resource_arn : String)
    end
  end

  class ResourceTagsStruct
    include AWSSdk::RestJSON::Structure

    # <p>Metadata to assign to AppConfig resources. Tags help organize and categorize your
    # AppConfig resources. Each tag consists of a key and an optional value, both of which you
    # define.</p>
    @[AWSSdk::Field(location: :body, name: "Tags", structure: false)]
    property tags : Hash(String, String)?

    def initialize(@tags : Hash(String, String)? = nil)
    end
  end

  class StartDeploymentRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The environment ID.</p>
    @[AWSSdk::Field(location: :uri, name: "EnvironmentId", structure: false)]
    property environment_id : String
    # <p>The deployment strategy ID.</p>
    @[AWSSdk::Field(location: :body, name: "DeploymentStrategyId", structure: false)]
    property deployment_strategy_id : String
    # <p>The configuration profile ID.</p>
    @[AWSSdk::Field(location: :body, name: "ConfigurationProfileId", structure: false)]
    property configuration_profile_id : String
    # <p>The configuration version to deploy.</p>
    @[AWSSdk::Field(location: :body, name: "ConfigurationVersion", structure: false)]
    property configuration_version : String
    # <p>A description of the deployment.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>Metadata to assign to the deployment. Tags help organize and categorize your AppConfig
    # resources. Each tag consists of a key and an optional value, both of which you
    # define.</p>
    @[AWSSdk::Field(location: :body, name: "Tags", structure: false)]
    property tags : Hash(String, String)?

    def initialize(@application_id : String, @environment_id : String, @deployment_strategy_id : String, @configuration_profile_id : String, @configuration_version : String, @description : String? = nil, @tags : Hash(String, String)? = nil)
    end
  end

  class StopDeploymentRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The environment ID.</p>
    @[AWSSdk::Field(location: :uri, name: "EnvironmentId", structure: false)]
    property environment_id : String
    # <p>The sequence number of the deployment.</p>
    @[AWSSdk::Field(location: :uri, name: "DeploymentNumber", structure: false)]
    property deployment_number : Int32

    def initialize(@application_id : String, @environment_id : String, @deployment_number : Int32)
    end
  end

  class TagResourceRequest
    include AWSSdk::RestJSON::Structure

    # <p>The ARN of the resource for which to retrieve tags.</p>
    @[AWSSdk::Field(location: :uri, name: "ResourceArn", structure: false)]
    property resource_arn : String
    # <p>The key-value string map. The valid character set is [a-zA-Z+-=._:/]. The tag key can be
    # up to 128 characters and must not start with <code>aws:</code>. The tag value can be up to
    # 256 characters.</p>
    @[AWSSdk::Field(location: :body, name: "Tags", structure: false)]
    property tags : Hash(String, String)

    def initialize(@resource_arn : String, @tags : Hash(String, String))
    end
  end

  class UntagResourceRequest
    include AWSSdk::RestJSON::Structure

    # <p>The ARN of the resource for which to remove tags.</p>
    @[AWSSdk::Field(location: :uri, name: "ResourceArn", structure: false)]
    property resource_arn : String
    # <p>The tag keys to delete.</p>
    @[AWSSdk::Field(location: :query, name: "tagKeys", structure: false)]
    property tag_keys : Array(String)

    def initialize(@resource_arn : String, @tag_keys : Array(String))
    end
  end

  class UpdateApplicationRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The name of the application.</p>
    @[AWSSdk::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>A description of the application.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?

    def initialize(@application_id : String, @name : String? = nil, @description : String? = nil)
    end
  end

  class UpdateConfigurationProfileRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The ID of the configuration profile.</p>
    @[AWSSdk::Field(location: :uri, name: "ConfigurationProfileId", structure: false)]
    property configuration_profile_id : String
    # <p>The name of the configuration profile.</p>
    @[AWSSdk::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>A description of the configuration profile.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>The ARN of an IAM role with permission to access the configuration at the specified
    # LocationUri.</p>
    @[AWSSdk::Field(location: :body, name: "RetrievalRoleArn", structure: false)]
    property retrieval_role_arn : String?
    # <p>A list of methods for validating the configuration.</p>
    @[AWSSdk::Field(location: :body, name: "Validators", structure: true)]
    property validators : Array(ValidatorStruct)?

    def initialize(@application_id : String, @configuration_profile_id : String, @name : String? = nil, @description : String? = nil, @retrieval_role_arn : String? = nil, @validators : Array(ValidatorStruct)? = nil)
    end
  end

  class UpdateDeploymentStrategyRequest
    include AWSSdk::RestJSON::Structure

    # <p>The deployment strategy ID.</p>
    @[AWSSdk::Field(location: :uri, name: "DeploymentStrategyId", structure: false)]
    property deployment_strategy_id : String
    # <p>A description of the deployment strategy.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>Total amount of time for a deployment to last.</p>
    @[AWSSdk::Field(location: :body, name: "DeploymentDurationInMinutes", structure: false)]
    property deployment_duration_in_minutes : Int32?
    # <p>The amount of time AppConfig monitors for alarms before considering the deployment to be
    # complete and no longer eligible for automatic roll back.</p>
    @[AWSSdk::Field(location: :body, name: "FinalBakeTimeInMinutes", structure: false)]
    property final_bake_time_in_minutes : Int32?
    # <p>The percentage of targets to receive a deployed configuration during each
    # interval.</p>
    @[AWSSdk::Field(location: :body, name: "GrowthFactor", structure: false)]
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
    @[AWSSdk::Field(location: :body, name: "GrowthType", structure: false)]
    property growth_type : String?

    def initialize(@deployment_strategy_id : String, @description : String? = nil, @deployment_duration_in_minutes : Int32? = nil, @final_bake_time_in_minutes : Int32? = nil, @growth_factor : Float32? = nil, @growth_type : String? = nil)
    end
  end

  class UpdateEnvironmentRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The environment ID.</p>
    @[AWSSdk::Field(location: :uri, name: "EnvironmentId", structure: false)]
    property environment_id : String
    # <p>The name of the environment.</p>
    @[AWSSdk::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>A description of the environment.</p>
    @[AWSSdk::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>Amazon CloudWatch alarms to monitor during the deployment process.</p>
    @[AWSSdk::Field(location: :body, name: "Monitors", structure: true)]
    property monitors : Array(MonitorStruct)?

    def initialize(@application_id : String, @environment_id : String, @name : String? = nil, @description : String? = nil, @monitors : Array(MonitorStruct)? = nil)
    end
  end

  class ValidateConfigurationRequest
    include AWSSdk::RestJSON::Structure

    # <p>The application ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ApplicationId", structure: false)]
    property application_id : String
    # <p>The configuration profile ID.</p>
    @[AWSSdk::Field(location: :uri, name: "ConfigurationProfileId", structure: false)]
    property configuration_profile_id : String
    # <p>The version of the configuration to validate.</p>
    @[AWSSdk::Field(location: :query, name: "configuration_version", structure: false)]
    property configuration_version : String

    def initialize(@application_id : String, @configuration_profile_id : String, @configuration_version : String)
    end
  end



end
