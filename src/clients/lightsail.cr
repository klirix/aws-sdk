require "../protocols/json1_1"
require "json"

require "./baseclient"

module Lightsail
  ENDPOINT_PREFIX = "lightsail"

  module Methods
    abstract def send(request : HTTP::Request, prefix : String, success_code : Int32?)

    def lightsail : LightsailMethods
      if internal = @internal_lightsail
        internal
      else
        @internal_lightsail = LightsailMethods.new(self)
      end
    end

    class LightsailMethods
      def initialize(@parent : Lightsail::Methods)
      end

      def send(request : HTTP::Request, prefix : String, success_code : Int32?)
        @parent.send(request, prefix, success_code)
      end

      def allocate_static_ip(allocate_static_ip_request : AllocateStaticIpRequest) : AllocateStaticIpResult
        request = HTTP::Request.new "POST", "/"
        AllocateStaticIpResult.new send(allocate_static_ip_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def attach_certificate_to_distribution(attach_certificate_to_distribution_request : AttachCertificateToDistributionRequest) : AttachCertificateToDistributionResult
        request = HTTP::Request.new "POST", "/"
        AttachCertificateToDistributionResult.new send(attach_certificate_to_distribution_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def attach_disk(attach_disk_request : AttachDiskRequest) : AttachDiskResult
        request = HTTP::Request.new "POST", "/"
        AttachDiskResult.new send(attach_disk_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def attach_instances_to_load_balancer(attach_instances_to_load_balancer_request : AttachInstancesToLoadBalancerRequest) : AttachInstancesToLoadBalancerResult
        request = HTTP::Request.new "POST", "/"
        AttachInstancesToLoadBalancerResult.new send(attach_instances_to_load_balancer_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def attach_load_balancer_tls_certificate(attach_load_balancer_tls_certificate_request : AttachLoadBalancerTlsCertificateRequest) : AttachLoadBalancerTlsCertificateResult
        request = HTTP::Request.new "POST", "/"
        AttachLoadBalancerTlsCertificateResult.new send(attach_load_balancer_tls_certificate_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def attach_static_ip(attach_static_ip_request : AttachStaticIpRequest) : AttachStaticIpResult
        request = HTTP::Request.new "POST", "/"
        AttachStaticIpResult.new send(attach_static_ip_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def close_instance_public_ports(close_instance_public_ports_request : CloseInstancePublicPortsRequest) : CloseInstancePublicPortsResult
        request = HTTP::Request.new "POST", "/"
        CloseInstancePublicPortsResult.new send(close_instance_public_ports_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def copy_snapshot(copy_snapshot_request : CopySnapshotRequest) : CopySnapshotResult
        request = HTTP::Request.new "POST", "/"
        CopySnapshotResult.new send(copy_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_bucket(create_bucket_request : CreateBucketRequest) : CreateBucketResult
        request = HTTP::Request.new "POST", "/"
        CreateBucketResult.new send(create_bucket_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_bucket_access_key(create_bucket_access_key_request : CreateBucketAccessKeyRequest) : CreateBucketAccessKeyResult
        request = HTTP::Request.new "POST", "/"
        CreateBucketAccessKeyResult.new send(create_bucket_access_key_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_certificate(create_certificate_request : CreateCertificateRequest) : CreateCertificateResult
        request = HTTP::Request.new "POST", "/"
        CreateCertificateResult.new send(create_certificate_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_cloud_formation_stack(create_cloud_formation_stack_request : CreateCloudFormationStackRequest) : CreateCloudFormationStackResult
        request = HTTP::Request.new "POST", "/"
        CreateCloudFormationStackResult.new send(create_cloud_formation_stack_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_contact_method(create_contact_method_request : CreateContactMethodRequest) : CreateContactMethodResult
        request = HTTP::Request.new "POST", "/"
        CreateContactMethodResult.new send(create_contact_method_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_container_service(create_container_service_request : CreateContainerServiceRequest) : CreateContainerServiceResult
        request = HTTP::Request.new "POST", "/"
        CreateContainerServiceResult.new send(create_container_service_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_container_service_deployment(create_container_service_deployment_request : CreateContainerServiceDeploymentRequest) : CreateContainerServiceDeploymentResult
        request = HTTP::Request.new "POST", "/"
        CreateContainerServiceDeploymentResult.new send(create_container_service_deployment_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_container_service_registry_login(create_container_service_registry_login_request : CreateContainerServiceRegistryLoginRequest) : CreateContainerServiceRegistryLoginResult
        request = HTTP::Request.new "POST", "/"
        CreateContainerServiceRegistryLoginResult.new send(create_container_service_registry_login_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_disk(create_disk_request : CreateDiskRequest) : CreateDiskResult
        request = HTTP::Request.new "POST", "/"
        CreateDiskResult.new send(create_disk_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_disk_from_snapshot(create_disk_from_snapshot_request : CreateDiskFromSnapshotRequest) : CreateDiskFromSnapshotResult
        request = HTTP::Request.new "POST", "/"
        CreateDiskFromSnapshotResult.new send(create_disk_from_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_disk_snapshot(create_disk_snapshot_request : CreateDiskSnapshotRequest) : CreateDiskSnapshotResult
        request = HTTP::Request.new "POST", "/"
        CreateDiskSnapshotResult.new send(create_disk_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_distribution(create_distribution_request : CreateDistributionRequest) : CreateDistributionResult
        request = HTTP::Request.new "POST", "/"
        CreateDistributionResult.new send(create_distribution_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_domain(create_domain_request : CreateDomainRequest) : CreateDomainResult
        request = HTTP::Request.new "POST", "/"
        CreateDomainResult.new send(create_domain_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_domain_entry(create_domain_entry_request : CreateDomainEntryRequest) : CreateDomainEntryResult
        request = HTTP::Request.new "POST", "/"
        CreateDomainEntryResult.new send(create_domain_entry_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_instance_snapshot(create_instance_snapshot_request : CreateInstanceSnapshotRequest) : CreateInstanceSnapshotResult
        request = HTTP::Request.new "POST", "/"
        CreateInstanceSnapshotResult.new send(create_instance_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_instances(create_instances_request : CreateInstancesRequest) : CreateInstancesResult
        request = HTTP::Request.new "POST", "/"
        CreateInstancesResult.new send(create_instances_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_instances_from_snapshot(create_instances_from_snapshot_request : CreateInstancesFromSnapshotRequest) : CreateInstancesFromSnapshotResult
        request = HTTP::Request.new "POST", "/"
        CreateInstancesFromSnapshotResult.new send(create_instances_from_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_key_pair(create_key_pair_request : CreateKeyPairRequest) : CreateKeyPairResult
        request = HTTP::Request.new "POST", "/"
        CreateKeyPairResult.new send(create_key_pair_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_load_balancer(create_load_balancer_request : CreateLoadBalancerRequest) : CreateLoadBalancerResult
        request = HTTP::Request.new "POST", "/"
        CreateLoadBalancerResult.new send(create_load_balancer_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_load_balancer_tls_certificate(create_load_balancer_tls_certificate_request : CreateLoadBalancerTlsCertificateRequest) : CreateLoadBalancerTlsCertificateResult
        request = HTTP::Request.new "POST", "/"
        CreateLoadBalancerTlsCertificateResult.new send(create_load_balancer_tls_certificate_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_relational_database(create_relational_database_request : CreateRelationalDatabaseRequest) : CreateRelationalDatabaseResult
        request = HTTP::Request.new "POST", "/"
        CreateRelationalDatabaseResult.new send(create_relational_database_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_relational_database_from_snapshot(create_relational_database_from_snapshot_request : CreateRelationalDatabaseFromSnapshotRequest) : CreateRelationalDatabaseFromSnapshotResult
        request = HTTP::Request.new "POST", "/"
        CreateRelationalDatabaseFromSnapshotResult.new send(create_relational_database_from_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def create_relational_database_snapshot(create_relational_database_snapshot_request : CreateRelationalDatabaseSnapshotRequest) : CreateRelationalDatabaseSnapshotResult
        request = HTTP::Request.new "POST", "/"
        CreateRelationalDatabaseSnapshotResult.new send(create_relational_database_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_alarm(delete_alarm_request : DeleteAlarmRequest) : DeleteAlarmResult
        request = HTTP::Request.new "POST", "/"
        DeleteAlarmResult.new send(delete_alarm_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_auto_snapshot(delete_auto_snapshot_request : DeleteAutoSnapshotRequest) : DeleteAutoSnapshotResult
        request = HTTP::Request.new "POST", "/"
        DeleteAutoSnapshotResult.new send(delete_auto_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_bucket(delete_bucket_request : DeleteBucketRequest) : DeleteBucketResult
        request = HTTP::Request.new "POST", "/"
        DeleteBucketResult.new send(delete_bucket_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_bucket_access_key(delete_bucket_access_key_request : DeleteBucketAccessKeyRequest) : DeleteBucketAccessKeyResult
        request = HTTP::Request.new "POST", "/"
        DeleteBucketAccessKeyResult.new send(delete_bucket_access_key_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_certificate(delete_certificate_request : DeleteCertificateRequest) : DeleteCertificateResult
        request = HTTP::Request.new "POST", "/"
        DeleteCertificateResult.new send(delete_certificate_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_contact_method(delete_contact_method_request : DeleteContactMethodRequest) : DeleteContactMethodResult
        request = HTTP::Request.new "POST", "/"
        DeleteContactMethodResult.new send(delete_contact_method_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_container_image(delete_container_image_request : DeleteContainerImageRequest) : DeleteContainerImageResult
        request = HTTP::Request.new "POST", "/"
        DeleteContainerImageResult.new send(delete_container_image_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_container_service(delete_container_service_request : DeleteContainerServiceRequest) : DeleteContainerServiceResult
        request = HTTP::Request.new "POST", "/"
        DeleteContainerServiceResult.new send(delete_container_service_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_disk(delete_disk_request : DeleteDiskRequest) : DeleteDiskResult
        request = HTTP::Request.new "POST", "/"
        DeleteDiskResult.new send(delete_disk_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_disk_snapshot(delete_disk_snapshot_request : DeleteDiskSnapshotRequest) : DeleteDiskSnapshotResult
        request = HTTP::Request.new "POST", "/"
        DeleteDiskSnapshotResult.new send(delete_disk_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_distribution(delete_distribution_request : DeleteDistributionRequest) : DeleteDistributionResult
        request = HTTP::Request.new "POST", "/"
        DeleteDistributionResult.new send(delete_distribution_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_domain(delete_domain_request : DeleteDomainRequest) : DeleteDomainResult
        request = HTTP::Request.new "POST", "/"
        DeleteDomainResult.new send(delete_domain_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_domain_entry(delete_domain_entry_request : DeleteDomainEntryRequest) : DeleteDomainEntryResult
        request = HTTP::Request.new "POST", "/"
        DeleteDomainEntryResult.new send(delete_domain_entry_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_instance(delete_instance_request : DeleteInstanceRequest) : DeleteInstanceResult
        request = HTTP::Request.new "POST", "/"
        DeleteInstanceResult.new send(delete_instance_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_instance_snapshot(delete_instance_snapshot_request : DeleteInstanceSnapshotRequest) : DeleteInstanceSnapshotResult
        request = HTTP::Request.new "POST", "/"
        DeleteInstanceSnapshotResult.new send(delete_instance_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_key_pair(delete_key_pair_request : DeleteKeyPairRequest) : DeleteKeyPairResult
        request = HTTP::Request.new "POST", "/"
        DeleteKeyPairResult.new send(delete_key_pair_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_known_host_keys(delete_known_host_keys_request : DeleteKnownHostKeysRequest) : DeleteKnownHostKeysResult
        request = HTTP::Request.new "POST", "/"
        DeleteKnownHostKeysResult.new send(delete_known_host_keys_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_load_balancer(delete_load_balancer_request : DeleteLoadBalancerRequest) : DeleteLoadBalancerResult
        request = HTTP::Request.new "POST", "/"
        DeleteLoadBalancerResult.new send(delete_load_balancer_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_load_balancer_tls_certificate(delete_load_balancer_tls_certificate_request : DeleteLoadBalancerTlsCertificateRequest) : DeleteLoadBalancerTlsCertificateResult
        request = HTTP::Request.new "POST", "/"
        DeleteLoadBalancerTlsCertificateResult.new send(delete_load_balancer_tls_certificate_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_relational_database(delete_relational_database_request : DeleteRelationalDatabaseRequest) : DeleteRelationalDatabaseResult
        request = HTTP::Request.new "POST", "/"
        DeleteRelationalDatabaseResult.new send(delete_relational_database_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def delete_relational_database_snapshot(delete_relational_database_snapshot_request : DeleteRelationalDatabaseSnapshotRequest) : DeleteRelationalDatabaseSnapshotResult
        request = HTTP::Request.new "POST", "/"
        DeleteRelationalDatabaseSnapshotResult.new send(delete_relational_database_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def detach_certificate_from_distribution(detach_certificate_from_distribution_request : DetachCertificateFromDistributionRequest) : DetachCertificateFromDistributionResult
        request = HTTP::Request.new "POST", "/"
        DetachCertificateFromDistributionResult.new send(detach_certificate_from_distribution_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def detach_disk(detach_disk_request : DetachDiskRequest) : DetachDiskResult
        request = HTTP::Request.new "POST", "/"
        DetachDiskResult.new send(detach_disk_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def detach_instances_from_load_balancer(detach_instances_from_load_balancer_request : DetachInstancesFromLoadBalancerRequest) : DetachInstancesFromLoadBalancerResult
        request = HTTP::Request.new "POST", "/"
        DetachInstancesFromLoadBalancerResult.new send(detach_instances_from_load_balancer_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def detach_static_ip(detach_static_ip_request : DetachStaticIpRequest) : DetachStaticIpResult
        request = HTTP::Request.new "POST", "/"
        DetachStaticIpResult.new send(detach_static_ip_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def disable_add_on(disable_add_on_request : DisableAddOnRequest) : DisableAddOnResult
        request = HTTP::Request.new "POST", "/"
        DisableAddOnResult.new send(disable_add_on_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def download_default_key_pair(download_default_key_pair_request : DownloadDefaultKeyPairRequest) : DownloadDefaultKeyPairResult
        request = HTTP::Request.new "POST", "/"
        DownloadDefaultKeyPairResult.new send(download_default_key_pair_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def enable_add_on(enable_add_on_request : EnableAddOnRequest) : EnableAddOnResult
        request = HTTP::Request.new "POST", "/"
        EnableAddOnResult.new send(enable_add_on_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def export_snapshot(export_snapshot_request : ExportSnapshotRequest) : ExportSnapshotResult
        request = HTTP::Request.new "POST", "/"
        ExportSnapshotResult.new send(export_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_active_names(get_active_names_request : GetActiveNamesRequest) : GetActiveNamesResult
        request = HTTP::Request.new "POST", "/"
        GetActiveNamesResult.new send(get_active_names_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_alarms(get_alarms_request : GetAlarmsRequest) : GetAlarmsResult
        request = HTTP::Request.new "POST", "/"
        GetAlarmsResult.new send(get_alarms_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_auto_snapshots(get_auto_snapshots_request : GetAutoSnapshotsRequest) : GetAutoSnapshotsResult
        request = HTTP::Request.new "POST", "/"
        GetAutoSnapshotsResult.new send(get_auto_snapshots_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_blueprints(get_blueprints_request : GetBlueprintsRequest) : GetBlueprintsResult
        request = HTTP::Request.new "POST", "/"
        GetBlueprintsResult.new send(get_blueprints_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_bucket_access_keys(get_bucket_access_keys_request : GetBucketAccessKeysRequest) : GetBucketAccessKeysResult
        request = HTTP::Request.new "POST", "/"
        GetBucketAccessKeysResult.new send(get_bucket_access_keys_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_bucket_bundles(get_bucket_bundles_request : GetBucketBundlesRequest) : GetBucketBundlesResult
        request = HTTP::Request.new "POST", "/"
        GetBucketBundlesResult.new send(get_bucket_bundles_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_bucket_metric_data(get_bucket_metric_data_request : GetBucketMetricDataRequest) : GetBucketMetricDataResult
        request = HTTP::Request.new "POST", "/"
        GetBucketMetricDataResult.new send(get_bucket_metric_data_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_buckets(get_buckets_request : GetBucketsRequest) : GetBucketsResult
        request = HTTP::Request.new "POST", "/"
        GetBucketsResult.new send(get_buckets_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_bundles(get_bundles_request : GetBundlesRequest) : GetBundlesResult
        request = HTTP::Request.new "POST", "/"
        GetBundlesResult.new send(get_bundles_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_certificates(get_certificates_request : GetCertificatesRequest) : GetCertificatesResult
        request = HTTP::Request.new "POST", "/"
        GetCertificatesResult.new send(get_certificates_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_cloud_formation_stack_records(get_cloud_formation_stack_records_request : GetCloudFormationStackRecordsRequest) : GetCloudFormationStackRecordsResult
        request = HTTP::Request.new "POST", "/"
        GetCloudFormationStackRecordsResult.new send(get_cloud_formation_stack_records_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_contact_methods(get_contact_methods_request : GetContactMethodsRequest) : GetContactMethodsResult
        request = HTTP::Request.new "POST", "/"
        GetContactMethodsResult.new send(get_contact_methods_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_container_api_metadata(get_container_api_metadata_request : GetContainerAPIMetadataRequest) : GetContainerAPIMetadataResult
        request = HTTP::Request.new "POST", "/"
        GetContainerAPIMetadataResult.new send(get_container_api_metadata_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_container_images(get_container_images_request : GetContainerImagesRequest) : GetContainerImagesResult
        request = HTTP::Request.new "POST", "/"
        GetContainerImagesResult.new send(get_container_images_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_container_log(get_container_log_request : GetContainerLogRequest) : GetContainerLogResult
        request = HTTP::Request.new "POST", "/"
        GetContainerLogResult.new send(get_container_log_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_container_service_deployments(get_container_service_deployments_request : GetContainerServiceDeploymentsRequest) : GetContainerServiceDeploymentsResult
        request = HTTP::Request.new "POST", "/"
        GetContainerServiceDeploymentsResult.new send(get_container_service_deployments_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_container_service_metric_data(get_container_service_metric_data_request : GetContainerServiceMetricDataRequest) : GetContainerServiceMetricDataResult
        request = HTTP::Request.new "POST", "/"
        GetContainerServiceMetricDataResult.new send(get_container_service_metric_data_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_container_service_powers(get_container_service_powers_request : GetContainerServicePowersRequest) : GetContainerServicePowersResult
        request = HTTP::Request.new "POST", "/"
        GetContainerServicePowersResult.new send(get_container_service_powers_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_container_services(get_container_services_request : GetContainerServicesRequest) : ContainerServicesListResult
        request = HTTP::Request.new "POST", "/"
        ContainerServicesListResult.new send(get_container_services_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_disk(get_disk_request : GetDiskRequest) : GetDiskResult
        request = HTTP::Request.new "POST", "/"
        GetDiskResult.new send(get_disk_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_disk_snapshot(get_disk_snapshot_request : GetDiskSnapshotRequest) : GetDiskSnapshotResult
        request = HTTP::Request.new "POST", "/"
        GetDiskSnapshotResult.new send(get_disk_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_disk_snapshots(get_disk_snapshots_request : GetDiskSnapshotsRequest) : GetDiskSnapshotsResult
        request = HTTP::Request.new "POST", "/"
        GetDiskSnapshotsResult.new send(get_disk_snapshots_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_disks(get_disks_request : GetDisksRequest) : GetDisksResult
        request = HTTP::Request.new "POST", "/"
        GetDisksResult.new send(get_disks_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_distribution_bundles(get_distribution_bundles_request : GetDistributionBundlesRequest) : GetDistributionBundlesResult
        request = HTTP::Request.new "POST", "/"
        GetDistributionBundlesResult.new send(get_distribution_bundles_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_distribution_latest_cache_reset(get_distribution_latest_cache_reset_request : GetDistributionLatestCacheResetRequest) : GetDistributionLatestCacheResetResult
        request = HTTP::Request.new "POST", "/"
        GetDistributionLatestCacheResetResult.new send(get_distribution_latest_cache_reset_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_distribution_metric_data(get_distribution_metric_data_request : GetDistributionMetricDataRequest) : GetDistributionMetricDataResult
        request = HTTP::Request.new "POST", "/"
        GetDistributionMetricDataResult.new send(get_distribution_metric_data_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_distributions(get_distributions_request : GetDistributionsRequest) : GetDistributionsResult
        request = HTTP::Request.new "POST", "/"
        GetDistributionsResult.new send(get_distributions_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_domain(get_domain_request : GetDomainRequest) : GetDomainResult
        request = HTTP::Request.new "POST", "/"
        GetDomainResult.new send(get_domain_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_domains(get_domains_request : GetDomainsRequest) : GetDomainsResult
        request = HTTP::Request.new "POST", "/"
        GetDomainsResult.new send(get_domains_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_export_snapshot_records(get_export_snapshot_records_request : GetExportSnapshotRecordsRequest) : GetExportSnapshotRecordsResult
        request = HTTP::Request.new "POST", "/"
        GetExportSnapshotRecordsResult.new send(get_export_snapshot_records_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_instance(get_instance_request : GetInstanceRequest) : GetInstanceResult
        request = HTTP::Request.new "POST", "/"
        GetInstanceResult.new send(get_instance_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_instance_access_details(get_instance_access_details_request : GetInstanceAccessDetailsRequest) : GetInstanceAccessDetailsResult
        request = HTTP::Request.new "POST", "/"
        GetInstanceAccessDetailsResult.new send(get_instance_access_details_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_instance_metric_data(get_instance_metric_data_request : GetInstanceMetricDataRequest) : GetInstanceMetricDataResult
        request = HTTP::Request.new "POST", "/"
        GetInstanceMetricDataResult.new send(get_instance_metric_data_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_instance_port_states(get_instance_port_states_request : GetInstancePortStatesRequest) : GetInstancePortStatesResult
        request = HTTP::Request.new "POST", "/"
        GetInstancePortStatesResult.new send(get_instance_port_states_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_instance_snapshot(get_instance_snapshot_request : GetInstanceSnapshotRequest) : GetInstanceSnapshotResult
        request = HTTP::Request.new "POST", "/"
        GetInstanceSnapshotResult.new send(get_instance_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_instance_snapshots(get_instance_snapshots_request : GetInstanceSnapshotsRequest) : GetInstanceSnapshotsResult
        request = HTTP::Request.new "POST", "/"
        GetInstanceSnapshotsResult.new send(get_instance_snapshots_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_instance_state(get_instance_state_request : GetInstanceStateRequest) : GetInstanceStateResult
        request = HTTP::Request.new "POST", "/"
        GetInstanceStateResult.new send(get_instance_state_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_instances(get_instances_request : GetInstancesRequest) : GetInstancesResult
        request = HTTP::Request.new "POST", "/"
        GetInstancesResult.new send(get_instances_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_key_pair(get_key_pair_request : GetKeyPairRequest) : GetKeyPairResult
        request = HTTP::Request.new "POST", "/"
        GetKeyPairResult.new send(get_key_pair_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_key_pairs(get_key_pairs_request : GetKeyPairsRequest) : GetKeyPairsResult
        request = HTTP::Request.new "POST", "/"
        GetKeyPairsResult.new send(get_key_pairs_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_load_balancer(get_load_balancer_request : GetLoadBalancerRequest) : GetLoadBalancerResult
        request = HTTP::Request.new "POST", "/"
        GetLoadBalancerResult.new send(get_load_balancer_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_load_balancer_metric_data(get_load_balancer_metric_data_request : GetLoadBalancerMetricDataRequest) : GetLoadBalancerMetricDataResult
        request = HTTP::Request.new "POST", "/"
        GetLoadBalancerMetricDataResult.new send(get_load_balancer_metric_data_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_load_balancer_tls_certificates(get_load_balancer_tls_certificates_request : GetLoadBalancerTlsCertificatesRequest) : GetLoadBalancerTlsCertificatesResult
        request = HTTP::Request.new "POST", "/"
        GetLoadBalancerTlsCertificatesResult.new send(get_load_balancer_tls_certificates_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_load_balancer_tls_policies(get_load_balancer_tls_policies_request : GetLoadBalancerTlsPoliciesRequest) : GetLoadBalancerTlsPoliciesResult
        request = HTTP::Request.new "POST", "/"
        GetLoadBalancerTlsPoliciesResult.new send(get_load_balancer_tls_policies_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_load_balancers(get_load_balancers_request : GetLoadBalancersRequest) : GetLoadBalancersResult
        request = HTTP::Request.new "POST", "/"
        GetLoadBalancersResult.new send(get_load_balancers_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_operation(get_operation_request : GetOperationRequest) : GetOperationResult
        request = HTTP::Request.new "POST", "/"
        GetOperationResult.new send(get_operation_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_operations(get_operations_request : GetOperationsRequest) : GetOperationsResult
        request = HTTP::Request.new "POST", "/"
        GetOperationsResult.new send(get_operations_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_operations_for_resource(get_operations_for_resource_request : GetOperationsForResourceRequest) : GetOperationsForResourceResult
        request = HTTP::Request.new "POST", "/"
        GetOperationsForResourceResult.new send(get_operations_for_resource_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_regions(get_regions_request : GetRegionsRequest) : GetRegionsResult
        request = HTTP::Request.new "POST", "/"
        GetRegionsResult.new send(get_regions_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_relational_database(get_relational_database_request : GetRelationalDatabaseRequest) : GetRelationalDatabaseResult
        request = HTTP::Request.new "POST", "/"
        GetRelationalDatabaseResult.new send(get_relational_database_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_relational_database_blueprints(get_relational_database_blueprints_request : GetRelationalDatabaseBlueprintsRequest) : GetRelationalDatabaseBlueprintsResult
        request = HTTP::Request.new "POST", "/"
        GetRelationalDatabaseBlueprintsResult.new send(get_relational_database_blueprints_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_relational_database_bundles(get_relational_database_bundles_request : GetRelationalDatabaseBundlesRequest) : GetRelationalDatabaseBundlesResult
        request = HTTP::Request.new "POST", "/"
        GetRelationalDatabaseBundlesResult.new send(get_relational_database_bundles_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_relational_database_events(get_relational_database_events_request : GetRelationalDatabaseEventsRequest) : GetRelationalDatabaseEventsResult
        request = HTTP::Request.new "POST", "/"
        GetRelationalDatabaseEventsResult.new send(get_relational_database_events_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_relational_database_log_events(get_relational_database_log_events_request : GetRelationalDatabaseLogEventsRequest) : GetRelationalDatabaseLogEventsResult
        request = HTTP::Request.new "POST", "/"
        GetRelationalDatabaseLogEventsResult.new send(get_relational_database_log_events_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_relational_database_log_streams(get_relational_database_log_streams_request : GetRelationalDatabaseLogStreamsRequest) : GetRelationalDatabaseLogStreamsResult
        request = HTTP::Request.new "POST", "/"
        GetRelationalDatabaseLogStreamsResult.new send(get_relational_database_log_streams_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_relational_database_master_user_password(get_relational_database_master_user_password_request : GetRelationalDatabaseMasterUserPasswordRequest) : GetRelationalDatabaseMasterUserPasswordResult
        request = HTTP::Request.new "POST", "/"
        GetRelationalDatabaseMasterUserPasswordResult.new send(get_relational_database_master_user_password_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_relational_database_metric_data(get_relational_database_metric_data_request : GetRelationalDatabaseMetricDataRequest) : GetRelationalDatabaseMetricDataResult
        request = HTTP::Request.new "POST", "/"
        GetRelationalDatabaseMetricDataResult.new send(get_relational_database_metric_data_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_relational_database_parameters(get_relational_database_parameters_request : GetRelationalDatabaseParametersRequest) : GetRelationalDatabaseParametersResult
        request = HTTP::Request.new "POST", "/"
        GetRelationalDatabaseParametersResult.new send(get_relational_database_parameters_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_relational_database_snapshot(get_relational_database_snapshot_request : GetRelationalDatabaseSnapshotRequest) : GetRelationalDatabaseSnapshotResult
        request = HTTP::Request.new "POST", "/"
        GetRelationalDatabaseSnapshotResult.new send(get_relational_database_snapshot_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_relational_database_snapshots(get_relational_database_snapshots_request : GetRelationalDatabaseSnapshotsRequest) : GetRelationalDatabaseSnapshotsResult
        request = HTTP::Request.new "POST", "/"
        GetRelationalDatabaseSnapshotsResult.new send(get_relational_database_snapshots_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_relational_databases(get_relational_databases_request : GetRelationalDatabasesRequest) : GetRelationalDatabasesResult
        request = HTTP::Request.new "POST", "/"
        GetRelationalDatabasesResult.new send(get_relational_databases_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_static_ip(get_static_ip_request : GetStaticIpRequest) : GetStaticIpResult
        request = HTTP::Request.new "POST", "/"
        GetStaticIpResult.new send(get_static_ip_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def get_static_ips(get_static_ips_request : GetStaticIpsRequest) : GetStaticIpsResult
        request = HTTP::Request.new "POST", "/"
        GetStaticIpsResult.new send(get_static_ips_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def import_key_pair(import_key_pair_request : ImportKeyPairRequest) : ImportKeyPairResult
        request = HTTP::Request.new "POST", "/"
        ImportKeyPairResult.new send(import_key_pair_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def is_vpc_peered(is_vpc_peered_request : IsVpcPeeredRequest) : IsVpcPeeredResult
        request = HTTP::Request.new "POST", "/"
        IsVpcPeeredResult.new send(is_vpc_peered_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def open_instance_public_ports(open_instance_public_ports_request : OpenInstancePublicPortsRequest) : OpenInstancePublicPortsResult
        request = HTTP::Request.new "POST", "/"
        OpenInstancePublicPortsResult.new send(open_instance_public_ports_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def peer_vpc(peer_vpc_request : PeerVpcRequest) : PeerVpcResult
        request = HTTP::Request.new "POST", "/"
        PeerVpcResult.new send(peer_vpc_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def put_alarm(put_alarm_request : PutAlarmRequest) : PutAlarmResult
        request = HTTP::Request.new "POST", "/"
        PutAlarmResult.new send(put_alarm_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def put_instance_public_ports(put_instance_public_ports_request : PutInstancePublicPortsRequest) : PutInstancePublicPortsResult
        request = HTTP::Request.new "POST", "/"
        PutInstancePublicPortsResult.new send(put_instance_public_ports_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def reboot_instance(reboot_instance_request : RebootInstanceRequest) : RebootInstanceResult
        request = HTTP::Request.new "POST", "/"
        RebootInstanceResult.new send(reboot_instance_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def reboot_relational_database(reboot_relational_database_request : RebootRelationalDatabaseRequest) : RebootRelationalDatabaseResult
        request = HTTP::Request.new "POST", "/"
        RebootRelationalDatabaseResult.new send(reboot_relational_database_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def register_container_image(register_container_image_request : RegisterContainerImageRequest) : RegisterContainerImageResult
        request = HTTP::Request.new "POST", "/"
        RegisterContainerImageResult.new send(register_container_image_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def release_static_ip(release_static_ip_request : ReleaseStaticIpRequest) : ReleaseStaticIpResult
        request = HTTP::Request.new "POST", "/"
        ReleaseStaticIpResult.new send(release_static_ip_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def reset_distribution_cache(reset_distribution_cache_request : ResetDistributionCacheRequest) : ResetDistributionCacheResult
        request = HTTP::Request.new "POST", "/"
        ResetDistributionCacheResult.new send(reset_distribution_cache_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def send_contact_method_verification(send_contact_method_verification_request : SendContactMethodVerificationRequest) : SendContactMethodVerificationResult
        request = HTTP::Request.new "POST", "/"
        SendContactMethodVerificationResult.new send(send_contact_method_verification_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def set_ip_address_type(set_ip_address_type_request : SetIpAddressTypeRequest) : SetIpAddressTypeResult
        request = HTTP::Request.new "POST", "/"
        SetIpAddressTypeResult.new send(set_ip_address_type_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def set_resource_access_for_bucket(set_resource_access_for_bucket_request : SetResourceAccessForBucketRequest) : SetResourceAccessForBucketResult
        request = HTTP::Request.new "POST", "/"
        SetResourceAccessForBucketResult.new send(set_resource_access_for_bucket_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def start_instance(start_instance_request : StartInstanceRequest) : StartInstanceResult
        request = HTTP::Request.new "POST", "/"
        StartInstanceResult.new send(start_instance_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def start_relational_database(start_relational_database_request : StartRelationalDatabaseRequest) : StartRelationalDatabaseResult
        request = HTTP::Request.new "POST", "/"
        StartRelationalDatabaseResult.new send(start_relational_database_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def stop_instance(stop_instance_request : StopInstanceRequest) : StopInstanceResult
        request = HTTP::Request.new "POST", "/"
        StopInstanceResult.new send(stop_instance_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def stop_relational_database(stop_relational_database_request : StopRelationalDatabaseRequest) : StopRelationalDatabaseResult
        request = HTTP::Request.new "POST", "/"
        StopRelationalDatabaseResult.new send(stop_relational_database_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def tag_resource(tag_resource_request : TagResourceRequest) : TagResourceResult
        request = HTTP::Request.new "POST", "/"
        TagResourceResult.new send(tag_resource_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def test_alarm(test_alarm_request : TestAlarmRequest) : TestAlarmResult
        request = HTTP::Request.new "POST", "/"
        TestAlarmResult.new send(test_alarm_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def unpeer_vpc(unpeer_vpc_request : UnpeerVpcRequest) : UnpeerVpcResult
        request = HTTP::Request.new "POST", "/"
        UnpeerVpcResult.new send(unpeer_vpc_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def untag_resource(untag_resource_request : UntagResourceRequest) : UntagResourceResult
        request = HTTP::Request.new "POST", "/"
        UntagResourceResult.new send(untag_resource_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def update_bucket(update_bucket_request : UpdateBucketRequest) : UpdateBucketResult
        request = HTTP::Request.new "POST", "/"
        UpdateBucketResult.new send(update_bucket_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def update_bucket_bundle(update_bucket_bundle_request : UpdateBucketBundleRequest) : UpdateBucketBundleResult
        request = HTTP::Request.new "POST", "/"
        UpdateBucketBundleResult.new send(update_bucket_bundle_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def update_container_service(update_container_service_request : UpdateContainerServiceRequest) : UpdateContainerServiceResult
        request = HTTP::Request.new "POST", "/"
        UpdateContainerServiceResult.new send(update_container_service_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def update_distribution(update_distribution_request : UpdateDistributionRequest) : UpdateDistributionResult
        request = HTTP::Request.new "POST", "/"
        UpdateDistributionResult.new send(update_distribution_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def update_distribution_bundle(update_distribution_bundle_request : UpdateDistributionBundleRequest) : UpdateDistributionBundleResult
        request = HTTP::Request.new "POST", "/"
        UpdateDistributionBundleResult.new send(update_distribution_bundle_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def update_domain_entry(update_domain_entry_request : UpdateDomainEntryRequest) : UpdateDomainEntryResult
        request = HTTP::Request.new "POST", "/"
        UpdateDomainEntryResult.new send(update_domain_entry_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def update_instance_metadata_options(update_instance_metadata_options_request : UpdateInstanceMetadataOptionsRequest) : UpdateInstanceMetadataOptionsResult
        request = HTTP::Request.new "POST", "/"
        UpdateInstanceMetadataOptionsResult.new send(update_instance_metadata_options_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def update_load_balancer_attribute(update_load_balancer_attribute_request : UpdateLoadBalancerAttributeRequest) : UpdateLoadBalancerAttributeResult
        request = HTTP::Request.new "POST", "/"
        UpdateLoadBalancerAttributeResult.new send(update_load_balancer_attribute_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def update_relational_database(update_relational_database_request : UpdateRelationalDatabaseRequest) : UpdateRelationalDatabaseResult
        request = HTTP::Request.new "POST", "/"
        UpdateRelationalDatabaseResult.new send(update_relational_database_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end

      def update_relational_database_parameters(update_relational_database_parameters_request : UpdateRelationalDatabaseParametersRequest) : UpdateRelationalDatabaseParametersResult
        request = HTTP::Request.new "POST", "/"
        UpdateRelationalDatabaseParametersResult.new send(update_relational_database_parameters_request.fill_in(request), ENDPOINT_PREFIX, 200)
      end
    end
  end

  struct AccessDeniedException
    include JSON::Serializable

    property code : String?

    property docs : String?

    property message : String?

    property tip : String?
  end

  struct AccessKey
    include JSON::Serializable

    property accessKeyId : String?

    property secretAccessKey : String?

    property status : String?

    property createdAt : Time?

    property lastUsed : AccessKeyLastUsed?
  end

  struct AccessKeyLastUsed
    include JSON::Serializable

    property lastUsedDate : Time?

    property region : String?

    property serviceName : String?
  end

  struct AccessRules
    include JSON::Serializable

    property getObject : String?

    property allowPublicOverrides : Bool?
  end

  struct AccountLevelBpaSync
    include JSON::Serializable

    property status : String?

    property lastSyncedAt : Time?

    property message : String?

    property bpaImpactsLightsail : Bool?
  end

  struct AccountSetupInProgressException
    include JSON::Serializable

    property code : String?

    property docs : String?

    property message : String?

    property tip : String?
  end

  struct AddOn
    include JSON::Serializable

    property name : String?

    property status : String?

    property snapshotTimeOfDay : String?

    property nextSnapshotTimeOfDay : String?
  end

  struct AddOnRequest
    include JSON::Serializable

    property addOnType : String

    property autoSnapshotAddOnRequest : AutoSnapshotAddOnRequest?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@addOnType : String, @autoSnapshotAddOnRequest : AutoSnapshotAddOnRequest? = nil)
    end
  end

  struct Alarm
    include JSON::Serializable

    property name : String?

    property arn : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property supportCode : String?

    property monitoredResourceInfo : MonitoredResourceInfo?

    property comparisonOperator : String?

    property evaluationPeriods : Int16?

    property period : Int16?

    property threshold : Float64?

    property datapointsToAlarm : Int16?

    property treatMissingData : String?

    property statistic : String?

    property metricName : String?

    property state : String?

    property unit : String?

    property contactProtocols : Array(String)?

    property notificationTriggers : Array(String)?

    property notificationEnabled : Bool?
  end

  struct AllocateStaticIpRequest
    include JSON::Serializable

    property staticIpName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@staticIpName : String)
    end
  end

  struct AllocateStaticIpResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      AllocateStaticIpResult.from_json response.body
    end
  end

  struct AttachCertificateToDistributionRequest
    include JSON::Serializable

    property distributionName : String

    property certificateName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@distributionName : String, @certificateName : String)
    end
  end

  struct AttachCertificateToDistributionResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      AttachCertificateToDistributionResult.from_json response.body
    end
  end

  struct AttachDiskRequest
    include JSON::Serializable

    property diskName : String

    property instanceName : String

    property diskPath : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@diskName : String, @instanceName : String, @diskPath : String)
    end
  end

  struct AttachDiskResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      AttachDiskResult.from_json response.body
    end
  end

  struct AttachInstancesToLoadBalancerRequest
    include JSON::Serializable

    property loadBalancerName : String

    property instanceNames : Array(String)

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@loadBalancerName : String, @instanceNames : Array(String))
    end
  end

  struct AttachInstancesToLoadBalancerResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      AttachInstancesToLoadBalancerResult.from_json response.body
    end
  end

  struct AttachLoadBalancerTlsCertificateRequest
    include JSON::Serializable

    property loadBalancerName : String

    property certificateName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@loadBalancerName : String, @certificateName : String)
    end
  end

  struct AttachLoadBalancerTlsCertificateResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      AttachLoadBalancerTlsCertificateResult.from_json response.body
    end
  end

  struct AttachStaticIpRequest
    include JSON::Serializable

    property staticIpName : String

    property instanceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@staticIpName : String, @instanceName : String)
    end
  end

  struct AttachStaticIpResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      AttachStaticIpResult.from_json response.body
    end
  end

  struct AttachedDisk
    include JSON::Serializable

    property path : String?

    property sizeInGb : Int16?
  end

  struct AutoSnapshotAddOnRequest
    include JSON::Serializable

    property snapshotTimeOfDay : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@snapshotTimeOfDay : String? = nil)
    end
  end

  struct AutoSnapshotDetails
    include JSON::Serializable

    property date : String?

    property createdAt : Time?

    property status : String?

    property fromAttachedDisks : Array(AttachedDisk)?
  end

  struct AvailabilityZone
    include JSON::Serializable

    property zoneName : String?

    property state : String?
  end

  struct Blueprint
    include JSON::Serializable

    property blueprintId : String?

    property name : String?

    property group : String?

    property type : String?

    property description : String?

    property isActive : Bool?

    property minPower : Int16?

    property version : String?

    property versionCode : String?

    property productUrl : String?

    property licenseUrl : String?

    property platform : String?
  end

  struct Bucket
    include JSON::Serializable

    property resourceType : String?

    property accessRules : AccessRules?

    property arn : String?

    property bundleId : String?

    property createdAt : Time?

    property url : String?

    property location : ResourceLocation?

    property name : String?

    property supportCode : String?

    property tags : Array(Tag)?

    property objectVersioning : String?

    property ableToUpdateBundle : Bool?

    property readonlyAccessAccounts : Array(String)?

    property resourcesReceivingAccess : Array(ResourceReceivingAccess)?

    property state : BucketState?

    property accessLogConfig : BucketAccessLogConfig?
  end

  struct BucketAccessLogConfig
    include JSON::Serializable

    property enabled : Bool

    property destination : String?

    property prefix : String?
  end

  struct BucketBundle
    include JSON::Serializable

    property bundleId : String?

    property name : String?

    property price : Float32?

    property storagePerMonthInGb : Int16?

    property transferPerMonthInGb : Int16?

    property isActive : Bool?
  end

  struct BucketState
    include JSON::Serializable

    property code : String?

    property message : String?
  end

  struct Bundle
    include JSON::Serializable

    property price : Float32?

    property cpuCount : Int16?

    property diskSizeInGb : Int16?

    property bundleId : String?

    property instanceType : String?

    property isActive : Bool?

    property name : String?

    property power : Int16?

    property ramSizeInGb : Float32?

    property transferPerMonthInGb : Int16?

    property supportedPlatforms : Array(String)?
  end

  struct CacheBehavior
    include JSON::Serializable

    property behavior : String?
  end

  struct CacheBehaviorPerPath
    include JSON::Serializable

    property path : String?

    property behavior : String?
  end

  struct CacheSettings
    include JSON::Serializable

    property defaultTTL : Int32?

    property minimumTTL : Int32?

    property maximumTTL : Int32?

    property allowedHTTPMethods : String?

    property cachedHTTPMethods : String?

    property forwardedCookies : CookieObject?

    property forwardedHeaders : HeaderObject?

    property forwardedQueryStrings : QueryStringObject?
  end

  struct Certificate
    include JSON::Serializable

    property arn : String?

    property name : String?

    property domainName : String?

    property status : String?

    property serialNumber : String?

    property subjectAlternativeNames : Array(String)?

    property domainValidationRecords : Array(DomainValidationRecord)?

    property requestFailureReason : String?

    property inUseResourceCount : Int16?

    property keyAlgorithm : String?

    property createdAt : Time?

    property issuedAt : Time?

    property issuerCA : String?

    property notBefore : Time?

    property notAfter : Time?

    property eligibleToRenew : String?

    property renewalSummary : RenewalSummary?

    property revokedAt : Time?

    property revocationReason : String?

    property tags : Array(Tag)?

    property supportCode : String?
  end

  struct CertificateSummary
    include JSON::Serializable

    property certificateArn : String?

    property certificateName : String?

    property domainName : String?

    property certificateDetail : Certificate?

    property tags : Array(Tag)?
  end

  struct CloseInstancePublicPortsRequest
    include JSON::Serializable

    property portInfo : PortInfo

    property instanceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@portInfo : PortInfo, @instanceName : String)
    end
  end

  struct CloseInstancePublicPortsResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      CloseInstancePublicPortsResult.from_json response.body
    end
  end

  struct CloudFormationStackRecord
    include JSON::Serializable

    property name : String?

    property arn : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property state : String?

    property sourceInfo : Array(CloudFormationStackRecordSourceInfo)?

    property destinationInfo : DestinationInfo?
  end

  struct CloudFormationStackRecordSourceInfo
    include JSON::Serializable

    property resourceType : String?

    property name : String?

    property arn : String?
  end

  struct ContactMethod
    include JSON::Serializable

    property contactEndpoint : String?

    property status : String?

    property protocol : String?

    property name : String?

    property arn : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property supportCode : String?
  end

  struct Container
    include JSON::Serializable

    property image : String?

    property command : Array(String)?

    property environment : Hash(String, String)?

    property ports : Hash(String, String)?
  end

  struct ContainerImage
    include JSON::Serializable

    property image : String?

    property digest : String?

    property createdAt : Time?
  end

  struct ContainerService
    include JSON::Serializable

    property containerServiceName : String?

    property arn : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property tags : Array(Tag)?

    property power : String?

    property powerId : String?

    property state : String?

    property stateDetail : ContainerServiceStateDetail?

    property scale : Int16?

    property currentDeployment : ContainerServiceDeployment?

    property nextDeployment : ContainerServiceDeployment?

    property isDisabled : Bool?

    property principalArn : String?

    property privateDomainName : String?

    property publicDomainNames : Hash(String, Array(String))?

    property url : String?

    property privateRegistryAccess : PrivateRegistryAccess?
  end

  struct ContainerServiceDeployment
    include JSON::Serializable

    property version : Int16?

    property state : String?

    property containers : Hash(String, Container)?

    property publicEndpoint : ContainerServiceEndpoint?

    property createdAt : Time?
  end

  struct ContainerServiceDeploymentRequest
    include JSON::Serializable

    property containers : Hash(String, Container)?

    property publicEndpoint : EndpointRequest?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@containers : Hash(String, Container)? = nil, @publicEndpoint : EndpointRequest? = nil)
    end
  end

  struct ContainerServiceECRImagePullerRole
    include JSON::Serializable

    property isActive : Bool?

    property principalArn : String?
  end

  struct ContainerServiceECRImagePullerRoleRequest
    include JSON::Serializable

    property isActive : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@isActive : Bool? = nil)
    end
  end

  struct ContainerServiceEndpoint
    include JSON::Serializable

    property containerName : String?

    property containerPort : Int16?

    property healthCheck : ContainerServiceHealthCheckConfig?
  end

  struct ContainerServiceHealthCheckConfig
    include JSON::Serializable

    property healthyThreshold : Int16?

    property unhealthyThreshold : Int16?

    property timeoutSeconds : Int16?

    property intervalSeconds : Int16?

    property path : String?

    property successCodes : String?
  end

  struct ContainerServiceLogEvent
    include JSON::Serializable

    property createdAt : Time?

    property message : String?
  end

  struct ContainerServicePower
    include JSON::Serializable

    property powerId : String?

    property price : Float32?

    property cpuCount : Float32?

    property ramSizeInGb : Float32?

    property name : String?

    property isActive : Bool?
  end

  struct ContainerServiceRegistryLogin
    include JSON::Serializable

    property username : String?

    property password : String?

    property expiresAt : Time?

    property registry : String?
  end

  struct ContainerServiceStateDetail
    include JSON::Serializable

    property code : String?

    property message : String?
  end

  struct ContainerServicesListResult
    include JSON::Serializable

    property containerServices : Array(ContainerService)?

    def initialize(response : HTTP::Client::Response)
      ContainerServicesListResult.from_json response.body
    end
  end

  struct CookieObject
    include JSON::Serializable

    property option : String?

    property cookiesAllowList : Array(String)?
  end

  struct CopySnapshotRequest
    include JSON::Serializable

    property sourceSnapshotName : String?

    property sourceResourceName : String?

    property restoreDate : String?

    property useLatestRestorableAutoSnapshot : Bool?

    property targetSnapshotName : String

    property sourceRegion : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@targetSnapshotName : String, @sourceRegion : String, @sourceSnapshotName : String? = nil, @sourceResourceName : String? = nil, @restoreDate : String? = nil, @useLatestRestorableAutoSnapshot : Bool? = nil)
    end
  end

  struct CopySnapshotResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CopySnapshotResult.from_json response.body
    end
  end

  struct CreateBucketAccessKeyRequest
    include JSON::Serializable

    property bucketName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@bucketName : String)
    end
  end

  struct CreateBucketAccessKeyResult
    include JSON::Serializable

    property accessKey : AccessKey?

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateBucketAccessKeyResult.from_json response.body
    end
  end

  struct CreateBucketRequest
    include JSON::Serializable

    property bucketName : String

    property bundleId : String

    property tags : Array(Tag)?

    property enableObjectVersioning : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@bucketName : String, @bundleId : String, @tags : Array(Tag)? = nil, @enableObjectVersioning : Bool? = nil)
    end
  end

  struct CreateBucketResult
    include JSON::Serializable

    property bucket : Bucket?

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateBucketResult.from_json response.body
    end
  end

  struct CreateCertificateRequest
    include JSON::Serializable

    property certificateName : String

    property domainName : String

    property subjectAlternativeNames : Array(String)?

    property tags : Array(Tag)?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@certificateName : String, @domainName : String, @subjectAlternativeNames : Array(String)? = nil, @tags : Array(Tag)? = nil)
    end
  end

  struct CreateCertificateResult
    include JSON::Serializable

    property certificate : CertificateSummary?

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateCertificateResult.from_json response.body
    end
  end

  struct CreateCloudFormationStackRequest
    include JSON::Serializable

    property instances : Array(InstanceEntry)

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instances : Array(InstanceEntry))
    end
  end

  struct CreateCloudFormationStackResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateCloudFormationStackResult.from_json response.body
    end
  end

  struct CreateContactMethodRequest
    include JSON::Serializable

    property protocol : String

    property contactEndpoint : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@protocol : String, @contactEndpoint : String)
    end
  end

  struct CreateContactMethodResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateContactMethodResult.from_json response.body
    end
  end

  struct CreateContainerServiceDeploymentRequest
    include JSON::Serializable

    property serviceName : String

    property containers : Hash(String, Container)?

    property publicEndpoint : EndpointRequest?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@serviceName : String, @containers : Hash(String, Container)? = nil, @publicEndpoint : EndpointRequest? = nil)
    end
  end

  struct CreateContainerServiceDeploymentResult
    include JSON::Serializable

    property containerService : ContainerService?

    def initialize(response : HTTP::Client::Response)
      CreateContainerServiceDeploymentResult.from_json response.body
    end
  end

  struct CreateContainerServiceRegistryLoginRequest
    include JSON::Serializable

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize
    end
  end

  struct CreateContainerServiceRegistryLoginResult
    include JSON::Serializable

    property registryLogin : ContainerServiceRegistryLogin?

    def initialize(response : HTTP::Client::Response)
      CreateContainerServiceRegistryLoginResult.from_json response.body
    end
  end

  struct CreateContainerServiceRequest
    include JSON::Serializable

    property serviceName : String

    property power : String

    property scale : Int16

    property tags : Array(Tag)?

    property publicDomainNames : Hash(String, Array(String))?

    property deployment : ContainerServiceDeploymentRequest?

    property privateRegistryAccess : PrivateRegistryAccessRequest?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@serviceName : String, @power : String, @scale : Int16, @tags : Array(Tag)? = nil, @publicDomainNames : Hash(String, Array(String))? = nil, @deployment : ContainerServiceDeploymentRequest? = nil, @privateRegistryAccess : PrivateRegistryAccessRequest? = nil)
    end
  end

  struct CreateContainerServiceResult
    include JSON::Serializable

    property containerService : ContainerService?

    def initialize(response : HTTP::Client::Response)
      CreateContainerServiceResult.from_json response.body
    end
  end

  struct CreateDiskFromSnapshotRequest
    include JSON::Serializable

    property diskName : String

    property diskSnapshotName : String?

    property availabilityZone : String

    property sizeInGb : Int16

    property tags : Array(Tag)?

    property addOns : Array(AddOnRequest)?

    property sourceDiskName : String?

    property restoreDate : String?

    property useLatestRestorableAutoSnapshot : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@diskName : String, @availabilityZone : String, @sizeInGb : Int16, @diskSnapshotName : String? = nil, @tags : Array(Tag)? = nil, @addOns : Array(AddOnRequest)? = nil, @sourceDiskName : String? = nil, @restoreDate : String? = nil, @useLatestRestorableAutoSnapshot : Bool? = nil)
    end
  end

  struct CreateDiskFromSnapshotResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateDiskFromSnapshotResult.from_json response.body
    end
  end

  struct CreateDiskRequest
    include JSON::Serializable

    property diskName : String

    property availabilityZone : String

    property sizeInGb : Int16

    property tags : Array(Tag)?

    property addOns : Array(AddOnRequest)?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@diskName : String, @availabilityZone : String, @sizeInGb : Int16, @tags : Array(Tag)? = nil, @addOns : Array(AddOnRequest)? = nil)
    end
  end

  struct CreateDiskResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateDiskResult.from_json response.body
    end
  end

  struct CreateDiskSnapshotRequest
    include JSON::Serializable

    property diskName : String?

    property diskSnapshotName : String

    property instanceName : String?

    property tags : Array(Tag)?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@diskSnapshotName : String, @diskName : String? = nil, @instanceName : String? = nil, @tags : Array(Tag)? = nil)
    end
  end

  struct CreateDiskSnapshotResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateDiskSnapshotResult.from_json response.body
    end
  end

  struct CreateDistributionRequest
    include JSON::Serializable

    property distributionName : String

    property origin : InputOrigin

    property defaultCacheBehavior : CacheBehavior

    property cacheBehaviorSettings : CacheSettings?

    property cacheBehaviors : Array(CacheBehaviorPerPath)?

    property bundleId : String

    property ipAddressType : String?

    property tags : Array(Tag)?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@distributionName : String, @origin : InputOrigin, @defaultCacheBehavior : CacheBehavior, @bundleId : String, @cacheBehaviorSettings : CacheSettings? = nil, @cacheBehaviors : Array(CacheBehaviorPerPath)? = nil, @ipAddressType : String? = nil, @tags : Array(Tag)? = nil)
    end
  end

  struct CreateDistributionResult
    include JSON::Serializable

    property distribution : LightsailDistribution?

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      CreateDistributionResult.from_json response.body
    end
  end

  struct CreateDomainEntryRequest
    include JSON::Serializable

    property domainName : String

    property domainEntry : DomainEntry

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@domainName : String, @domainEntry : DomainEntry)
    end
  end

  struct CreateDomainEntryResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      CreateDomainEntryResult.from_json response.body
    end
  end

  struct CreateDomainRequest
    include JSON::Serializable

    property domainName : String

    property tags : Array(Tag)?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@domainName : String, @tags : Array(Tag)? = nil)
    end
  end

  struct CreateDomainResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      CreateDomainResult.from_json response.body
    end
  end

  struct CreateInstanceSnapshotRequest
    include JSON::Serializable

    property instanceSnapshotName : String

    property instanceName : String

    property tags : Array(Tag)?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceSnapshotName : String, @instanceName : String, @tags : Array(Tag)? = nil)
    end
  end

  struct CreateInstanceSnapshotResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateInstanceSnapshotResult.from_json response.body
    end
  end

  struct CreateInstancesFromSnapshotRequest
    include JSON::Serializable

    property instanceNames : Array(String)

    property attachedDiskMapping : Hash(String, Array(DiskMap))?

    property availabilityZone : String

    property instanceSnapshotName : String?

    property bundleId : String

    property userData : String?

    property keyPairName : String?

    property tags : Array(Tag)?

    property addOns : Array(AddOnRequest)?

    property ipAddressType : String?

    property sourceInstanceName : String?

    property restoreDate : String?

    property useLatestRestorableAutoSnapshot : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceNames : Array(String), @availabilityZone : String, @bundleId : String, @attachedDiskMapping : Hash(String, Array(DiskMap))? = nil, @instanceSnapshotName : String? = nil, @userData : String? = nil, @keyPairName : String? = nil, @tags : Array(Tag)? = nil, @addOns : Array(AddOnRequest)? = nil, @ipAddressType : String? = nil, @sourceInstanceName : String? = nil, @restoreDate : String? = nil, @useLatestRestorableAutoSnapshot : Bool? = nil)
    end
  end

  struct CreateInstancesFromSnapshotResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateInstancesFromSnapshotResult.from_json response.body
    end
  end

  struct CreateInstancesRequest
    include JSON::Serializable

    property instanceNames : Array(String)

    property availabilityZone : String

    property customImageName : String?

    property blueprintId : String

    property bundleId : String

    property userData : String?

    property keyPairName : String?

    property tags : Array(Tag)?

    property addOns : Array(AddOnRequest)?

    property ipAddressType : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceNames : Array(String), @availabilityZone : String, @blueprintId : String, @bundleId : String, @customImageName : String? = nil, @userData : String? = nil, @keyPairName : String? = nil, @tags : Array(Tag)? = nil, @addOns : Array(AddOnRequest)? = nil, @ipAddressType : String? = nil)
    end
  end

  struct CreateInstancesResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateInstancesResult.from_json response.body
    end
  end

  struct CreateKeyPairRequest
    include JSON::Serializable

    property keyPairName : String

    property tags : Array(Tag)?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@keyPairName : String, @tags : Array(Tag)? = nil)
    end
  end

  struct CreateKeyPairResult
    include JSON::Serializable

    property keyPair : KeyPair?

    property publicKeyBase64 : String?

    property privateKeyBase64 : String?

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      CreateKeyPairResult.from_json response.body
    end
  end

  struct CreateLoadBalancerRequest
    include JSON::Serializable

    property loadBalancerName : String

    property instancePort : Int16

    property healthCheckPath : String?

    property certificateName : String?

    property certificateDomainName : String?

    property certificateAlternativeNames : Array(String)?

    property tags : Array(Tag)?

    property ipAddressType : String?

    property tlsPolicyName : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@loadBalancerName : String, @instancePort : Int16, @healthCheckPath : String? = nil, @certificateName : String? = nil, @certificateDomainName : String? = nil, @certificateAlternativeNames : Array(String)? = nil, @tags : Array(Tag)? = nil, @ipAddressType : String? = nil, @tlsPolicyName : String? = nil)
    end
  end

  struct CreateLoadBalancerResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateLoadBalancerResult.from_json response.body
    end
  end

  struct CreateLoadBalancerTlsCertificateRequest
    include JSON::Serializable

    property loadBalancerName : String

    property certificateName : String

    property certificateDomainName : String

    property certificateAlternativeNames : Array(String)?

    property tags : Array(Tag)?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@loadBalancerName : String, @certificateName : String, @certificateDomainName : String, @certificateAlternativeNames : Array(String)? = nil, @tags : Array(Tag)? = nil)
    end
  end

  struct CreateLoadBalancerTlsCertificateResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateLoadBalancerTlsCertificateResult.from_json response.body
    end
  end

  struct CreateRelationalDatabaseFromSnapshotRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    property availabilityZone : String?

    property publiclyAccessible : Bool?

    property relationalDatabaseSnapshotName : String?

    property relationalDatabaseBundleId : String?

    property sourceRelationalDatabaseName : String?

    property restoreTime : Time?

    property useLatestRestorableTime : Bool?

    property tags : Array(Tag)?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String, @availabilityZone : String? = nil, @publiclyAccessible : Bool? = nil, @relationalDatabaseSnapshotName : String? = nil, @relationalDatabaseBundleId : String? = nil, @sourceRelationalDatabaseName : String? = nil, @restoreTime : Time? = nil, @useLatestRestorableTime : Bool? = nil, @tags : Array(Tag)? = nil)
    end
  end

  struct CreateRelationalDatabaseFromSnapshotResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateRelationalDatabaseFromSnapshotResult.from_json response.body
    end
  end

  struct CreateRelationalDatabaseRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    property availabilityZone : String?

    property relationalDatabaseBlueprintId : String

    property relationalDatabaseBundleId : String

    property masterDatabaseName : String

    property masterUsername : String

    property masterUserPassword : String?

    property preferredBackupWindow : String?

    property preferredMaintenanceWindow : String?

    property publiclyAccessible : Bool?

    property tags : Array(Tag)?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String, @relationalDatabaseBlueprintId : String, @relationalDatabaseBundleId : String, @masterDatabaseName : String, @masterUsername : String, @availabilityZone : String? = nil, @masterUserPassword : String? = nil, @preferredBackupWindow : String? = nil, @preferredMaintenanceWindow : String? = nil, @publiclyAccessible : Bool? = nil, @tags : Array(Tag)? = nil)
    end
  end

  struct CreateRelationalDatabaseResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateRelationalDatabaseResult.from_json response.body
    end
  end

  struct CreateRelationalDatabaseSnapshotRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    property relationalDatabaseSnapshotName : String

    property tags : Array(Tag)?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String, @relationalDatabaseSnapshotName : String, @tags : Array(Tag)? = nil)
    end
  end

  struct CreateRelationalDatabaseSnapshotResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      CreateRelationalDatabaseSnapshotResult.from_json response.body
    end
  end

  struct DeleteAlarmRequest
    include JSON::Serializable

    property alarmName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@alarmName : String)
    end
  end

  struct DeleteAlarmResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteAlarmResult.from_json response.body
    end
  end

  struct DeleteAutoSnapshotRequest
    include JSON::Serializable

    property resourceName : String

    property date : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@resourceName : String, @date : String)
    end
  end

  struct DeleteAutoSnapshotResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteAutoSnapshotResult.from_json response.body
    end
  end

  struct DeleteBucketAccessKeyRequest
    include JSON::Serializable

    property bucketName : String

    property accessKeyId : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@bucketName : String, @accessKeyId : String)
    end
  end

  struct DeleteBucketAccessKeyResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteBucketAccessKeyResult.from_json response.body
    end
  end

  struct DeleteBucketRequest
    include JSON::Serializable

    property bucketName : String

    property forceDelete : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@bucketName : String, @forceDelete : Bool? = nil)
    end
  end

  struct DeleteBucketResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteBucketResult.from_json response.body
    end
  end

  struct DeleteCertificateRequest
    include JSON::Serializable

    property certificateName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@certificateName : String)
    end
  end

  struct DeleteCertificateResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteCertificateResult.from_json response.body
    end
  end

  struct DeleteContactMethodRequest
    include JSON::Serializable

    property protocol : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@protocol : String)
    end
  end

  struct DeleteContactMethodResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteContactMethodResult.from_json response.body
    end
  end

  struct DeleteContainerImageRequest
    include JSON::Serializable

    property serviceName : String

    property image : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@serviceName : String, @image : String)
    end
  end

  struct DeleteContainerImageResult
    include JSON::Serializable

    def initialize(response : HTTP::Client::Response)
      DeleteContainerImageResult.from_json response.body
    end
  end

  struct DeleteContainerServiceRequest
    include JSON::Serializable

    property serviceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@serviceName : String)
    end
  end

  struct DeleteContainerServiceResult
    include JSON::Serializable

    def initialize(response : HTTP::Client::Response)
      DeleteContainerServiceResult.from_json response.body
    end
  end

  struct DeleteDiskRequest
    include JSON::Serializable

    property diskName : String

    property forceDeleteAddOns : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@diskName : String, @forceDeleteAddOns : Bool? = nil)
    end
  end

  struct DeleteDiskResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteDiskResult.from_json response.body
    end
  end

  struct DeleteDiskSnapshotRequest
    include JSON::Serializable

    property diskSnapshotName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@diskSnapshotName : String)
    end
  end

  struct DeleteDiskSnapshotResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteDiskSnapshotResult.from_json response.body
    end
  end

  struct DeleteDistributionRequest
    include JSON::Serializable

    property distributionName : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@distributionName : String? = nil)
    end
  end

  struct DeleteDistributionResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      DeleteDistributionResult.from_json response.body
    end
  end

  struct DeleteDomainEntryRequest
    include JSON::Serializable

    property domainName : String

    property domainEntry : DomainEntry

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@domainName : String, @domainEntry : DomainEntry)
    end
  end

  struct DeleteDomainEntryResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      DeleteDomainEntryResult.from_json response.body
    end
  end

  struct DeleteDomainRequest
    include JSON::Serializable

    property domainName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@domainName : String)
    end
  end

  struct DeleteDomainResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      DeleteDomainResult.from_json response.body
    end
  end

  struct DeleteInstanceRequest
    include JSON::Serializable

    property instanceName : String

    property forceDeleteAddOns : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceName : String, @forceDeleteAddOns : Bool? = nil)
    end
  end

  struct DeleteInstanceResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteInstanceResult.from_json response.body
    end
  end

  struct DeleteInstanceSnapshotRequest
    include JSON::Serializable

    property instanceSnapshotName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceSnapshotName : String)
    end
  end

  struct DeleteInstanceSnapshotResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteInstanceSnapshotResult.from_json response.body
    end
  end

  struct DeleteKeyPairRequest
    include JSON::Serializable

    property keyPairName : String

    property expectedFingerprint : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@keyPairName : String, @expectedFingerprint : String? = nil)
    end
  end

  struct DeleteKeyPairResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      DeleteKeyPairResult.from_json response.body
    end
  end

  struct DeleteKnownHostKeysRequest
    include JSON::Serializable

    property instanceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceName : String)
    end
  end

  struct DeleteKnownHostKeysResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteKnownHostKeysResult.from_json response.body
    end
  end

  struct DeleteLoadBalancerRequest
    include JSON::Serializable

    property loadBalancerName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@loadBalancerName : String)
    end
  end

  struct DeleteLoadBalancerResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteLoadBalancerResult.from_json response.body
    end
  end

  struct DeleteLoadBalancerTlsCertificateRequest
    include JSON::Serializable

    property loadBalancerName : String

    property certificateName : String

    property force : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@loadBalancerName : String, @certificateName : String, @force : Bool? = nil)
    end
  end

  struct DeleteLoadBalancerTlsCertificateResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteLoadBalancerTlsCertificateResult.from_json response.body
    end
  end

  struct DeleteRelationalDatabaseRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    property skipFinalSnapshot : Bool?

    property finalRelationalDatabaseSnapshotName : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String, @skipFinalSnapshot : Bool? = nil, @finalRelationalDatabaseSnapshotName : String? = nil)
    end
  end

  struct DeleteRelationalDatabaseResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteRelationalDatabaseResult.from_json response.body
    end
  end

  struct DeleteRelationalDatabaseSnapshotRequest
    include JSON::Serializable

    property relationalDatabaseSnapshotName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseSnapshotName : String)
    end
  end

  struct DeleteRelationalDatabaseSnapshotResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DeleteRelationalDatabaseSnapshotResult.from_json response.body
    end
  end

  struct DestinationInfo
    include JSON::Serializable

    property id : String?

    property service : String?
  end

  struct DetachCertificateFromDistributionRequest
    include JSON::Serializable

    property distributionName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@distributionName : String)
    end
  end

  struct DetachCertificateFromDistributionResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      DetachCertificateFromDistributionResult.from_json response.body
    end
  end

  struct DetachDiskRequest
    include JSON::Serializable

    property diskName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@diskName : String)
    end
  end

  struct DetachDiskResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DetachDiskResult.from_json response.body
    end
  end

  struct DetachInstancesFromLoadBalancerRequest
    include JSON::Serializable

    property loadBalancerName : String

    property instanceNames : Array(String)

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@loadBalancerName : String, @instanceNames : Array(String))
    end
  end

  struct DetachInstancesFromLoadBalancerResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DetachInstancesFromLoadBalancerResult.from_json response.body
    end
  end

  struct DetachStaticIpRequest
    include JSON::Serializable

    property staticIpName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@staticIpName : String)
    end
  end

  struct DetachStaticIpResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DetachStaticIpResult.from_json response.body
    end
  end

  struct DisableAddOnRequest
    include JSON::Serializable

    property addOnType : String

    property resourceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@addOnType : String, @resourceName : String)
    end
  end

  struct DisableAddOnResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      DisableAddOnResult.from_json response.body
    end
  end

  struct Disk
    include JSON::Serializable

    property name : String?

    property arn : String?

    property supportCode : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property tags : Array(Tag)?

    property addOns : Array(AddOn)?

    property sizeInGb : Int16?

    property isSystemDisk : Bool?

    property iops : Int16?

    property path : String?

    property state : String?

    property attachedTo : String?

    property isAttached : Bool?

    property attachmentState : String?

    property gbInUse : Int16?
  end

  struct DiskInfo
    include JSON::Serializable

    property name : String?

    property path : String?

    property sizeInGb : Int16?

    property isSystemDisk : Bool?
  end

  struct DiskMap
    include JSON::Serializable

    property originalDiskPath : String?

    property newDiskName : String?
  end

  struct DiskSnapshot
    include JSON::Serializable

    property name : String?

    property arn : String?

    property supportCode : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property tags : Array(Tag)?

    property sizeInGb : Int16?

    property state : String?

    property progress : String?

    property fromDiskName : String?

    property fromDiskArn : String?

    property fromInstanceName : String?

    property fromInstanceArn : String?

    property isFromAutoSnapshot : Bool?
  end

  struct DiskSnapshotInfo
    include JSON::Serializable

    property sizeInGb : Int16?
  end

  struct DistributionBundle
    include JSON::Serializable

    property bundleId : String?

    property name : String?

    property price : Float32?

    property transferPerMonthInGb : Int16?

    property isActive : Bool?
  end

  struct Domain
    include JSON::Serializable

    property name : String?

    property arn : String?

    property supportCode : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property tags : Array(Tag)?

    property domainEntries : Array(DomainEntry)?
  end

  struct DomainEntry
    include JSON::Serializable

    property id : String?

    property name : String?

    property target : String?

    property isAlias : Bool?

    property type : String?

    property options : Hash(String, String)?
  end

  struct DomainValidationRecord
    include JSON::Serializable

    property domainName : String?

    property resourceRecord : ResourceRecord?
  end

  struct DownloadDefaultKeyPairRequest
    include JSON::Serializable

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize
    end
  end

  struct DownloadDefaultKeyPairResult
    include JSON::Serializable

    property publicKeyBase64 : String?

    property privateKeyBase64 : String?

    property createdAt : Time?

    def initialize(response : HTTP::Client::Response)
      DownloadDefaultKeyPairResult.from_json response.body
    end
  end

  struct EnableAddOnRequest
    include JSON::Serializable

    property resourceName : String

    property addOnRequest : AddOnRequest

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@resourceName : String, @addOnRequest : AddOnRequest)
    end
  end

  struct EnableAddOnResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      EnableAddOnResult.from_json response.body
    end
  end

  struct EndpointRequest
    include JSON::Serializable

    property containerName : String

    property containerPort : Int16

    property healthCheck : ContainerServiceHealthCheckConfig?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@containerName : String, @containerPort : Int16, @healthCheck : ContainerServiceHealthCheckConfig? = nil)
    end
  end

  struct ExportSnapshotRecord
    include JSON::Serializable

    property name : String?

    property arn : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property state : String?

    property sourceInfo : ExportSnapshotRecordSourceInfo?

    property destinationInfo : DestinationInfo?
  end

  struct ExportSnapshotRecordSourceInfo
    include JSON::Serializable

    property resourceType : String?

    property createdAt : Time?

    property name : String?

    property arn : String?

    property fromResourceName : String?

    property fromResourceArn : String?

    property instanceSnapshotInfo : InstanceSnapshotInfo?

    property diskSnapshotInfo : DiskSnapshotInfo?
  end

  struct ExportSnapshotRequest
    include JSON::Serializable

    property sourceSnapshotName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@sourceSnapshotName : String)
    end
  end

  struct ExportSnapshotResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      ExportSnapshotResult.from_json response.body
    end
  end

  struct GetActiveNamesRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetActiveNamesResult
    include JSON::Serializable

    property activeNames : Array(String)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetActiveNamesResult.from_json response.body
    end
  end

  struct GetAlarmsRequest
    include JSON::Serializable

    property alarmName : String?

    property pageToken : String?

    property monitoredResourceName : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@alarmName : String? = nil, @pageToken : String? = nil, @monitoredResourceName : String? = nil)
    end
  end

  struct GetAlarmsResult
    include JSON::Serializable

    property alarms : Array(Alarm)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetAlarmsResult.from_json response.body
    end
  end

  struct GetAutoSnapshotsRequest
    include JSON::Serializable

    property resourceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@resourceName : String)
    end
  end

  struct GetAutoSnapshotsResult
    include JSON::Serializable

    property resourceName : String?

    property resourceType : String?

    property autoSnapshots : Array(AutoSnapshotDetails)?

    def initialize(response : HTTP::Client::Response)
      GetAutoSnapshotsResult.from_json response.body
    end
  end

  struct GetBlueprintsRequest
    include JSON::Serializable

    property includeInactive : Bool?

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@includeInactive : Bool? = nil, @pageToken : String? = nil)
    end
  end

  struct GetBlueprintsResult
    include JSON::Serializable

    property blueprints : Array(Blueprint)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetBlueprintsResult.from_json response.body
    end
  end

  struct GetBucketAccessKeysRequest
    include JSON::Serializable

    property bucketName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@bucketName : String)
    end
  end

  struct GetBucketAccessKeysResult
    include JSON::Serializable

    property accessKeys : Array(AccessKey)?

    def initialize(response : HTTP::Client::Response)
      GetBucketAccessKeysResult.from_json response.body
    end
  end

  struct GetBucketBundlesRequest
    include JSON::Serializable

    property includeInactive : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@includeInactive : Bool? = nil)
    end
  end

  struct GetBucketBundlesResult
    include JSON::Serializable

    property bundles : Array(BucketBundle)?

    def initialize(response : HTTP::Client::Response)
      GetBucketBundlesResult.from_json response.body
    end
  end

  struct GetBucketMetricDataRequest
    include JSON::Serializable

    property bucketName : String

    property metricName : String

    property startTime : Time

    property endTime : Time

    property period : Int16

    property statistics : Array(String)

    property unit : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@bucketName : String, @metricName : String, @startTime : Time, @endTime : Time, @period : Int16, @statistics : Array(String), @unit : String)
    end
  end

  struct GetBucketMetricDataResult
    include JSON::Serializable

    property metricName : String?

    property metricData : Array(MetricDatapoint)?

    def initialize(response : HTTP::Client::Response)
      GetBucketMetricDataResult.from_json response.body
    end
  end

  struct GetBucketsRequest
    include JSON::Serializable

    property bucketName : String?

    property pageToken : String?

    property includeConnectedResources : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@bucketName : String? = nil, @pageToken : String? = nil, @includeConnectedResources : Bool? = nil)
    end
  end

  struct GetBucketsResult
    include JSON::Serializable

    property buckets : Array(Bucket)?

    property nextPageToken : String?

    property accountLevelBpaSync : AccountLevelBpaSync?

    def initialize(response : HTTP::Client::Response)
      GetBucketsResult.from_json response.body
    end
  end

  struct GetBundlesRequest
    include JSON::Serializable

    property includeInactive : Bool?

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@includeInactive : Bool? = nil, @pageToken : String? = nil)
    end
  end

  struct GetBundlesResult
    include JSON::Serializable

    property bundles : Array(Bundle)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetBundlesResult.from_json response.body
    end
  end

  struct GetCertificatesRequest
    include JSON::Serializable

    property certificateStatuses : Array(String)?

    property includeCertificateDetails : Bool?

    property certificateName : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@certificateStatuses : Array(String)? = nil, @includeCertificateDetails : Bool? = nil, @certificateName : String? = nil)
    end
  end

  struct GetCertificatesResult
    include JSON::Serializable

    property certificates : Array(CertificateSummary)?

    def initialize(response : HTTP::Client::Response)
      GetCertificatesResult.from_json response.body
    end
  end

  struct GetCloudFormationStackRecordsRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetCloudFormationStackRecordsResult
    include JSON::Serializable

    property cloudFormationStackRecords : Array(CloudFormationStackRecord)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetCloudFormationStackRecordsResult.from_json response.body
    end
  end

  struct GetContactMethodsRequest
    include JSON::Serializable

    property protocols : Array(String)?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@protocols : Array(String)? = nil)
    end
  end

  struct GetContactMethodsResult
    include JSON::Serializable

    property contactMethods : Array(ContactMethod)?

    def initialize(response : HTTP::Client::Response)
      GetContactMethodsResult.from_json response.body
    end
  end

  struct GetContainerAPIMetadataRequest
    include JSON::Serializable

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize
    end
  end

  struct GetContainerAPIMetadataResult
    include JSON::Serializable

    property metadata : Array(Hash(String, String))?

    def initialize(response : HTTP::Client::Response)
      GetContainerAPIMetadataResult.from_json response.body
    end
  end

  struct GetContainerImagesRequest
    include JSON::Serializable

    property serviceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@serviceName : String)
    end
  end

  struct GetContainerImagesResult
    include JSON::Serializable

    property containerImages : Array(ContainerImage)?

    def initialize(response : HTTP::Client::Response)
      GetContainerImagesResult.from_json response.body
    end
  end

  struct GetContainerLogRequest
    include JSON::Serializable

    property serviceName : String

    property containerName : String

    property startTime : Time?

    property endTime : Time?

    property filterPattern : String?

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@serviceName : String, @containerName : String, @startTime : Time? = nil, @endTime : Time? = nil, @filterPattern : String? = nil, @pageToken : String? = nil)
    end
  end

  struct GetContainerLogResult
    include JSON::Serializable

    property logEvents : Array(ContainerServiceLogEvent)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetContainerLogResult.from_json response.body
    end
  end

  struct GetContainerServiceDeploymentsRequest
    include JSON::Serializable

    property serviceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@serviceName : String)
    end
  end

  struct GetContainerServiceDeploymentsResult
    include JSON::Serializable

    property deployments : Array(ContainerServiceDeployment)?

    def initialize(response : HTTP::Client::Response)
      GetContainerServiceDeploymentsResult.from_json response.body
    end
  end

  struct GetContainerServiceMetricDataRequest
    include JSON::Serializable

    property serviceName : String

    property metricName : String

    property startTime : Time

    property endTime : Time

    property period : Int16

    property statistics : Array(String)

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@serviceName : String, @metricName : String, @startTime : Time, @endTime : Time, @period : Int16, @statistics : Array(String))
    end
  end

  struct GetContainerServiceMetricDataResult
    include JSON::Serializable

    property metricName : String?

    property metricData : Array(MetricDatapoint)?

    def initialize(response : HTTP::Client::Response)
      GetContainerServiceMetricDataResult.from_json response.body
    end
  end

  struct GetContainerServicePowersRequest
    include JSON::Serializable

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize
    end
  end

  struct GetContainerServicePowersResult
    include JSON::Serializable

    property powers : Array(ContainerServicePower)?

    def initialize(response : HTTP::Client::Response)
      GetContainerServicePowersResult.from_json response.body
    end
  end

  struct GetContainerServicesRequest
    include JSON::Serializable

    property serviceName : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@serviceName : String? = nil)
    end
  end

  struct GetDiskRequest
    include JSON::Serializable

    property diskName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@diskName : String)
    end
  end

  struct GetDiskResult
    include JSON::Serializable

    property disk : Disk?

    def initialize(response : HTTP::Client::Response)
      GetDiskResult.from_json response.body
    end
  end

  struct GetDiskSnapshotRequest
    include JSON::Serializable

    property diskSnapshotName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@diskSnapshotName : String)
    end
  end

  struct GetDiskSnapshotResult
    include JSON::Serializable

    property diskSnapshot : DiskSnapshot?

    def initialize(response : HTTP::Client::Response)
      GetDiskSnapshotResult.from_json response.body
    end
  end

  struct GetDiskSnapshotsRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetDiskSnapshotsResult
    include JSON::Serializable

    property diskSnapshots : Array(DiskSnapshot)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetDiskSnapshotsResult.from_json response.body
    end
  end

  struct GetDisksRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetDisksResult
    include JSON::Serializable

    property disks : Array(Disk)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetDisksResult.from_json response.body
    end
  end

  struct GetDistributionBundlesRequest
    include JSON::Serializable

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize
    end
  end

  struct GetDistributionBundlesResult
    include JSON::Serializable

    property bundles : Array(DistributionBundle)?

    def initialize(response : HTTP::Client::Response)
      GetDistributionBundlesResult.from_json response.body
    end
  end

  struct GetDistributionLatestCacheResetRequest
    include JSON::Serializable

    property distributionName : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@distributionName : String? = nil)
    end
  end

  struct GetDistributionLatestCacheResetResult
    include JSON::Serializable

    property status : String?

    property createTime : Time?

    def initialize(response : HTTP::Client::Response)
      GetDistributionLatestCacheResetResult.from_json response.body
    end
  end

  struct GetDistributionMetricDataRequest
    include JSON::Serializable

    property distributionName : String

    property metricName : String

    property startTime : Time

    property endTime : Time

    property period : Int16

    property unit : String

    property statistics : Array(String)

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@distributionName : String, @metricName : String, @startTime : Time, @endTime : Time, @period : Int16, @unit : String, @statistics : Array(String))
    end
  end

  struct GetDistributionMetricDataResult
    include JSON::Serializable

    property metricName : String?

    property metricData : Array(MetricDatapoint)?

    def initialize(response : HTTP::Client::Response)
      GetDistributionMetricDataResult.from_json response.body
    end
  end

  struct GetDistributionsRequest
    include JSON::Serializable

    property distributionName : String?

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@distributionName : String? = nil, @pageToken : String? = nil)
    end
  end

  struct GetDistributionsResult
    include JSON::Serializable

    property distributions : Array(LightsailDistribution)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetDistributionsResult.from_json response.body
    end
  end

  struct GetDomainRequest
    include JSON::Serializable

    property domainName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@domainName : String)
    end
  end

  struct GetDomainResult
    include JSON::Serializable

    property domain : Domain?

    def initialize(response : HTTP::Client::Response)
      GetDomainResult.from_json response.body
    end
  end

  struct GetDomainsRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetDomainsResult
    include JSON::Serializable

    property domains : Array(Domain)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetDomainsResult.from_json response.body
    end
  end

  struct GetExportSnapshotRecordsRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetExportSnapshotRecordsResult
    include JSON::Serializable

    property exportSnapshotRecords : Array(ExportSnapshotRecord)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetExportSnapshotRecordsResult.from_json response.body
    end
  end

  struct GetInstanceAccessDetailsRequest
    include JSON::Serializable

    property instanceName : String

    property protocol : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceName : String, @protocol : String? = nil)
    end
  end

  struct GetInstanceAccessDetailsResult
    include JSON::Serializable

    property accessDetails : InstanceAccessDetails?

    def initialize(response : HTTP::Client::Response)
      GetInstanceAccessDetailsResult.from_json response.body
    end
  end

  struct GetInstanceMetricDataRequest
    include JSON::Serializable

    property instanceName : String

    property metricName : String

    property period : Int16

    property startTime : Time

    property endTime : Time

    property unit : String

    property statistics : Array(String)

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceName : String, @metricName : String, @period : Int16, @startTime : Time, @endTime : Time, @unit : String, @statistics : Array(String))
    end
  end

  struct GetInstanceMetricDataResult
    include JSON::Serializable

    property metricName : String?

    property metricData : Array(MetricDatapoint)?

    def initialize(response : HTTP::Client::Response)
      GetInstanceMetricDataResult.from_json response.body
    end
  end

  struct GetInstancePortStatesRequest
    include JSON::Serializable

    property instanceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceName : String)
    end
  end

  struct GetInstancePortStatesResult
    include JSON::Serializable

    property portStates : Array(InstancePortState)?

    def initialize(response : HTTP::Client::Response)
      GetInstancePortStatesResult.from_json response.body
    end
  end

  struct GetInstanceRequest
    include JSON::Serializable

    property instanceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceName : String)
    end
  end

  struct GetInstanceResult
    include JSON::Serializable

    property instance : Instance?

    def initialize(response : HTTP::Client::Response)
      GetInstanceResult.from_json response.body
    end
  end

  struct GetInstanceSnapshotRequest
    include JSON::Serializable

    property instanceSnapshotName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceSnapshotName : String)
    end
  end

  struct GetInstanceSnapshotResult
    include JSON::Serializable

    property instanceSnapshot : InstanceSnapshot?

    def initialize(response : HTTP::Client::Response)
      GetInstanceSnapshotResult.from_json response.body
    end
  end

  struct GetInstanceSnapshotsRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetInstanceSnapshotsResult
    include JSON::Serializable

    property instanceSnapshots : Array(InstanceSnapshot)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetInstanceSnapshotsResult.from_json response.body
    end
  end

  struct GetInstanceStateRequest
    include JSON::Serializable

    property instanceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceName : String)
    end
  end

  struct GetInstanceStateResult
    include JSON::Serializable

    property state : InstanceState?

    def initialize(response : HTTP::Client::Response)
      GetInstanceStateResult.from_json response.body
    end
  end

  struct GetInstancesRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetInstancesResult
    include JSON::Serializable

    property instances : Array(Instance)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetInstancesResult.from_json response.body
    end
  end

  struct GetKeyPairRequest
    include JSON::Serializable

    property keyPairName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@keyPairName : String)
    end
  end

  struct GetKeyPairResult
    include JSON::Serializable

    property keyPair : KeyPair?

    def initialize(response : HTTP::Client::Response)
      GetKeyPairResult.from_json response.body
    end
  end

  struct GetKeyPairsRequest
    include JSON::Serializable

    property pageToken : String?

    property includeDefaultKeyPair : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil, @includeDefaultKeyPair : Bool? = nil)
    end
  end

  struct GetKeyPairsResult
    include JSON::Serializable

    property keyPairs : Array(KeyPair)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetKeyPairsResult.from_json response.body
    end
  end

  struct GetLoadBalancerMetricDataRequest
    include JSON::Serializable

    property loadBalancerName : String

    property metricName : String

    property period : Int16

    property startTime : Time

    property endTime : Time

    property unit : String

    property statistics : Array(String)

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@loadBalancerName : String, @metricName : String, @period : Int16, @startTime : Time, @endTime : Time, @unit : String, @statistics : Array(String))
    end
  end

  struct GetLoadBalancerMetricDataResult
    include JSON::Serializable

    property metricName : String?

    property metricData : Array(MetricDatapoint)?

    def initialize(response : HTTP::Client::Response)
      GetLoadBalancerMetricDataResult.from_json response.body
    end
  end

  struct GetLoadBalancerRequest
    include JSON::Serializable

    property loadBalancerName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@loadBalancerName : String)
    end
  end

  struct GetLoadBalancerResult
    include JSON::Serializable

    property loadBalancer : LoadBalancer?

    def initialize(response : HTTP::Client::Response)
      GetLoadBalancerResult.from_json response.body
    end
  end

  struct GetLoadBalancerTlsCertificatesRequest
    include JSON::Serializable

    property loadBalancerName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@loadBalancerName : String)
    end
  end

  struct GetLoadBalancerTlsCertificatesResult
    include JSON::Serializable

    property tlsCertificates : Array(LoadBalancerTlsCertificate)?

    def initialize(response : HTTP::Client::Response)
      GetLoadBalancerTlsCertificatesResult.from_json response.body
    end
  end

  struct GetLoadBalancerTlsPoliciesRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetLoadBalancerTlsPoliciesResult
    include JSON::Serializable

    property tlsPolicies : Array(LoadBalancerTlsPolicy)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetLoadBalancerTlsPoliciesResult.from_json response.body
    end
  end

  struct GetLoadBalancersRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetLoadBalancersResult
    include JSON::Serializable

    property loadBalancers : Array(LoadBalancer)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetLoadBalancersResult.from_json response.body
    end
  end

  struct GetOperationRequest
    include JSON::Serializable

    property operationId : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@operationId : String)
    end
  end

  struct GetOperationResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      GetOperationResult.from_json response.body
    end
  end

  struct GetOperationsForResourceRequest
    include JSON::Serializable

    property resourceName : String

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@resourceName : String, @pageToken : String? = nil)
    end
  end

  struct GetOperationsForResourceResult
    include JSON::Serializable

    property operations : Array(Operation)?

    property nextPageCount : String?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetOperationsForResourceResult.from_json response.body
    end
  end

  struct GetOperationsRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetOperationsResult
    include JSON::Serializable

    property operations : Array(Operation)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetOperationsResult.from_json response.body
    end
  end

  struct GetRegionsRequest
    include JSON::Serializable

    property includeAvailabilityZones : Bool?

    property includeRelationalDatabaseAvailabilityZones : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@includeAvailabilityZones : Bool? = nil, @includeRelationalDatabaseAvailabilityZones : Bool? = nil)
    end
  end

  struct GetRegionsResult
    include JSON::Serializable

    property regions : Array(Region)?

    def initialize(response : HTTP::Client::Response)
      GetRegionsResult.from_json response.body
    end
  end

  struct GetRelationalDatabaseBlueprintsRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetRelationalDatabaseBlueprintsResult
    include JSON::Serializable

    property blueprints : Array(RelationalDatabaseBlueprint)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetRelationalDatabaseBlueprintsResult.from_json response.body
    end
  end

  struct GetRelationalDatabaseBundlesRequest
    include JSON::Serializable

    property pageToken : String?

    property includeInactive : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil, @includeInactive : Bool? = nil)
    end
  end

  struct GetRelationalDatabaseBundlesResult
    include JSON::Serializable

    property bundles : Array(RelationalDatabaseBundle)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetRelationalDatabaseBundlesResult.from_json response.body
    end
  end

  struct GetRelationalDatabaseEventsRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    property durationInMinutes : Int16?

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String, @durationInMinutes : Int16? = nil, @pageToken : String? = nil)
    end
  end

  struct GetRelationalDatabaseEventsResult
    include JSON::Serializable

    property relationalDatabaseEvents : Array(RelationalDatabaseEvent)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetRelationalDatabaseEventsResult.from_json response.body
    end
  end

  struct GetRelationalDatabaseLogEventsRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    property logStreamName : String

    property startTime : Time?

    property endTime : Time?

    property startFromHead : Bool?

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String, @logStreamName : String, @startTime : Time? = nil, @endTime : Time? = nil, @startFromHead : Bool? = nil, @pageToken : String? = nil)
    end
  end

  struct GetRelationalDatabaseLogEventsResult
    include JSON::Serializable

    property resourceLogEvents : Array(LogEvent)?

    property nextBackwardToken : String?

    property nextForwardToken : String?

    def initialize(response : HTTP::Client::Response)
      GetRelationalDatabaseLogEventsResult.from_json response.body
    end
  end

  struct GetRelationalDatabaseLogStreamsRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String)
    end
  end

  struct GetRelationalDatabaseLogStreamsResult
    include JSON::Serializable

    property logStreams : Array(String)?

    def initialize(response : HTTP::Client::Response)
      GetRelationalDatabaseLogStreamsResult.from_json response.body
    end
  end

  struct GetRelationalDatabaseMasterUserPasswordRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    property passwordVersion : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String, @passwordVersion : String? = nil)
    end
  end

  struct GetRelationalDatabaseMasterUserPasswordResult
    include JSON::Serializable

    property masterUserPassword : String?

    property createdAt : Time?

    def initialize(response : HTTP::Client::Response)
      GetRelationalDatabaseMasterUserPasswordResult.from_json response.body
    end
  end

  struct GetRelationalDatabaseMetricDataRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    property metricName : String

    property period : Int16

    property startTime : Time

    property endTime : Time

    property unit : String

    property statistics : Array(String)

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String, @metricName : String, @period : Int16, @startTime : Time, @endTime : Time, @unit : String, @statistics : Array(String))
    end
  end

  struct GetRelationalDatabaseMetricDataResult
    include JSON::Serializable

    property metricName : String?

    property metricData : Array(MetricDatapoint)?

    def initialize(response : HTTP::Client::Response)
      GetRelationalDatabaseMetricDataResult.from_json response.body
    end
  end

  struct GetRelationalDatabaseParametersRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String, @pageToken : String? = nil)
    end
  end

  struct GetRelationalDatabaseParametersResult
    include JSON::Serializable

    property parameters : Array(RelationalDatabaseParameter)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetRelationalDatabaseParametersResult.from_json response.body
    end
  end

  struct GetRelationalDatabaseRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String)
    end
  end

  struct GetRelationalDatabaseResult
    include JSON::Serializable

    property relationalDatabase : RelationalDatabase?

    def initialize(response : HTTP::Client::Response)
      GetRelationalDatabaseResult.from_json response.body
    end
  end

  struct GetRelationalDatabaseSnapshotRequest
    include JSON::Serializable

    property relationalDatabaseSnapshotName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseSnapshotName : String)
    end
  end

  struct GetRelationalDatabaseSnapshotResult
    include JSON::Serializable

    property relationalDatabaseSnapshot : RelationalDatabaseSnapshot?

    def initialize(response : HTTP::Client::Response)
      GetRelationalDatabaseSnapshotResult.from_json response.body
    end
  end

  struct GetRelationalDatabaseSnapshotsRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetRelationalDatabaseSnapshotsResult
    include JSON::Serializable

    property relationalDatabaseSnapshots : Array(RelationalDatabaseSnapshot)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetRelationalDatabaseSnapshotsResult.from_json response.body
    end
  end

  struct GetRelationalDatabasesRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetRelationalDatabasesResult
    include JSON::Serializable

    property relationalDatabases : Array(RelationalDatabase)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetRelationalDatabasesResult.from_json response.body
    end
  end

  struct GetStaticIpRequest
    include JSON::Serializable

    property staticIpName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@staticIpName : String)
    end
  end

  struct GetStaticIpResult
    include JSON::Serializable

    property staticIp : StaticIp?

    def initialize(response : HTTP::Client::Response)
      GetStaticIpResult.from_json response.body
    end
  end

  struct GetStaticIpsRequest
    include JSON::Serializable

    property pageToken : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@pageToken : String? = nil)
    end
  end

  struct GetStaticIpsResult
    include JSON::Serializable

    property staticIps : Array(StaticIp)?

    property nextPageToken : String?

    def initialize(response : HTTP::Client::Response)
      GetStaticIpsResult.from_json response.body
    end
  end

  struct HeaderObject
    include JSON::Serializable

    property option : String?

    property headersAllowList : Array(String)?
  end

  struct HostKeyAttributes
    include JSON::Serializable

    property algorithm : String?

    property publicKey : String?

    property witnessedAt : Time?

    property fingerprintSHA1 : String?

    property fingerprintSHA256 : String?

    property notValidBefore : Time?

    property notValidAfter : Time?
  end

  struct ImportKeyPairRequest
    include JSON::Serializable

    property keyPairName : String

    property publicKeyBase64 : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@keyPairName : String, @publicKeyBase64 : String)
    end
  end

  struct ImportKeyPairResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      ImportKeyPairResult.from_json response.body
    end
  end

  struct InputOrigin
    include JSON::Serializable

    property name : String?

    property regionName : String?

    property protocolPolicy : String?
  end

  struct Instance
    include JSON::Serializable

    property name : String?

    property arn : String?

    property supportCode : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property tags : Array(Tag)?

    property blueprintId : String?

    property blueprintName : String?

    property bundleId : String?

    property addOns : Array(AddOn)?

    property isStaticIp : Bool?

    property privateIpAddress : String?

    property publicIpAddress : String?

    property ipv6Addresses : Array(String)?

    property ipAddressType : String?

    property hardware : InstanceHardware?

    property networking : InstanceNetworking?

    property state : InstanceState?

    property username : String?

    property sshKeyName : String?

    property metadataOptions : InstanceMetadataOptions?
  end

  struct InstanceAccessDetails
    include JSON::Serializable

    property certKey : String?

    property expiresAt : Time?

    property ipAddress : String?

    property password : String?

    property passwordData : PasswordData?

    property privateKey : String?

    property protocol : String?

    property instanceName : String?

    property username : String?

    property hostKeys : Array(HostKeyAttributes)?
  end

  struct InstanceEntry
    include JSON::Serializable

    property sourceName : String

    property instanceType : String

    property portInfoSource : String

    property userData : String?

    property availabilityZone : String
  end

  struct InstanceHardware
    include JSON::Serializable

    property cpuCount : Int16?

    property disks : Array(Disk)?

    property ramSizeInGb : Float32?
  end

  struct InstanceHealthSummary
    include JSON::Serializable

    property instanceName : String?

    property instanceHealth : String?

    property instanceHealthReason : String?
  end

  struct InstanceMetadataOptions
    include JSON::Serializable

    property state : String?

    property httpTokens : String?

    property httpEndpoint : String?

    property httpPutResponseHopLimit : Int16?

    property httpProtocolIpv6 : String?
  end

  struct InstanceNetworking
    include JSON::Serializable

    property monthlyTransfer : MonthlyTransfer?

    property ports : Array(InstancePortInfo)?
  end

  struct InstancePortInfo
    include JSON::Serializable

    property fromPort : Int16?

    property toPort : Int16?

    property protocol : String?

    property accessFrom : String?

    property accessType : String?

    property commonName : String?

    property accessDirection : String?

    property cidrs : Array(String)?

    property ipv6Cidrs : Array(String)?

    property cidrListAliases : Array(String)?
  end

  struct InstancePortState
    include JSON::Serializable

    property fromPort : Int16?

    property toPort : Int16?

    property protocol : String?

    property state : String?

    property cidrs : Array(String)?

    property ipv6Cidrs : Array(String)?

    property cidrListAliases : Array(String)?
  end

  struct InstanceSnapshot
    include JSON::Serializable

    property name : String?

    property arn : String?

    property supportCode : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property tags : Array(Tag)?

    property state : String?

    property progress : String?

    property fromAttachedDisks : Array(Disk)?

    property fromInstanceName : String?

    property fromInstanceArn : String?

    property fromBlueprintId : String?

    property fromBundleId : String?

    property isFromAutoSnapshot : Bool?

    property sizeInGb : Int16?
  end

  struct InstanceSnapshotInfo
    include JSON::Serializable

    property fromBundleId : String?

    property fromBlueprintId : String?

    property fromDiskInfo : Array(DiskInfo)?
  end

  struct InstanceState
    include JSON::Serializable

    property code : Int16?

    property name : String?
  end

  struct InvalidInputException
    include JSON::Serializable

    property code : String?

    property docs : String?

    property message : String?

    property tip : String?
  end

  struct IsVpcPeeredRequest
    include JSON::Serializable

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize
    end
  end

  struct IsVpcPeeredResult
    include JSON::Serializable

    property isPeered : Bool?

    def initialize(response : HTTP::Client::Response)
      IsVpcPeeredResult.from_json response.body
    end
  end

  struct KeyPair
    include JSON::Serializable

    property name : String?

    property arn : String?

    property supportCode : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property tags : Array(Tag)?

    property fingerprint : String?
  end

  struct LightsailDistribution
    include JSON::Serializable

    property name : String?

    property arn : String?

    property supportCode : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property alternativeDomainNames : Array(String)?

    property status : String?

    property isEnabled : Bool?

    property domainName : String?

    property bundleId : String?

    property certificateName : String?

    property origin : Origin?

    property originPublicDNS : String?

    property defaultCacheBehavior : CacheBehavior?

    property cacheBehaviorSettings : CacheSettings?

    property cacheBehaviors : Array(CacheBehaviorPerPath)?

    property ableToUpdateBundle : Bool?

    property ipAddressType : String?

    property tags : Array(Tag)?
  end

  struct LoadBalancer
    include JSON::Serializable

    property name : String?

    property arn : String?

    property supportCode : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property tags : Array(Tag)?

    property dnsName : String?

    property state : String?

    property protocol : String?

    property publicPorts : Array(Int16)?

    property healthCheckPath : String?

    property instancePort : Int16?

    property instanceHealthSummary : Array(InstanceHealthSummary)?

    property tlsCertificateSummaries : Array(LoadBalancerTlsCertificateSummary)?

    property configurationOptions : Hash(String, String)?

    property ipAddressType : String?

    property httpsRedirectionEnabled : Bool?

    property tlsPolicyName : String?
  end

  struct LoadBalancerTlsCertificate
    include JSON::Serializable

    property name : String?

    property arn : String?

    property supportCode : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property tags : Array(Tag)?

    property loadBalancerName : String?

    property isAttached : Bool?

    property status : String?

    property domainName : String?

    property domainValidationRecords : Array(LoadBalancerTlsCertificateDomainValidationRecord)?

    property failureReason : String?

    property issuedAt : Time?

    property issuer : String?

    property keyAlgorithm : String?

    property notAfter : Time?

    property notBefore : Time?

    property renewalSummary : LoadBalancerTlsCertificateRenewalSummary?

    property revocationReason : String?

    property revokedAt : Time?

    property serial : String?

    property signatureAlgorithm : String?

    property subject : String?

    property subjectAlternativeNames : Array(String)?
  end

  struct LoadBalancerTlsCertificateDomainValidationOption
    include JSON::Serializable

    property domainName : String?

    property validationStatus : String?
  end

  struct LoadBalancerTlsCertificateDomainValidationRecord
    include JSON::Serializable

    property name : String?

    property type : String?

    property value : String?

    property validationStatus : String?

    property domainName : String?
  end

  struct LoadBalancerTlsCertificateRenewalSummary
    include JSON::Serializable

    property renewalStatus : String?

    property domainValidationOptions : Array(LoadBalancerTlsCertificateDomainValidationOption)?
  end

  struct LoadBalancerTlsCertificateSummary
    include JSON::Serializable

    property name : String?

    property isAttached : Bool?
  end

  struct LoadBalancerTlsPolicy
    include JSON::Serializable

    property name : String?

    property isDefault : Bool?

    property description : String?

    property protocols : Array(String)?

    property ciphers : Array(String)?
  end

  struct LogEvent
    include JSON::Serializable

    property createdAt : Time?

    property message : String?
  end

  struct MetricDatapoint
    include JSON::Serializable

    property average : Float64?

    property maximum : Float64?

    property minimum : Float64?

    property sampleCount : Float64?

    property sum : Float64?

    property timestamp : Time?

    property unit : String?
  end

  struct MonitoredResourceInfo
    include JSON::Serializable

    property arn : String?

    property name : String?

    property resourceType : String?
  end

  struct MonthlyTransfer
    include JSON::Serializable

    property gbPerMonthAllocated : Int16?
  end

  struct NotFoundException
    include JSON::Serializable

    property code : String?

    property docs : String?

    property message : String?

    property tip : String?
  end

  struct OpenInstancePublicPortsRequest
    include JSON::Serializable

    property portInfo : PortInfo

    property instanceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@portInfo : PortInfo, @instanceName : String)
    end
  end

  struct OpenInstancePublicPortsResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      OpenInstancePublicPortsResult.from_json response.body
    end
  end

  struct Operation
    include JSON::Serializable

    property id : String?

    property resourceName : String?

    property resourceType : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property isTerminal : Bool?

    property operationDetails : String?

    property operationType : String?

    property status : String?

    property statusChangedAt : Time?

    property errorCode : String?

    property errorDetails : String?
  end

  struct OperationFailureException
    include JSON::Serializable

    property code : String?

    property docs : String?

    property message : String?

    property tip : String?
  end

  struct Origin
    include JSON::Serializable

    property name : String?

    property resourceType : String?

    property regionName : String?

    property protocolPolicy : String?
  end

  struct PasswordData
    include JSON::Serializable

    property ciphertext : String?

    property keyPairName : String?
  end

  struct PeerVpcRequest
    include JSON::Serializable

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize
    end
  end

  struct PeerVpcResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      PeerVpcResult.from_json response.body
    end
  end

  struct PendingMaintenanceAction
    include JSON::Serializable

    property action : String?

    property description : String?

    property currentApplyDate : Time?
  end

  struct PendingModifiedRelationalDatabaseValues
    include JSON::Serializable

    property masterUserPassword : String?

    property engineVersion : String?

    property backupRetentionEnabled : Bool?
  end

  struct PortInfo
    include JSON::Serializable

    property fromPort : Int16?

    property toPort : Int16?

    property protocol : String?

    property cidrs : Array(String)?

    property ipv6Cidrs : Array(String)?

    property cidrListAliases : Array(String)?
  end

  struct PrivateRegistryAccess
    include JSON::Serializable

    property ecrImagePullerRole : ContainerServiceECRImagePullerRole?
  end

  struct PrivateRegistryAccessRequest
    include JSON::Serializable

    property ecrImagePullerRole : ContainerServiceECRImagePullerRoleRequest?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@ecrImagePullerRole : ContainerServiceECRImagePullerRoleRequest? = nil)
    end
  end

  struct PutAlarmRequest
    include JSON::Serializable

    property alarmName : String

    property metricName : String

    property monitoredResourceName : String

    property comparisonOperator : String

    property threshold : Float64

    property evaluationPeriods : Int16

    property datapointsToAlarm : Int16?

    property treatMissingData : String?

    property contactProtocols : Array(String)?

    property notificationTriggers : Array(String)?

    property notificationEnabled : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@alarmName : String, @metricName : String, @monitoredResourceName : String, @comparisonOperator : String, @threshold : Float64, @evaluationPeriods : Int16, @datapointsToAlarm : Int16? = nil, @treatMissingData : String? = nil, @contactProtocols : Array(String)? = nil, @notificationTriggers : Array(String)? = nil, @notificationEnabled : Bool? = nil)
    end
  end

  struct PutAlarmResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      PutAlarmResult.from_json response.body
    end
  end

  struct PutInstancePublicPortsRequest
    include JSON::Serializable

    property portInfos : Array(PortInfo)

    property instanceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@portInfos : Array(PortInfo), @instanceName : String)
    end
  end

  struct PutInstancePublicPortsResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      PutInstancePublicPortsResult.from_json response.body
    end
  end

  struct QueryStringObject
    include JSON::Serializable

    property option : Bool?

    property queryStringsAllowList : Array(String)?
  end

  struct RebootInstanceRequest
    include JSON::Serializable

    property instanceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceName : String)
    end
  end

  struct RebootInstanceResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      RebootInstanceResult.from_json response.body
    end
  end

  struct RebootRelationalDatabaseRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String)
    end
  end

  struct RebootRelationalDatabaseResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      RebootRelationalDatabaseResult.from_json response.body
    end
  end

  struct Region
    include JSON::Serializable

    property continentCode : String?

    property description : String?

    property displayName : String?

    property name : String?

    property availabilityZones : Array(AvailabilityZone)?

    property relationalDatabaseAvailabilityZones : Array(AvailabilityZone)?
  end

  struct RegisterContainerImageRequest
    include JSON::Serializable

    property serviceName : String

    property label : String

    property digest : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@serviceName : String, @label : String, @digest : String)
    end
  end

  struct RegisterContainerImageResult
    include JSON::Serializable

    property containerImage : ContainerImage?

    def initialize(response : HTTP::Client::Response)
      RegisterContainerImageResult.from_json response.body
    end
  end

  struct RelationalDatabase
    include JSON::Serializable

    property name : String?

    property arn : String?

    property supportCode : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property tags : Array(Tag)?

    property relationalDatabaseBlueprintId : String?

    property relationalDatabaseBundleId : String?

    property masterDatabaseName : String?

    property hardware : RelationalDatabaseHardware?

    property state : String?

    property secondaryAvailabilityZone : String?

    property backupRetentionEnabled : Bool?

    property pendingModifiedValues : PendingModifiedRelationalDatabaseValues?

    property engine : String?

    property engineVersion : String?

    property latestRestorableTime : Time?

    property masterUsername : String?

    property parameterApplyStatus : String?

    property preferredBackupWindow : String?

    property preferredMaintenanceWindow : String?

    property publiclyAccessible : Bool?

    property masterEndpoint : RelationalDatabaseEndpoint?

    property pendingMaintenanceActions : Array(PendingMaintenanceAction)?

    property caCertificateIdentifier : String?
  end

  struct RelationalDatabaseBlueprint
    include JSON::Serializable

    property blueprintId : String?

    property engine : String?

    property engineVersion : String?

    property engineDescription : String?

    property engineVersionDescription : String?

    property isEngineDefault : Bool?
  end

  struct RelationalDatabaseBundle
    include JSON::Serializable

    property bundleId : String?

    property name : String?

    property price : Float32?

    property ramSizeInGb : Float32?

    property diskSizeInGb : Int16?

    property transferPerMonthInGb : Int16?

    property cpuCount : Int16?

    property isEncrypted : Bool?

    property isActive : Bool?
  end

  struct RelationalDatabaseEndpoint
    include JSON::Serializable

    property port : Int16?

    property address : String?
  end

  struct RelationalDatabaseEvent
    include JSON::Serializable

    property resource : String?

    property createdAt : Time?

    property message : String?

    property eventCategories : Array(String)?
  end

  struct RelationalDatabaseHardware
    include JSON::Serializable

    property cpuCount : Int16?

    property diskSizeInGb : Int16?

    property ramSizeInGb : Float32?
  end

  struct RelationalDatabaseParameter
    include JSON::Serializable

    property allowedValues : String?

    property applyMethod : String?

    property applyType : String?

    property dataType : String?

    property description : String?

    property isModifiable : Bool?

    property parameterName : String?

    property parameterValue : String?
  end

  struct RelationalDatabaseSnapshot
    include JSON::Serializable

    property name : String?

    property arn : String?

    property supportCode : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property tags : Array(Tag)?

    property engine : String?

    property engineVersion : String?

    property sizeInGb : Int16?

    property state : String?

    property fromRelationalDatabaseName : String?

    property fromRelationalDatabaseArn : String?

    property fromRelationalDatabaseBundleId : String?

    property fromRelationalDatabaseBlueprintId : String?
  end

  struct ReleaseStaticIpRequest
    include JSON::Serializable

    property staticIpName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@staticIpName : String)
    end
  end

  struct ReleaseStaticIpResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      ReleaseStaticIpResult.from_json response.body
    end
  end

  struct RenewalSummary
    include JSON::Serializable

    property domainValidationRecords : Array(DomainValidationRecord)?

    property renewalStatus : String?

    property renewalStatusReason : String?

    property updatedAt : Time?
  end

  struct ResetDistributionCacheRequest
    include JSON::Serializable

    property distributionName : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@distributionName : String? = nil)
    end
  end

  struct ResetDistributionCacheResult
    include JSON::Serializable

    property status : String?

    property createTime : Time?

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      ResetDistributionCacheResult.from_json response.body
    end
  end

  struct ResourceLocation
    include JSON::Serializable

    property availabilityZone : String?

    property regionName : String?
  end

  struct ResourceReceivingAccess
    include JSON::Serializable

    property name : String?

    property resourceType : String?
  end

  struct ResourceRecord
    include JSON::Serializable

    property name : String?

    property type : String?

    property value : String?
  end

  struct SendContactMethodVerificationRequest
    include JSON::Serializable

    property protocol : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@protocol : String)
    end
  end

  struct SendContactMethodVerificationResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      SendContactMethodVerificationResult.from_json response.body
    end
  end

  struct ServiceException
    include JSON::Serializable

    property code : String?

    property docs : String?

    property message : String?

    property tip : String?
  end

  struct SetIpAddressTypeRequest
    include JSON::Serializable

    property resourceType : String

    property resourceName : String

    property ipAddressType : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@resourceType : String, @resourceName : String, @ipAddressType : String)
    end
  end

  struct SetIpAddressTypeResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      SetIpAddressTypeResult.from_json response.body
    end
  end

  struct SetResourceAccessForBucketRequest
    include JSON::Serializable

    property resourceName : String

    property bucketName : String

    property access : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@resourceName : String, @bucketName : String, @access : String)
    end
  end

  struct SetResourceAccessForBucketResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      SetResourceAccessForBucketResult.from_json response.body
    end
  end

  struct StartInstanceRequest
    include JSON::Serializable

    property instanceName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceName : String)
    end
  end

  struct StartInstanceResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      StartInstanceResult.from_json response.body
    end
  end

  struct StartRelationalDatabaseRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String)
    end
  end

  struct StartRelationalDatabaseResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      StartRelationalDatabaseResult.from_json response.body
    end
  end

  struct StaticIp
    include JSON::Serializable

    property name : String?

    property arn : String?

    property supportCode : String?

    property createdAt : Time?

    property location : ResourceLocation?

    property resourceType : String?

    property ipAddress : String?

    property attachedTo : String?

    property isAttached : Bool?
  end

  struct StopInstanceRequest
    include JSON::Serializable

    property instanceName : String

    property force : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceName : String, @force : Bool? = nil)
    end
  end

  struct StopInstanceResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      StopInstanceResult.from_json response.body
    end
  end

  struct StopRelationalDatabaseRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    property relationalDatabaseSnapshotName : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String, @relationalDatabaseSnapshotName : String? = nil)
    end
  end

  struct StopRelationalDatabaseResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      StopRelationalDatabaseResult.from_json response.body
    end
  end

  struct Tag
    include JSON::Serializable

    property key : String?

    property value : String?
  end

  struct TagResourceRequest
    include JSON::Serializable

    property resourceName : String

    property resourceArn : String?

    property tags : Array(Tag)

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@resourceName : String, @tags : Array(Tag), @resourceArn : String? = nil)
    end
  end

  struct TagResourceResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      TagResourceResult.from_json response.body
    end
  end

  struct TestAlarmRequest
    include JSON::Serializable

    property alarmName : String

    property state : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@alarmName : String, @state : String)
    end
  end

  struct TestAlarmResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      TestAlarmResult.from_json response.body
    end
  end

  struct UnauthenticatedException
    include JSON::Serializable

    property code : String?

    property docs : String?

    property message : String?

    property tip : String?
  end

  struct UnpeerVpcRequest
    include JSON::Serializable

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize
    end
  end

  struct UnpeerVpcResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      UnpeerVpcResult.from_json response.body
    end
  end

  struct UntagResourceRequest
    include JSON::Serializable

    property resourceName : String

    property resourceArn : String?

    property tagKeys : Array(String)

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@resourceName : String, @tagKeys : Array(String), @resourceArn : String? = nil)
    end
  end

  struct UntagResourceResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      UntagResourceResult.from_json response.body
    end
  end

  struct UpdateBucketBundleRequest
    include JSON::Serializable

    property bucketName : String

    property bundleId : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@bucketName : String, @bundleId : String)
    end
  end

  struct UpdateBucketBundleResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      UpdateBucketBundleResult.from_json response.body
    end
  end

  struct UpdateBucketRequest
    include JSON::Serializable

    property bucketName : String

    property accessRules : AccessRules?

    property versioning : String?

    property readonlyAccessAccounts : Array(String)?

    property accessLogConfig : BucketAccessLogConfig?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@bucketName : String, @accessRules : AccessRules? = nil, @versioning : String? = nil, @readonlyAccessAccounts : Array(String)? = nil, @accessLogConfig : BucketAccessLogConfig? = nil)
    end
  end

  struct UpdateBucketResult
    include JSON::Serializable

    property bucket : Bucket?

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      UpdateBucketResult.from_json response.body
    end
  end

  struct UpdateContainerServiceRequest
    include JSON::Serializable

    property serviceName : String

    property power : String?

    property scale : Int16?

    property isDisabled : Bool?

    property publicDomainNames : Hash(String, Array(String))?

    property privateRegistryAccess : PrivateRegistryAccessRequest?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@serviceName : String, @power : String? = nil, @scale : Int16? = nil, @isDisabled : Bool? = nil, @publicDomainNames : Hash(String, Array(String))? = nil, @privateRegistryAccess : PrivateRegistryAccessRequest? = nil)
    end
  end

  struct UpdateContainerServiceResult
    include JSON::Serializable

    property containerService : ContainerService?

    def initialize(response : HTTP::Client::Response)
      UpdateContainerServiceResult.from_json response.body
    end
  end

  struct UpdateDistributionBundleRequest
    include JSON::Serializable

    property distributionName : String?

    property bundleId : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@distributionName : String? = nil, @bundleId : String? = nil)
    end
  end

  struct UpdateDistributionBundleResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      UpdateDistributionBundleResult.from_json response.body
    end
  end

  struct UpdateDistributionRequest
    include JSON::Serializable

    property distributionName : String

    property origin : InputOrigin?

    property defaultCacheBehavior : CacheBehavior?

    property cacheBehaviorSettings : CacheSettings?

    property cacheBehaviors : Array(CacheBehaviorPerPath)?

    property isEnabled : Bool?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@distributionName : String, @origin : InputOrigin? = nil, @defaultCacheBehavior : CacheBehavior? = nil, @cacheBehaviorSettings : CacheSettings? = nil, @cacheBehaviors : Array(CacheBehaviorPerPath)? = nil, @isEnabled : Bool? = nil)
    end
  end

  struct UpdateDistributionResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      UpdateDistributionResult.from_json response.body
    end
  end

  struct UpdateDomainEntryRequest
    include JSON::Serializable

    property domainName : String

    property domainEntry : DomainEntry

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@domainName : String, @domainEntry : DomainEntry)
    end
  end

  struct UpdateDomainEntryResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      UpdateDomainEntryResult.from_json response.body
    end
  end

  struct UpdateInstanceMetadataOptionsRequest
    include JSON::Serializable

    property instanceName : String

    property httpTokens : String?

    property httpEndpoint : String?

    property httpPutResponseHopLimit : Int16?

    property httpProtocolIpv6 : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@instanceName : String, @httpTokens : String? = nil, @httpEndpoint : String? = nil, @httpPutResponseHopLimit : Int16? = nil, @httpProtocolIpv6 : String? = nil)
    end
  end

  struct UpdateInstanceMetadataOptionsResult
    include JSON::Serializable

    property operation : Operation?

    def initialize(response : HTTP::Client::Response)
      UpdateInstanceMetadataOptionsResult.from_json response.body
    end
  end

  struct UpdateLoadBalancerAttributeRequest
    include JSON::Serializable

    property loadBalancerName : String

    property attributeName : String

    property attributeValue : String

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@loadBalancerName : String, @attributeName : String, @attributeValue : String)
    end
  end

  struct UpdateLoadBalancerAttributeResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      UpdateLoadBalancerAttributeResult.from_json response.body
    end
  end

  struct UpdateRelationalDatabaseParametersRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    property parameters : Array(RelationalDatabaseParameter)

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String, @parameters : Array(RelationalDatabaseParameter))
    end
  end

  struct UpdateRelationalDatabaseParametersResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      UpdateRelationalDatabaseParametersResult.from_json response.body
    end
  end

  struct UpdateRelationalDatabaseRequest
    include JSON::Serializable

    property relationalDatabaseName : String

    property masterUserPassword : String?

    property rotateMasterUserPassword : Bool?

    property preferredBackupWindow : String?

    property preferredMaintenanceWindow : String?

    property enableBackupRetention : Bool?

    property disableBackupRetention : Bool?

    property publiclyAccessible : Bool?

    property applyImmediately : Bool?

    property caCertificateIdentifier : String?

    def fill_in(request : HTTP::Request) : HTTP::Request
      request.body = self.to_json
      request
    end

    def initialize(@relationalDatabaseName : String, @masterUserPassword : String? = nil, @rotateMasterUserPassword : Bool? = nil, @preferredBackupWindow : String? = nil, @preferredMaintenanceWindow : String? = nil, @enableBackupRetention : Bool? = nil, @disableBackupRetention : Bool? = nil, @publiclyAccessible : Bool? = nil, @applyImmediately : Bool? = nil, @caCertificateIdentifier : String? = nil)
    end
  end

  struct UpdateRelationalDatabaseResult
    include JSON::Serializable

    property operations : Array(Operation)?

    def initialize(response : HTTP::Client::Response)
      UpdateRelationalDatabaseResult.from_json response.body
    end
  end
end
