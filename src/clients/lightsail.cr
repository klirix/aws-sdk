
require "../protocols/json1_1"

module AWSSdk::Lightsail_20161128
  ENDPOINT_PREFIX = "lightsail"


      # <p>Allocates a static IP address.</p>
  def allocate_static_ip(input : AllocateStaticIpRequest) : AllocateStaticIpResult
    path = "/ls/api/2016-11-28/AllocateStaticIp"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    AllocateStaticIpResult.from_request(request)
  end



      # <p>Attaches an SSL/TLS certificate to your Amazon Lightsail content delivery network (CDN)
  # distribution.</p>
  # <p>After the certificate is attached, your distribution accepts HTTPS traffic for all of the
  # domains that are associated with the certificate.</p>
  # <p>Use the <code>CreateCertificate</code> action to create a certificate that you can attach
  # to your distribution.</p>
  # <important>
  # <p>Only certificates created in the <code>us-east-1</code> AWS Region can be attached to
  # Lightsail distributions. Lightsail distributions are global resources that can reference
  # an origin in any AWS Region, and distribute its content globally. However, all
  # distributions are located in the <code>us-east-1</code> Region.</p>
  # </important>
  def attach_certificate_to_distribution(input : AttachCertificateToDistributionRequest) : AttachCertificateToDistributionResult
    path = "/ls/api/2016-11-28/AttachCertificateToDistribution"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    AttachCertificateToDistributionResult.from_request(request)
  end



      # <p>Attaches a block storage disk to a running or stopped Lightsail instance and exposes it
  # to the instance with the specified disk name.</p>
  # <p>The <code>attach disk</code> operation supports tag-based access control via resource tags
  # applied to the resource identified by <code>disk name</code>. For more information, see the
  # <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def attach_disk(input : AttachDiskRequest) : AttachDiskResult
    path = "/ls/api/2016-11-28/AttachDisk"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    AttachDiskResult.from_request(request)
  end



      # <p>Attaches one or more Lightsail instances to a load balancer.</p>
  # <p>After some time, the instances are attached to the load balancer and the health check
  # status is available.</p>
  # <p>The <code>attach instances to load balancer</code> operation supports tag-based access
  # control via resource tags applied to the resource identified by <code>load balancer
  # name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def attach_instances_to_load_balancer(input : AttachInstancesToLoadBalancerRequest) : AttachInstancesToLoadBalancerResult
    path = "/ls/api/2016-11-28/AttachInstancesToLoadBalancer"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    AttachInstancesToLoadBalancerResult.from_request(request)
  end



      # <p>Attaches a Transport Layer Security (TLS) certificate to your load balancer. TLS is just
  # an updated, more secure version of Secure Socket Layer (SSL).</p>
  # <p>Once you create and validate your certificate, you can attach it to your load balancer.
  # You can also use this API to rotate the certificates on your account. Use the
  # <code>AttachLoadBalancerTlsCertificate</code> action with the non-attached certificate, and
  # it will replace the existing one and become the attached certificate.</p>
  # <p>The <code>AttachLoadBalancerTlsCertificate</code> operation supports tag-based access
  # control via resource tags applied to the resource identified by <code>load balancer
  # name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def attach_load_balancer_tls_certificate(input : AttachLoadBalancerTlsCertificateRequest) : AttachLoadBalancerTlsCertificateResult
    path = "/ls/api/2016-11-28/AttachLoadBalancerTlsCertificate"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    AttachLoadBalancerTlsCertificateResult.from_request(request)
  end



      # <p>Attaches a static IP address to a specific Amazon Lightsail instance.</p>
  def attach_static_ip(input : AttachStaticIpRequest) : AttachStaticIpResult
    path = "/ls/api/2016-11-28/AttachStaticIp"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    AttachStaticIpResult.from_request(request)
  end



      # <p>Closes ports for a specific Amazon Lightsail instance.</p>
  # <p>The <code>CloseInstancePublicPorts</code> action supports tag-based access control via
  # resource tags applied to the resource identified by <code>instanceName</code>. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def close_instance_public_ports(input : CloseInstancePublicPortsRequest) : CloseInstancePublicPortsResult
    path = "/ls/api/2016-11-28/CloseInstancePublicPorts"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CloseInstancePublicPortsResult.from_request(request)
  end



      # <p>Copies a manual snapshot of an instance or disk as another manual snapshot, or copies an
  # automatic snapshot of an instance or disk as a manual snapshot. This operation can also be
  # used to copy a manual or automatic snapshot of an instance or a disk from one AWS Region to
  # another in Amazon Lightsail.</p>
  # <p>When copying a <i>manual snapshot</i>, be sure to define the <code>source
  # region</code>, <code>source snapshot name</code>, and <code>target snapshot name</code>
  # parameters.</p>
  # <p>When copying an <i>automatic snapshot</i>, be sure to define the
  # <code>source region</code>, <code>source resource name</code>, <code>target snapshot
  # name</code>, and either the <code>restore date</code> or the <code>use latest restorable
  # auto snapshot</code> parameters.</p>
  def copy_snapshot(input : CopySnapshotRequest) : CopySnapshotResult
    path = "/ls/api/2016-11-28/CopySnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CopySnapshotResult.from_request(request)
  end



      # <p>Creates an SSL/TLS certificate for a Amazon Lightsail content delivery network (CDN)
  # distribution.</p>
  # <p>After the certificate is created, use the <code>AttachCertificateToDistribution</code>
  # action to attach the certificate to your distribution.</p>
  # <important>
  # <p>Only certificates created in the <code>us-east-1</code> AWS Region can be attached to
  # Lightsail distributions. Lightsail distributions are global resources that can reference
  # an origin in any AWS Region, and distribute its content globally. However, all
  # distributions are located in the <code>us-east-1</code> Region.</p>
  # </important>
  def create_certificate(input : CreateCertificateRequest) : CreateCertificateResult
    path = "/ls/api/2016-11-28/CreateCertificate"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateCertificateResult.from_request(request)
  end



      # <p>Creates an AWS CloudFormation stack, which creates a new Amazon EC2 instance from an exported
  # Amazon Lightsail snapshot. This operation results in a CloudFormation stack record that can be
  # used to track the AWS CloudFormation stack created. Use the <code>get cloud formation stack
  # records</code> operation to get a list of the CloudFormation stacks created.</p>
  # <important>
  # <p>Wait until after your new Amazon EC2 instance is created before running the <code>create
  # cloud formation stack</code> operation again with the same export snapshot record.</p>
  # </important>
  def create_cloud_formation_stack(input : CreateCloudFormationStackRequest) : CreateCloudFormationStackResult
    path = "/ls/api/2016-11-28/CreateCloudFormationStack"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateCloudFormationStackResult.from_request(request)
  end



      # <p>Creates an email or SMS text message contact method.</p>
  # <p>A contact method is used to send you notifications about your Amazon Lightsail resources.
  # You can add one email address and one mobile phone number contact method in each AWS Region.
  # However, SMS text messaging is not supported in some AWS Regions, and SMS text messages
  # cannot be sent to some countries/regions. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
  def create_contact_method(input : CreateContactMethodRequest) : CreateContactMethodResult
    path = "/ls/api/2016-11-28/CreateContactMethod"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateContactMethodResult.from_request(request)
  end



      # <p>Creates an Amazon Lightsail container service.</p>
  # 
  # <p>A Lightsail container service is a compute resource to which you can deploy containers.
  # For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-containers">Container services in Amazon Lightsail</a> in the <i>Lightsail Dev
  # Guide</i>.</p>
  def create_container_service(input : CreateContainerServiceRequest) : CreateContainerServiceResult
    path = "/ls/api/2016-11-28/container-services"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 201)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateContainerServiceResult.from_request(request)
  end



      # <p>Creates a deployment for your Amazon Lightsail container service.</p>
  # 
  # <p>A deployment specifies the containers that will be launched on the container service and
  # their settings, such as the ports to open, the environment variables to apply, and the launch
  # command to run. It also specifies the container that will serve as the public endpoint of the
  # deployment and its settings, such as the HTTP or HTTPS port to use, and the health check
  # configuration.</p>
  # 
  # <p>You can deploy containers to your container service using container images from a public
  # registry like Docker Hub, or from your local machine. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-container-images">Creating container images for your Amazon Lightsail container services</a> in the
  # <i>Lightsail Dev Guide</i>.</p>
  def create_container_service_deployment(input : CreateContainerServiceDeploymentRequest) : CreateContainerServiceDeploymentResult
    path = "/ls/api/2016-11-28/container-services/{serviceName}/deployments"
    if label = input.service_name
      path.gsub("{serviceName}", label)
    else
      raise "No value provided for input HTTP label: serviceName"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 201)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateContainerServiceDeploymentResult.from_request(request)
  end



      # <p>Creates a temporary set of log in credentials that you can use to log in to the Docker
  # process on your local machine. After you're logged in, you can use the native Docker commands
  # to push your local container images to the container image registry of your Amazon Lightsail
  # account so that you can use them with your Lightsail container service. The log in
  # credentials expire 12 hours after they are created, at which point you will need to create a
  # new set of log in credentials.</p>
  # 
  # <note>
  # <p>You can only push container images to the container service registry of your Lightsail
  # account. You cannot pull container images perform any other container image management
  # actions on the container service registry of your Lightsail account.</p>
  # </note>
  # 
  # <p>After you push your container images to the container image registry of your Lightsail
  # account, use the <code>RegisterContainerImage</code> action to register the pushed images to a
  # specific Lightsail container service.</p>
  # 
  # <note>
  # <p>This action is not required if you install and use the Lightsail Control
  # (lightsailctl) plugin to push container images to your Lightsail container service. For
  # more information, see <a href="amazon-lightsail-pushing-container-images">Pushing and
  # managing container images on your Amazon Lightsail container services</a> in the
  # <i>Lightsail Dev Guide</i>.</p>
  # </note>
  def create_container_service_registry_login(input : CreateContainerServiceRegistryLoginRequest) : CreateContainerServiceRegistryLoginResult
    path = "/ls/api/2016-11-28/container-registry-login"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateContainerServiceRegistryLoginResult.from_request(request)
  end



      # <p>Creates a block storage disk that can be attached to an Amazon Lightsail instance in the
  # same Availability Zone (e.g., <code>us-east-2a</code>).</p>
  # <p>The <code>create disk</code> operation supports tag-based access control via request tags.
  # For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_disk(input : CreateDiskRequest) : CreateDiskResult
    path = "/ls/api/2016-11-28/CreateDisk"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateDiskResult.from_request(request)
  end



      # <p>Creates a block storage disk from a manual or automatic snapshot of a disk. The resulting
  # disk can be attached to an Amazon Lightsail instance in the same Availability Zone (e.g.,
  # <code>us-east-2a</code>).</p>
  # <p>The <code>create disk from snapshot</code> operation supports tag-based access control via
  # request tags and resource tags applied to the resource identified by <code>disk snapshot
  # name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_disk_from_snapshot(input : CreateDiskFromSnapshotRequest) : CreateDiskFromSnapshotResult
    path = "/ls/api/2016-11-28/CreateDiskFromSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateDiskFromSnapshotResult.from_request(request)
  end



      # <p>Creates a snapshot of a block storage disk. You can use snapshots for backups, to make
  # copies of disks, and to save data before shutting down a Lightsail instance.</p>
  # <p>You can take a snapshot of an attached disk that is in use; however, snapshots only
  # capture data that has been written to your disk at the time the snapshot command is issued.
  # This may exclude any data that has been cached by any applications or the operating system. If
  # you can pause any file systems on the disk long enough to take a snapshot, your snapshot
  # should be complete. Nevertheless, if you cannot pause all file writes to the disk, you should
  # unmount the disk from within the Lightsail instance, issue the create disk snapshot command,
  # and then remount the disk to ensure a consistent and complete snapshot. You may remount and
  # use your disk while the snapshot status is pending.</p>
  # <p>You can also use this operation to create a snapshot of an instance's system volume. You
  # might want to do this, for example, to recover data from the system volume of a botched
  # instance or to create a backup of the system volume like you would for a block storage disk.
  # To create a snapshot of a system volume, just define the <code>instance name</code> parameter
  # when issuing the snapshot command, and a snapshot of the defined instance's system volume will
  # be created. After the snapshot is available, you can create a block storage disk from the
  # snapshot and attach it to a running instance to access the data on the disk.</p>
  # 
  # <p>The <code>create disk snapshot</code> operation supports tag-based access control via
  # request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_disk_snapshot(input : CreateDiskSnapshotRequest) : CreateDiskSnapshotResult
    path = "/ls/api/2016-11-28/CreateDiskSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateDiskSnapshotResult.from_request(request)
  end



      # <p>Creates an Amazon Lightsail content delivery network (CDN) distribution.</p>
  # <p>A distribution is a globally distributed network of caching servers that improve the
  # performance of your website or web application hosted on a Lightsail instance. For more
  # information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-content-delivery-network-distributions">Content delivery networks in Amazon Lightsail</a>.</p>
  def create_distribution(input : CreateDistributionRequest) : CreateDistributionResult
    path = "/ls/api/2016-11-28/CreateDistribution"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateDistributionResult.from_request(request)
  end



      # <p>Creates a domain resource for the specified domain (e.g., example.com).</p>
  # <p>The <code>create domain</code> operation supports tag-based access control via request
  # tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_domain(input : CreateDomainRequest) : CreateDomainResult
    path = "/ls/api/2016-11-28/CreateDomain"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateDomainResult.from_request(request)
  end



      # <p>Creates one of the following domain name system (DNS) records in a domain DNS zone:
  # Address (A), canonical name (CNAME), mail exchanger (MX), name server (NS), start of authority
  # (SOA), service locator (SRV), or text (TXT).</p>
  # 
  # 
  # 
  # <p>The <code>create domain entry</code> operation supports tag-based access control via
  # resource tags applied to the resource identified by <code>domain name</code>. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_domain_entry(input : CreateDomainEntryRequest) : CreateDomainEntryResult
    path = "/ls/api/2016-11-28/CreateDomainEntry"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateDomainEntryResult.from_request(request)
  end



      # <p>Creates one or more Amazon Lightsail instances.</p>
  # <p>The <code>create instances</code> operation supports tag-based access control via request
  # tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_instances(input : CreateInstancesRequest) : CreateInstancesResult
    path = "/ls/api/2016-11-28/CreateInstances"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateInstancesResult.from_request(request)
  end



      # <p>Creates one or more new instances from a manual or automatic snapshot of an
  # instance.</p>
  # <p>The <code>create instances from snapshot</code> operation supports tag-based access
  # control via request tags and resource tags applied to the resource identified by
  # <code>instance snapshot name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_instances_from_snapshot(input : CreateInstancesFromSnapshotRequest) : CreateInstancesFromSnapshotResult
    path = "/ls/api/2016-11-28/CreateInstancesFromSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateInstancesFromSnapshotResult.from_request(request)
  end



      # <p>Creates a snapshot of a specific virtual private server, or <i>instance</i>.
  # You can use a snapshot to create a new instance that is based on that snapshot.</p>
  # <p>The <code>create instance snapshot</code> operation supports tag-based access control via
  # request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_instance_snapshot(input : CreateInstanceSnapshotRequest) : CreateInstanceSnapshotResult
    path = "/ls/api/2016-11-28/CreateInstanceSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateInstanceSnapshotResult.from_request(request)
  end



      # <p>Creates an SSH key pair.</p>
  # <p>The <code>create key pair</code> operation supports tag-based access control via request
  # tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_key_pair(input : CreateKeyPairRequest) : CreateKeyPairResult
    path = "/ls/api/2016-11-28/CreateKeyPair"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateKeyPairResult.from_request(request)
  end



      # <p>Creates a Lightsail load balancer. To learn more about deciding whether to load balance
  # your application, see <a href="https://lightsail.aws.amazon.com/ls/docs/how-to/article/configure-lightsail-instances-for-load-balancing">Configure your Lightsail instances for load balancing</a>. You can create up to 5
  # load balancers per AWS Region in your account.</p>
  # <p>When you create a load balancer, you can specify a unique name and port settings. To
  # change additional load balancer settings, use the <code>UpdateLoadBalancerAttribute</code>
  # operation.</p>
  # <p>The <code>create load balancer</code> operation supports tag-based access control via
  # request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_load_balancer(input : CreateLoadBalancerRequest) : CreateLoadBalancerResult
    path = "/ls/api/2016-11-28/CreateLoadBalancer"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateLoadBalancerResult.from_request(request)
  end



      # <p>Creates a Lightsail load balancer TLS certificate.</p>
  # <p>TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p>
  # <p>The <code>CreateLoadBalancerTlsCertificate</code> operation supports tag-based access
  # control via resource tags applied to the resource identified by <code>load balancer
  # name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_load_balancer_tls_certificate(input : CreateLoadBalancerTlsCertificateRequest) : CreateLoadBalancerTlsCertificateResult
    path = "/ls/api/2016-11-28/CreateLoadBalancerTlsCertificate"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateLoadBalancerTlsCertificateResult.from_request(request)
  end



      # <p>Creates a new database in Amazon Lightsail.</p>
  # <p>The <code>create relational database</code> operation supports tag-based access control
  # via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_relational_database(input : CreateRelationalDatabaseRequest) : CreateRelationalDatabaseResult
    path = "/ls/api/2016-11-28/CreateRelationalDatabase"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateRelationalDatabaseResult.from_request(request)
  end



      # <p>Creates a new database from an existing database snapshot in Amazon Lightsail.</p>
  # <p>You can create a new database from a snapshot in if something goes wrong with your
  # original database, or to change it to a different plan, such as a high availability or
  # standard plan.</p>
  # <p>The <code>create relational database from snapshot</code> operation supports tag-based
  # access control via request tags and resource tags applied to the resource identified by
  # relationalDatabaseSnapshotName. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_relational_database_from_snapshot(input : CreateRelationalDatabaseFromSnapshotRequest) : CreateRelationalDatabaseFromSnapshotResult
    path = "/ls/api/2016-11-28/CreateRelationalDatabaseFromSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateRelationalDatabaseFromSnapshotResult.from_request(request)
  end



      # <p>Creates a snapshot of your database in Amazon Lightsail. You can use snapshots for backups,
  # to make copies of a database, and to save data before deleting a database.</p>
  # <p>The <code>create relational database snapshot</code> operation supports tag-based access
  # control via request tags. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def create_relational_database_snapshot(input : CreateRelationalDatabaseSnapshotRequest) : CreateRelationalDatabaseSnapshotResult
    path = "/ls/api/2016-11-28/CreateRelationalDatabaseSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    CreateRelationalDatabaseSnapshotResult.from_request(request)
  end



      # <p>Deletes an alarm.</p>
  # <p>An alarm is used to monitor a single metric for one of your resources. When a metric
  # condition is met, the alarm can notify you by email, SMS text message, and a banner displayed
  # on the Amazon Lightsail console. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms
  # in Amazon Lightsail</a>.</p>
  def delete_alarm(input : DeleteAlarmRequest) : DeleteAlarmResult
    path = "/ls/api/2016-11-28/DeleteAlarm"
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteAlarmResult.from_request(request)
  end



      # <p>Deletes an automatic snapshot of an instance or disk. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
  def delete_auto_snapshot(input : DeleteAutoSnapshotRequest) : DeleteAutoSnapshotResult
    path = "/ls/api/2016-11-28/DeleteAutoSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteAutoSnapshotResult.from_request(request)
  end



      # <p>Deletes an SSL/TLS certificate for your Amazon Lightsail content delivery network (CDN)
  # distribution.</p>
  # <p>Certificates that are currently attached to a distribution cannot be deleted. Use the
  # <code>DetachCertificateFromDistribution</code> action to detach a certificate from a
  # distribution.</p>
  def delete_certificate(input : DeleteCertificateRequest) : DeleteCertificateResult
    path = "/ls/api/2016-11-28/DeleteCertificate"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteCertificateResult.from_request(request)
  end



      # <p>Deletes a contact method.</p>
  # <p>A contact method is used to send you notifications about your Amazon Lightsail resources.
  # You can add one email address and one mobile phone number contact method in each AWS Region.
  # However, SMS text messaging is not supported in some AWS Regions, and SMS text messages
  # cannot be sent to some countries/regions. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
  def delete_contact_method(input : DeleteContactMethodRequest) : DeleteContactMethodResult
    path = "/ls/api/2016-11-28/DeleteContactMethod"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteContactMethodResult.from_request(request)
  end



      # <p>Deletes a container image that is registered to your Amazon Lightsail container
  # service.</p>
  def delete_container_image(input : DeleteContainerImageRequest) : DeleteContainerImageResult
    path = "/ls/api/2016-11-28/container-services/{serviceName}/images/{image}"
    if label = input.service_name
      path.gsub("{serviceName}", label)
    else
      raise "No value provided for input HTTP label: serviceName"
    end
    if label = input.image
      path.gsub("{image}", label)
    else
      raise "No value provided for input HTTP label: image"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteContainerImageResult.from_request(request)
  end



      # <p>Deletes your Amazon Lightsail container service.</p>
  def delete_container_service(input : DeleteContainerServiceRequest) : DeleteContainerServiceResult
    path = "/ls/api/2016-11-28/container-services/{serviceName}"
    if label = input.service_name
      path.gsub("{serviceName}", label)
    else
      raise "No value provided for input HTTP label: serviceName"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteContainerServiceResult.from_request(request)
  end



      # <p>Deletes the specified block storage disk. The disk must be in the <code>available</code>
  # state (not attached to a Lightsail instance).</p>
  # <note>
  # <p>The disk may remain in the <code>deleting</code> state for several minutes.</p>
  # </note>
  # <p>The <code>delete disk</code> operation supports tag-based access control via resource tags
  # applied to the resource identified by <code>disk name</code>. For more information, see the
  # <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def delete_disk(input : DeleteDiskRequest) : DeleteDiskResult
    path = "/ls/api/2016-11-28/DeleteDisk"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteDiskResult.from_request(request)
  end



      # <p>Deletes the specified disk snapshot.</p>
  # <p>When you make periodic snapshots of a disk, the snapshots are incremental, and only the
  # blocks on the device that have changed since your last snapshot are saved in the new snapshot.
  # When you delete a snapshot, only the data not needed for any other snapshot is removed. So
  # regardless of which prior snapshots have been deleted, all active snapshots will have access
  # to all the information needed to restore the disk.</p>
  # <p>The <code>delete disk snapshot</code> operation supports tag-based access control via
  # resource tags applied to the resource identified by <code>disk snapshot name</code>. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def delete_disk_snapshot(input : DeleteDiskSnapshotRequest) : DeleteDiskSnapshotResult
    path = "/ls/api/2016-11-28/DeleteDiskSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteDiskSnapshotResult.from_request(request)
  end



      # <p>Deletes your Amazon Lightsail content delivery network (CDN) distribution.</p>
  def delete_distribution(input : DeleteDistributionRequest) : DeleteDistributionResult
    path = "/ls/api/2016-11-28/DeleteDistribution"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteDistributionResult.from_request(request)
  end



      # <p>Deletes the specified domain recordset and all of its domain records.</p>
  # <p>The <code>delete domain</code> operation supports tag-based access control via resource
  # tags applied to the resource identified by <code>domain name</code>. For more information, see
  # the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def delete_domain(input : DeleteDomainRequest) : DeleteDomainResult
    path = "/ls/api/2016-11-28/DeleteDomain"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteDomainResult.from_request(request)
  end



      # <p>Deletes a specific domain entry.</p>
  # <p>The <code>delete domain entry</code> operation supports tag-based access control via
  # resource tags applied to the resource identified by <code>domain name</code>. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def delete_domain_entry(input : DeleteDomainEntryRequest) : DeleteDomainEntryResult
    path = "/ls/api/2016-11-28/DeleteDomainEntry"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteDomainEntryResult.from_request(request)
  end



      # <p>Deletes an Amazon Lightsail instance.</p>
  # <p>The <code>delete instance</code> operation supports tag-based access control via resource
  # tags applied to the resource identified by <code>instance name</code>. For more information,
  # see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def delete_instance(input : DeleteInstanceRequest) : DeleteInstanceResult
    path = "/ls/api/2016-11-28/DeleteInstance"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteInstanceResult.from_request(request)
  end



      # <p>Deletes a specific snapshot of a virtual private server (or
  # <i>instance</i>).</p>
  # <p>The <code>delete instance snapshot</code> operation supports tag-based access control via
  # resource tags applied to the resource identified by <code>instance snapshot name</code>. For
  # more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def delete_instance_snapshot(input : DeleteInstanceSnapshotRequest) : DeleteInstanceSnapshotResult
    path = "/ls/api/2016-11-28/DeleteInstanceSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteInstanceSnapshotResult.from_request(request)
  end



      # <p>Deletes a specific SSH key pair.</p>
  # <p>The <code>delete key pair</code> operation supports tag-based access control via resource
  # tags applied to the resource identified by <code>key pair name</code>. For more information,
  # see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def delete_key_pair(input : DeleteKeyPairRequest) : DeleteKeyPairResult
    path = "/ls/api/2016-11-28/DeleteKeyPair"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteKeyPairResult.from_request(request)
  end



      # <p>Deletes the known host key or certificate used by the Amazon Lightsail browser-based SSH or
  # RDP clients to authenticate an instance. This operation enables the Lightsail browser-based
  # SSH or RDP clients to connect to the instance after a host key mismatch.</p>
  # <important>
  # <p>Perform this operation only if you were expecting the host key or certificate mismatch
  # or if you are familiar with the new host key or certificate on the instance. For more
  # information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-troubleshooting-browser-based-ssh-rdp-client-connection">Troubleshooting connection issues when using the Amazon Lightsail browser-based SSH or RDP
  # client</a>.</p>
  # </important>
  def delete_known_host_keys(input : DeleteKnownHostKeysRequest) : DeleteKnownHostKeysResult
    path = "/ls/api/2016-11-28/DeleteKnownHostKeys"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteKnownHostKeysResult.from_request(request)
  end



      # <p>Deletes a Lightsail load balancer and all its associated SSL/TLS certificates. Once the
  # load balancer is deleted, you will need to create a new load balancer, create a new
  # certificate, and verify domain ownership again.</p>
  # <p>The <code>delete load balancer</code> operation supports tag-based access control via
  # resource tags applied to the resource identified by <code>load balancer name</code>. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def delete_load_balancer(input : DeleteLoadBalancerRequest) : DeleteLoadBalancerResult
    path = "/ls/api/2016-11-28/DeleteLoadBalancer"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteLoadBalancerResult.from_request(request)
  end



      # <p>Deletes an SSL/TLS certificate associated with a Lightsail load balancer.</p>
  # <p>The <code>DeleteLoadBalancerTlsCertificate</code> operation supports tag-based access
  # control via resource tags applied to the resource identified by <code>load balancer
  # name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def delete_load_balancer_tls_certificate(input : DeleteLoadBalancerTlsCertificateRequest) : DeleteLoadBalancerTlsCertificateResult
    path = "/ls/api/2016-11-28/DeleteLoadBalancerTlsCertificate"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteLoadBalancerTlsCertificateResult.from_request(request)
  end



      # <p>Deletes a database in Amazon Lightsail.</p>
  # <p>The <code>delete relational database</code> operation supports tag-based access control
  # via resource tags applied to the resource identified by relationalDatabaseName. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def delete_relational_database(input : DeleteRelationalDatabaseRequest) : DeleteRelationalDatabaseResult
    path = "/ls/api/2016-11-28/DeleteRelationalDatabase"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteRelationalDatabaseResult.from_request(request)
  end



      # <p>Deletes a database snapshot in Amazon Lightsail.</p>
  # <p>The <code>delete relational database snapshot</code> operation supports tag-based access
  # control via resource tags applied to the resource identified by relationalDatabaseName. For
  # more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def delete_relational_database_snapshot(input : DeleteRelationalDatabaseSnapshotRequest) : DeleteRelationalDatabaseSnapshotResult
    path = "/ls/api/2016-11-28/DeleteRelationalDatabaseSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DeleteRelationalDatabaseSnapshotResult.from_request(request)
  end



      # <p>Detaches an SSL/TLS certificate from your Amazon Lightsail content delivery network (CDN)
  # distribution.</p>
  # <p>After the certificate is detached, your distribution stops accepting traffic for all of
  # the domains that are associated with the certificate.</p>
  def detach_certificate_from_distribution(input : DetachCertificateFromDistributionRequest) : DetachCertificateFromDistributionResult
    path = "/ls/api/2016-11-28/DetachCertificateFromDistribution"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DetachCertificateFromDistributionResult.from_request(request)
  end



      # <p>Detaches a stopped block storage disk from a Lightsail instance. Make sure to unmount
  # any file systems on the device within your operating system before stopping the instance and
  # detaching the disk.</p>
  # <p>The <code>detach disk</code> operation supports tag-based access control via resource tags
  # applied to the resource identified by <code>disk name</code>. For more information, see the
  # <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def detach_disk(input : DetachDiskRequest) : DetachDiskResult
    path = "/ls/api/2016-11-28/DetachDisk"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DetachDiskResult.from_request(request)
  end



      # <p>Detaches the specified instances from a Lightsail load balancer.</p>
  # <p>This operation waits until the instances are no longer needed before they are detached
  # from the load balancer.</p>
  # <p>The <code>detach instances from load balancer</code> operation supports tag-based access
  # control via resource tags applied to the resource identified by <code>load balancer
  # name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def detach_instances_from_load_balancer(input : DetachInstancesFromLoadBalancerRequest) : DetachInstancesFromLoadBalancerResult
    path = "/ls/api/2016-11-28/DetachInstancesFromLoadBalancer"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DetachInstancesFromLoadBalancerResult.from_request(request)
  end



      # <p>Detaches a static IP from the Amazon Lightsail instance to which it is attached.</p>
  def detach_static_ip(input : DetachStaticIpRequest) : DetachStaticIpResult
    path = "/ls/api/2016-11-28/DetachStaticIp"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DetachStaticIpResult.from_request(request)
  end



      # <p>Disables an add-on for an Amazon Lightsail resource. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
  def disable_add_on(input : DisableAddOnRequest) : DisableAddOnResult
    path = "/ls/api/2016-11-28/DisableAddOn"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DisableAddOnResult.from_request(request)
  end



      # <p>Downloads the default SSH key pair from the user's account.</p>
  def download_default_key_pair(input : DownloadDefaultKeyPairRequest) : DownloadDefaultKeyPairResult
    path = "/ls/api/2016-11-28/DownloadDefaultKeyPair"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    DownloadDefaultKeyPairResult.from_request(request)
  end



      # <p>Enables or modifies an add-on for an Amazon Lightsail resource. For more information, see
  # the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
  def enable_add_on(input : EnableAddOnRequest) : EnableAddOnResult
    path = "/ls/api/2016-11-28/EnableAddOn"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    EnableAddOnResult.from_request(request)
  end



      # <p>Exports an Amazon Lightsail instance or block storage disk snapshot to Amazon Elastic Compute Cloud (Amazon EC2).
  # This operation results in an export snapshot record that can be used with the <code>create
  # cloud formation stack</code> operation to create new Amazon EC2 instances.</p>
  # <p>Exported instance snapshots appear in Amazon EC2 as Amazon Machine Images (AMIs), and the
  # instance system disk appears as an Amazon Elastic Block Store (Amazon EBS) volume. Exported disk snapshots appear in
  # Amazon EC2 as Amazon EBS volumes. Snapshots are exported to the same Amazon Web Services Region in Amazon EC2 as the
  # source Lightsail snapshot.</p>
  # <p></p>
  # <p>The <code>export snapshot</code> operation supports tag-based access control via resource
  # tags applied to the resource identified by <code>source snapshot name</code>. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  # <note>
  # <p>Use the <code>get instance snapshots</code> or <code>get disk snapshots</code>
  # operations to get a list of snapshots that you can export to Amazon EC2.</p>
  # </note>
  def export_snapshot(input : ExportSnapshotRequest) : ExportSnapshotResult
    path = "/ls/api/2016-11-28/ExportSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    ExportSnapshotResult.from_request(request)
  end



      # <p>Returns the names of all active (not deleted) resources.</p>
  def get_active_names(input : GetActiveNamesRequest) : GetActiveNamesResult
    path = "/ls/api/2016-11-28/GetActiveNames"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetActiveNamesResult.from_request(request)
  end



      # <p>Returns information about the configured alarms. Specify an alarm name in your request to
  # return information about a specific alarm, or specify a monitored resource name to return
  # information about all alarms for a specific resource.</p>
  # <p>An alarm is used to monitor a single metric for one of your resources. When a metric
  # condition is met, the alarm can notify you by email, SMS text message, and a banner displayed
  # on the Amazon Lightsail console. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms
  # in Amazon Lightsail</a>.</p>
  def get_alarms(input : GetAlarmsRequest) : GetAlarmsResult
    path = "/ls/api/2016-11-28/GetAlarms"
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetAlarmsResult.from_request(request)
  end



      # <p>Returns the available automatic snapshots for an instance or disk. For more information,
  # see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
  def get_auto_snapshots(input : GetAutoSnapshotsRequest) : GetAutoSnapshotsResult
    path = "/ls/api/2016-11-28/GetAutoSnapshots"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetAutoSnapshotsResult.from_request(request)
  end



      # <p>Returns the list of available instance images, or <i>blueprints</i>. You can
  # use a blueprint to create a new instance already running a specific operating system, as well
  # as a preinstalled app or development stack. The software each instance is running depends on
  # the blueprint image you choose.</p>
  # <note>
  # <p>Use active blueprints when creating new instances. Inactive blueprints are listed to
  # support customers with existing instances and are not necessarily available to create new
  # instances. Blueprints are marked inactive when they become outdated due to operating system
  # updates or new application releases.</p>
  # </note>
  def get_blueprints(input : GetBlueprintsRequest) : GetBlueprintsResult
    path = "/ls/api/2016-11-28/GetBlueprints"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetBlueprintsResult.from_request(request)
  end



      # <p>Returns the list of bundles that are available for purchase. A bundle describes the specs
  # for your virtual private server (or <i>instance</i>).</p>
  def get_bundles(input : GetBundlesRequest) : GetBundlesResult
    path = "/ls/api/2016-11-28/GetBundles"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetBundlesResult.from_request(request)
  end



      # <p>Returns information about one or more Amazon Lightsail SSL/TLS certificates.</p>
  # <note>
  # <p>To get a summary of a certificate, ommit <code>includeCertificateDetails</code> from
  # your request. The response will include only the certificate Amazon Resource Name (ARN),
  # certificate name, domain name, and tags.</p>
  # </note>
  def get_certificates(input : GetCertificatesRequest) : GetCertificatesResult
    path = "/ls/api/2016-11-28/GetCertificates"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetCertificatesResult.from_request(request)
  end



      # <p>Returns the CloudFormation stack record created as a result of the <code>create cloud
  # formation stack</code> operation.</p>
  # <p>An AWS CloudFormation stack is used to create a new Amazon EC2 instance from an exported Lightsail
  # snapshot.</p>
  def get_cloud_formation_stack_records(input : GetCloudFormationStackRecordsRequest) : GetCloudFormationStackRecordsResult
    path = "/ls/api/2016-11-28/GetCloudFormationStackRecords"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetCloudFormationStackRecordsResult.from_request(request)
  end



      # <p>Returns information about the configured contact methods. Specify a protocol in your
  # request to return information about a specific contact method.</p>
  # <p>A contact method is used to send you notifications about your Amazon Lightsail resources.
  # You can add one email address and one mobile phone number contact method in each AWS Region.
  # However, SMS text messaging is not supported in some AWS Regions, and SMS text messages
  # cannot be sent to some countries/regions. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
  def get_contact_methods(input : GetContactMethodsRequest) : GetContactMethodsResult
    path = "/ls/api/2016-11-28/GetContactMethods"
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetContactMethodsResult.from_request(request)
  end



      # <p>Returns information about Amazon Lightsail containers, such as the current version of the
  # Lightsail Control (lightsailctl) plugin.</p>
  def get_container_api_metadata(input : GetContainerAPIMetadataRequest) : GetContainerAPIMetadataResult
    path = "/ls/api/2016-11-28/container-api-metadata"
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetContainerAPIMetadataResult.from_request(request)
  end



      # <p>Returns the container images that are registered to your Amazon Lightsail container
  # service.</p>
  # 
  # <note>
  # <p>If you created a deployment on your Lightsail container service that uses container
  # images from a public registry like Docker Hub, those images are not returned as part of this
  # action. Those images are not registered to your Lightsail container service.</p>
  # </note>
  def get_container_images(input : GetContainerImagesRequest) : GetContainerImagesResult
    path = "/ls/api/2016-11-28/container-services/{serviceName}/images"
    if label = input.service_name
      path.gsub("{serviceName}", label)
    else
      raise "No value provided for input HTTP label: serviceName"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetContainerImagesResult.from_request(request)
  end



      # <p>Returns the log events of a container of your Amazon Lightsail container service.</p>
  # 
  # <p>If your container service has more than one node (i.e., a scale greater than 1), then the
  # log events that are returned for the specified container are merged from all nodes on your
  # container service.</p>
  # 
  # <note>
  # <p>Container logs are retained for a certain amount of time. For more information, see
  # <a href="https://docs.aws.amazon.com/general/latest/gr/lightsail.html">Amazon Lightsail
  # endpoints and quotas</a> in the <i>AWS General Reference</i>.</p>
  # </note>
  def get_container_log(input : GetContainerLogRequest) : GetContainerLogResult
    path = "/ls/api/2016-11-28/container-services/{serviceName}/containers/{containerName}/log"
    if label = input.service_name
      path.gsub("{serviceName}", label)
    else
      raise "No value provided for input HTTP label: serviceName"
    end
    if label = input.container_name
      path.gsub("{containerName}", label)
    else
      raise "No value provided for input HTTP label: containerName"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetContainerLogResult.from_request(request)
  end



      # <p>Returns the deployments for your Amazon Lightsail container service</p>
  # 
  # <p>A deployment specifies the settings, such as the ports and launch command, of containers
  # that are deployed to your container service.</p>
  # 
  # <p>The deployments are ordered by version in ascending order. The newest version is listed at
  # the top of the response.</p>
  # 
  # <note>
  # <p>A set number of deployments are kept before the oldest one is replaced with the newest
  # one. For more information, see <a href="https://docs.aws.amazon.com/general/latest/gr/lightsail.html">Amazon Lightsail
  # endpoints and quotas</a> in the <i>AWS General Reference</i>.</p>
  # </note>
  def get_container_service_deployments(input : GetContainerServiceDeploymentsRequest) : GetContainerServiceDeploymentsResult
    path = "/ls/api/2016-11-28/container-services/{serviceName}/deployments"
    if label = input.service_name
      path.gsub("{serviceName}", label)
    else
      raise "No value provided for input HTTP label: serviceName"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetContainerServiceDeploymentsResult.from_request(request)
  end



      # <p>Returns the data points of a specific metric of your Amazon Lightsail container
  # service.</p>
  # 
  # <p>Metrics report the utilization of your resources. Monitor and collect metric data
  # regularly to maintain the reliability, availability, and performance of your resources.</p>
  def get_container_service_metric_data(input : GetContainerServiceMetricDataRequest) : GetContainerServiceMetricDataResult
    path = "/ls/api/2016-11-28/container-services/{serviceName}/metrics"
    if label = input.service_name
      path.gsub("{serviceName}", label)
    else
      raise "No value provided for input HTTP label: serviceName"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetContainerServiceMetricDataResult.from_request(request)
  end



      # <p>Returns the list of powers that can be specified for your Amazon Lightsail container
  # services.</p>
  # 
  # <p>The power specifies the amount of memory, the number of vCPUs, and the base price of the
  # container service.</p>
  def get_container_service_powers(input : GetContainerServicePowersRequest) : GetContainerServicePowersResult
    path = "/ls/api/2016-11-28/container-service-powers"
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetContainerServicePowersResult.from_request(request)
  end



      # <p>Returns information about one or more of your Amazon Lightsail container services.</p>
  def get_container_services(input : GetContainerServicesRequest) : ContainerServicesListResult
    path = "/ls/api/2016-11-28/container-services"
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    ContainerServicesListResult.from_request(request)
  end



      # <p>Returns information about a specific block storage disk.</p>
  def get_disk(input : GetDiskRequest) : GetDiskResult
    path = "/ls/api/2016-11-28/GetDisk"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetDiskResult.from_request(request)
  end



      # <p>Returns information about all block storage disks in your AWS account and region.</p>
  def get_disks(input : GetDisksRequest) : GetDisksResult
    path = "/ls/api/2016-11-28/GetDisks"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetDisksResult.from_request(request)
  end



      # <p>Returns information about a specific block storage disk snapshot.</p>
  def get_disk_snapshot(input : GetDiskSnapshotRequest) : GetDiskSnapshotResult
    path = "/ls/api/2016-11-28/GetDiskSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetDiskSnapshotResult.from_request(request)
  end



      # <p>Returns information about all block storage disk snapshots in your AWS account and
  # region.</p>
  def get_disk_snapshots(input : GetDiskSnapshotsRequest) : GetDiskSnapshotsResult
    path = "/ls/api/2016-11-28/GetDiskSnapshots"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetDiskSnapshotsResult.from_request(request)
  end



      # <p>Returns the list bundles that can be applied to you Amazon Lightsail content delivery
  # network (CDN) distributions.</p>
  # <p>A distribution bundle specifies the monthly network transfer quota and monthly cost of
  # your dsitribution.</p>
  def get_distribution_bundles(input : GetDistributionBundlesRequest) : GetDistributionBundlesResult
    path = "/ls/api/2016-11-28/GetDistributionBundles"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetDistributionBundlesResult.from_request(request)
  end



      # <p>Returns the timestamp and status of the last cache reset of a specific Amazon Lightsail
  # content delivery network (CDN) distribution.</p>
  def get_distribution_latest_cache_reset(input : GetDistributionLatestCacheResetRequest) : GetDistributionLatestCacheResetResult
    path = "/ls/api/2016-11-28/GetDistributionLatestCacheReset"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetDistributionLatestCacheResetResult.from_request(request)
  end



      # <p>Returns the data points of a specific metric for an Amazon Lightsail content delivery
  # network (CDN) distribution.</p>
  # <p>Metrics report the utilization of your resources, and the error counts generated by them.
  # Monitor and collect metric data regularly to maintain the reliability, availability, and
  # performance of your resources.</p>
  def get_distribution_metric_data(input : GetDistributionMetricDataRequest) : GetDistributionMetricDataResult
    path = "/ls/api/2016-11-28/GetDistributionMetricData"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetDistributionMetricDataResult.from_request(request)
  end



      # <p>Returns information about one or more of your Amazon Lightsail content delivery network
  # (CDN) distributions.</p>
  def get_distributions(input : GetDistributionsRequest) : GetDistributionsResult
    path = "/ls/api/2016-11-28/GetDistributions"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetDistributionsResult.from_request(request)
  end



      # <p>Returns information about a specific domain recordset.</p>
  def get_domain(input : GetDomainRequest) : GetDomainResult
    path = "/ls/api/2016-11-28/GetDomain"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetDomainResult.from_request(request)
  end



      # <p>Returns a list of all domains in the user's account.</p>
  def get_domains(input : GetDomainsRequest) : GetDomainsResult
    path = "/ls/api/2016-11-28/GetDomains"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetDomainsResult.from_request(request)
  end



      # <p>Returns the export snapshot record created as a result of the <code>export snapshot</code>
  # operation.</p>
  # <p>An export snapshot record can be used to create a new Amazon EC2 instance and its related
  # resources with the <code>create cloud formation stack</code> operation.</p>
  def get_export_snapshot_records(input : GetExportSnapshotRecordsRequest) : GetExportSnapshotRecordsResult
    path = "/ls/api/2016-11-28/GetExportSnapshotRecords"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetExportSnapshotRecordsResult.from_request(request)
  end



      # <p>Returns information about a specific Amazon Lightsail instance, which is a virtual private
  # server.</p>
  def get_instance(input : GetInstanceRequest) : GetInstanceResult
    path = "/ls/api/2016-11-28/GetInstance"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetInstanceResult.from_request(request)
  end



      # <p>Returns temporary SSH keys you can use to connect to a specific virtual private server, or
  # <i>instance</i>.</p>
  # <p>The <code>get instance access details</code> operation supports tag-based access control
  # via resource tags applied to the resource identified by <code>instance name</code>. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def get_instance_access_details(input : GetInstanceAccessDetailsRequest) : GetInstanceAccessDetailsResult
    path = "/ls/api/2016-11-28/GetInstanceAccessDetails"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetInstanceAccessDetailsResult.from_request(request)
  end



      # <p>Returns the data points for the specified Amazon Lightsail instance metric, given an
  # instance name.</p>
  # <p>Metrics report the utilization of your resources, and the error counts generated by them.
  # Monitor and collect metric data regularly to maintain the reliability, availability, and
  # performance of your resources.</p>
  def get_instance_metric_data(input : GetInstanceMetricDataRequest) : GetInstanceMetricDataResult
    path = "/ls/api/2016-11-28/GetInstanceMetricData"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetInstanceMetricDataResult.from_request(request)
  end



      # <p>Returns the firewall port states for a specific Amazon Lightsail instance, the IP addresses
  # allowed to connect to the instance through the ports, and the protocol.</p>
  def get_instance_port_states(input : GetInstancePortStatesRequest) : GetInstancePortStatesResult
    path = "/ls/api/2016-11-28/GetInstancePortStates"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetInstancePortStatesResult.from_request(request)
  end



      # <p>Returns information about all Amazon Lightsail virtual private servers, or
  # <i>instances</i>.</p>
  def get_instances(input : GetInstancesRequest) : GetInstancesResult
    path = "/ls/api/2016-11-28/GetInstances"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetInstancesResult.from_request(request)
  end



      # <p>Returns information about a specific instance snapshot.</p>
  def get_instance_snapshot(input : GetInstanceSnapshotRequest) : GetInstanceSnapshotResult
    path = "/ls/api/2016-11-28/GetInstanceSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetInstanceSnapshotResult.from_request(request)
  end



      # <p>Returns all instance snapshots for the user's account.</p>
  def get_instance_snapshots(input : GetInstanceSnapshotsRequest) : GetInstanceSnapshotsResult
    path = "/ls/api/2016-11-28/GetInstanceSnapshots"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetInstanceSnapshotsResult.from_request(request)
  end



      # <p>Returns the state of a specific instance. Works on one instance at a time.</p>
  def get_instance_state(input : GetInstanceStateRequest) : GetInstanceStateResult
    path = "/ls/api/2016-11-28/GetInstanceState"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetInstanceStateResult.from_request(request)
  end



      # <p>Returns information about a specific key pair.</p>
  def get_key_pair(input : GetKeyPairRequest) : GetKeyPairResult
    path = "/ls/api/2016-11-28/GetKeyPair"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetKeyPairResult.from_request(request)
  end



      # <p>Returns information about all key pairs in the user's account.</p>
  def get_key_pairs(input : GetKeyPairsRequest) : GetKeyPairsResult
    path = "/ls/api/2016-11-28/GetKeyPairs"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetKeyPairsResult.from_request(request)
  end



      # <p>Returns information about the specified Lightsail load balancer.</p>
  def get_load_balancer(input : GetLoadBalancerRequest) : GetLoadBalancerResult
    path = "/ls/api/2016-11-28/GetLoadBalancer"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetLoadBalancerResult.from_request(request)
  end



      # <p>Returns information about health metrics for your Lightsail load balancer.</p>
  # <p>Metrics report the utilization of your resources, and the error counts generated by them.
  # Monitor and collect metric data regularly to maintain the reliability, availability, and
  # performance of your resources.</p>
  def get_load_balancer_metric_data(input : GetLoadBalancerMetricDataRequest) : GetLoadBalancerMetricDataResult
    path = "/ls/api/2016-11-28/GetLoadBalancerMetricData"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetLoadBalancerMetricDataResult.from_request(request)
  end



      # <p>Returns information about all load balancers in an account.</p>
  def get_load_balancers(input : GetLoadBalancersRequest) : GetLoadBalancersResult
    path = "/ls/api/2016-11-28/GetLoadBalancers"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetLoadBalancersResult.from_request(request)
  end



      # <p>Returns information about the TLS certificates that are associated with the specified
  # Lightsail load balancer.</p>
  # <p>TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p>
  # <p>You can have a maximum of 2 certificates associated with a Lightsail load balancer. One
  # is active and the other is inactive.</p>
  def get_load_balancer_tls_certificates(input : GetLoadBalancerTlsCertificatesRequest) : GetLoadBalancerTlsCertificatesResult
    path = "/ls/api/2016-11-28/GetLoadBalancerTlsCertificates"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetLoadBalancerTlsCertificatesResult.from_request(request)
  end



      # <p>Returns information about a specific operation. Operations include events such as when you
  # create an instance, allocate a static IP, attach a static IP, and so on.</p>
  def get_operation(input : GetOperationRequest) : GetOperationResult
    path = "/ls/api/2016-11-28/GetOperation"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetOperationResult.from_request(request)
  end



      # <p>Returns information about all operations.</p>
  # <p>Results are returned from oldest to newest, up to a maximum of 200. Results can be paged
  # by making each subsequent call to <code>GetOperations</code> use the maximum (last)
  # <code>statusChangedAt</code> value from the previous request.</p>
  def get_operations(input : GetOperationsRequest) : GetOperationsResult
    path = "/ls/api/2016-11-28/GetOperations"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetOperationsResult.from_request(request)
  end



      # <p>Gets operations for a specific resource (e.g., an instance or a static IP).</p>
  def get_operations_for_resource(input : GetOperationsForResourceRequest) : GetOperationsForResourceResult
    path = "/ls/api/2016-11-28/GetOperationsForResource"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetOperationsForResourceResult.from_request(request)
  end



      # <p>Returns a list of all valid regions for Amazon Lightsail. Use the <code>include
  # availability zones</code> parameter to also return the Availability Zones in a
  # region.</p>
  def get_regions(input : GetRegionsRequest) : GetRegionsResult
    path = "/ls/api/2016-11-28/GetRegions"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRegionsResult.from_request(request)
  end



      # <p>Returns information about a specific database in Amazon Lightsail.</p>
  def get_relational_database(input : GetRelationalDatabaseRequest) : GetRelationalDatabaseResult
    path = "/ls/api/2016-11-28/GetRelationalDatabase"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRelationalDatabaseResult.from_request(request)
  end



      # <p>Returns a list of available database blueprints in Amazon Lightsail. A blueprint describes
  # the major engine version of a database.</p>
  # <p>You can use a blueprint ID to create a new database that runs a specific database
  # engine.</p>
  def get_relational_database_blueprints(input : GetRelationalDatabaseBlueprintsRequest) : GetRelationalDatabaseBlueprintsResult
    path = "/ls/api/2016-11-28/GetRelationalDatabaseBlueprints"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRelationalDatabaseBlueprintsResult.from_request(request)
  end



      # <p>Returns the list of bundles that are available in Amazon Lightsail. A bundle describes the
  # performance specifications for a database.</p>
  # <p>You can use a bundle ID to create a new database with explicit performance
  # specifications.</p>
  def get_relational_database_bundles(input : GetRelationalDatabaseBundlesRequest) : GetRelationalDatabaseBundlesResult
    path = "/ls/api/2016-11-28/GetRelationalDatabaseBundles"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRelationalDatabaseBundlesResult.from_request(request)
  end



      # <p>Returns a list of events for a specific database in Amazon Lightsail.</p>
  def get_relational_database_events(input : GetRelationalDatabaseEventsRequest) : GetRelationalDatabaseEventsResult
    path = "/ls/api/2016-11-28/GetRelationalDatabaseEvents"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRelationalDatabaseEventsResult.from_request(request)
  end



      # <p>Returns a list of log events for a database in Amazon Lightsail.</p>
  def get_relational_database_log_events(input : GetRelationalDatabaseLogEventsRequest) : GetRelationalDatabaseLogEventsResult
    path = "/ls/api/2016-11-28/GetRelationalDatabaseLogEvents"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRelationalDatabaseLogEventsResult.from_request(request)
  end



      # <p>Returns a list of available log streams for a specific database in Amazon Lightsail.</p>
  def get_relational_database_log_streams(input : GetRelationalDatabaseLogStreamsRequest) : GetRelationalDatabaseLogStreamsResult
    path = "/ls/api/2016-11-28/GetRelationalDatabaseLogStreams"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRelationalDatabaseLogStreamsResult.from_request(request)
  end



      # <p>Returns the current, previous, or pending versions of the master user password for a
  # Lightsail database.</p>
  # <p>The <code>GetRelationalDatabaseMasterUserPassword</code> operation supports tag-based
  # access control via resource tags applied to the resource identified by
  # relationalDatabaseName.</p>
  def get_relational_database_master_user_password(input : GetRelationalDatabaseMasterUserPasswordRequest) : GetRelationalDatabaseMasterUserPasswordResult
    path = "/ls/api/2016-11-28/GetRelationalDatabaseMasterUserPassword"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRelationalDatabaseMasterUserPasswordResult.from_request(request)
  end



      # <p>Returns the data points of the specified metric for a database in Amazon Lightsail.</p>
  # <p>Metrics report the utilization of your resources, and the error counts generated by them.
  # Monitor and collect metric data regularly to maintain the reliability, availability, and
  # performance of your resources.</p>
  def get_relational_database_metric_data(input : GetRelationalDatabaseMetricDataRequest) : GetRelationalDatabaseMetricDataResult
    path = "/ls/api/2016-11-28/GetRelationalDatabaseMetricData"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRelationalDatabaseMetricDataResult.from_request(request)
  end



      # <p>Returns all of the runtime parameters offered by the underlying database software, or
  # engine, for a specific database in Amazon Lightsail.</p>
  # <p>In addition to the parameter names and values, this operation returns other information
  # about each parameter. This information includes whether changes require a reboot, whether the
  # parameter is modifiable, the allowed values, and the data types.</p>
  def get_relational_database_parameters(input : GetRelationalDatabaseParametersRequest) : GetRelationalDatabaseParametersResult
    path = "/ls/api/2016-11-28/GetRelationalDatabaseParameters"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRelationalDatabaseParametersResult.from_request(request)
  end



      # <p>Returns information about all of your databases in Amazon Lightsail.</p>
  def get_relational_databases(input : GetRelationalDatabasesRequest) : GetRelationalDatabasesResult
    path = "/ls/api/2016-11-28/GetRelationalDatabases"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRelationalDatabasesResult.from_request(request)
  end



      # <p>Returns information about a specific database snapshot in Amazon Lightsail.</p>
  def get_relational_database_snapshot(input : GetRelationalDatabaseSnapshotRequest) : GetRelationalDatabaseSnapshotResult
    path = "/ls/api/2016-11-28/GetRelationalDatabaseSnapshot"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRelationalDatabaseSnapshotResult.from_request(request)
  end



      # <p>Returns information about all of your database snapshots in Amazon Lightsail.</p>
  def get_relational_database_snapshots(input : GetRelationalDatabaseSnapshotsRequest) : GetRelationalDatabaseSnapshotsResult
    path = "/ls/api/2016-11-28/GetRelationalDatabaseSnapshots"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetRelationalDatabaseSnapshotsResult.from_request(request)
  end



      # <p>Returns information about a specific static IP.</p>
  def get_static_ip(input : GetStaticIpRequest) : GetStaticIpResult
    path = "/ls/api/2016-11-28/GetStaticIp"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetStaticIpResult.from_request(request)
  end



      # <p>Returns information about all static IPs in the user's account.</p>
  def get_static_ips(input : GetStaticIpsRequest) : GetStaticIpsResult
    path = "/ls/api/2016-11-28/GetStaticIps"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    GetStaticIpsResult.from_request(request)
  end



      # <p>Imports a public SSH key from a specific key pair.</p>
  def import_key_pair(input : ImportKeyPairRequest) : ImportKeyPairResult
    path = "/ls/api/2016-11-28/ImportKeyPair"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    ImportKeyPairResult.from_request(request)
  end



      # <p>Returns a Boolean value indicating whether your Lightsail VPC is peered.</p>
  def is_vpc_peered(input : IsVpcPeeredRequest) : IsVpcPeeredResult
    path = "/ls/api/2016-11-28/IsVpcPeered"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    IsVpcPeeredResult.from_request(request)
  end



      # <p>Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses
  # allowed to connect to the instance through the ports, and the protocol.</p>
  # <p>The <code>OpenInstancePublicPorts</code> action supports tag-based access control via
  # resource tags applied to the resource identified by <code>instanceName</code>. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def open_instance_public_ports(input : OpenInstancePublicPortsRequest) : OpenInstancePublicPortsResult
    path = "/ls/api/2016-11-28/OpenInstancePublicPorts"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    OpenInstancePublicPortsResult.from_request(request)
  end



      # <p>Tries to peer the Lightsail VPC with the user's default VPC.</p>
  def peer_vpc(input : PeerVpcRequest) : PeerVpcResult
    path = "/ls/api/2016-11-28/PeerVpc"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    PeerVpcResult.from_request(request)
  end



      # <p>Creates or updates an alarm, and associates it with the specified metric.</p>
  # <p>An alarm is used to monitor a single metric for one of your resources. When a metric
  # condition is met, the alarm can notify you by email, SMS text message, and a banner displayed
  # on the Amazon Lightsail console. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms
  # in Amazon Lightsail</a>.</p>
  # <p>When this action creates an alarm, the alarm state is immediately set to
  # <code>INSUFFICIENT_DATA</code>. The alarm is then evaluated and its state is set
  # appropriately. Any actions associated with the new state are then executed.</p>
  # <p>When you update an existing alarm, its state is left unchanged, but the update completely
  # overwrites the previous configuration of the alarm. The alarm is then evaluated with the
  # updated configuration.</p>
  def put_alarm(input : PutAlarmRequest) : PutAlarmResult
    path = "/ls/api/2016-11-28/PutAlarm"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    PutAlarmResult.from_request(request)
  end



      # <p>Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses
  # allowed to connect to the instance through the ports, and the protocol. This action also
  # closes all currently open ports that are not included in the request. Include all of the ports
  # and the protocols you want to open in your <code>PutInstancePublicPorts</code>request. Or use
  # the <code>OpenInstancePublicPorts</code> action to open ports without closing currently open
  # ports.</p>
  # <p>The <code>PutInstancePublicPorts</code> action supports tag-based access control via
  # resource tags applied to the resource identified by <code>instanceName</code>. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def put_instance_public_ports(input : PutInstancePublicPortsRequest) : PutInstancePublicPortsResult
    path = "/ls/api/2016-11-28/PutInstancePublicPorts"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    PutInstancePublicPortsResult.from_request(request)
  end



      # <p>Restarts a specific instance.</p>
  # <p>The <code>reboot instance</code> operation supports tag-based access control via resource
  # tags applied to the resource identified by <code>instance name</code>. For more information,
  # see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def reboot_instance(input : RebootInstanceRequest) : RebootInstanceResult
    path = "/ls/api/2016-11-28/RebootInstance"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    RebootInstanceResult.from_request(request)
  end



      # <p>Restarts a specific database in Amazon Lightsail.</p>
  # <p>The <code>reboot relational database</code> operation supports tag-based access control
  # via resource tags applied to the resource identified by relationalDatabaseName. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def reboot_relational_database(input : RebootRelationalDatabaseRequest) : RebootRelationalDatabaseResult
    path = "/ls/api/2016-11-28/RebootRelationalDatabase"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    RebootRelationalDatabaseResult.from_request(request)
  end



      # <p>Registers a container image to your Amazon Lightsail container service.</p>
  # 
  # <note>
  # <p>This action is not required if you install and use the Lightsail Control
  # (lightsailctl) plugin to push container images to your Lightsail container service. For
  # more information, see <a href="amazon-lightsail-pushing-container-images">Pushing and
  # managing container images on your Amazon Lightsail container services</a> in the
  # <i>Lightsail Dev Guide</i>.</p>
  # </note>
  def register_container_image(input : RegisterContainerImageRequest) : RegisterContainerImageResult
    path = "/ls/api/2016-11-28/container-services/{serviceName}/images"
    if label = input.service_name
      path.gsub("{serviceName}", label)
    else
      raise "No value provided for input HTTP label: serviceName"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    RegisterContainerImageResult.from_request(request)
  end



      # <p>Deletes a specific static IP from your account.</p>
  def release_static_ip(input : ReleaseStaticIpRequest) : ReleaseStaticIpResult
    path = "/ls/api/2016-11-28/ReleaseStaticIp"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    ReleaseStaticIpResult.from_request(request)
  end



      # <p>Deletes currently cached content from your Amazon Lightsail content delivery network (CDN)
  # distribution.</p>
  # <p>After resetting the cache, the next time a content request is made, your distribution
  # pulls, serves, and caches it from the origin.</p>
  def reset_distribution_cache(input : ResetDistributionCacheRequest) : ResetDistributionCacheResult
    path = "/ls/api/2016-11-28/ResetDistributionCache"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    ResetDistributionCacheResult.from_request(request)
  end



      # <p>Sends a verification request to an email contact method to ensure it's owned by the
  # requester. SMS contact methods don't need to be verified.</p>
  # <p>A contact method is used to send you notifications about your Amazon Lightsail resources.
  # You can add one email address and one mobile phone number contact method in each AWS Region.
  # However, SMS text messaging is not supported in some AWS Regions, and SMS text messages
  # cannot be sent to some countries/regions. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
  # <p>A verification request is sent to the contact method when you initially create it. Use
  # this action to send another verification request if a previous verification request was
  # deleted, or has expired.</p>
  # <important>
  # <p>Notifications are not sent to an email contact method until after it is verified, and
  # confirmed as valid.</p>
  # </important>
  def send_contact_method_verification(input : SendContactMethodVerificationRequest) : SendContactMethodVerificationResult
    path = "/ls/api/2016-11-28/SendContactMethodVerification"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    SendContactMethodVerificationResult.from_request(request)
  end



      # <p>Starts a specific Amazon Lightsail instance from a stopped state. To restart an instance,
  # use the <code>reboot instance</code> operation.</p>
  # <note>
  # <p>When you start a stopped instance, Lightsail assigns a new public IP address to the
  # instance. To use the same IP address after stopping and starting an instance, create a
  # static IP address and attach it to the instance. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip">Lightsail Dev Guide</a>.</p>
  # </note>
  # <p>The <code>start instance</code> operation supports tag-based access control via resource
  # tags applied to the resource identified by <code>instance name</code>. For more information,
  # see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def start_instance(input : StartInstanceRequest) : StartInstanceResult
    path = "/ls/api/2016-11-28/StartInstance"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    StartInstanceResult.from_request(request)
  end



      # <p>Starts a specific database from a stopped state in Amazon Lightsail. To restart a database,
  # use the <code>reboot relational database</code> operation.</p>
  # <p>The <code>start relational database</code> operation supports tag-based access control via
  # resource tags applied to the resource identified by relationalDatabaseName. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def start_relational_database(input : StartRelationalDatabaseRequest) : StartRelationalDatabaseResult
    path = "/ls/api/2016-11-28/StartRelationalDatabase"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    StartRelationalDatabaseResult.from_request(request)
  end



      # <p>Stops a specific Amazon Lightsail instance that is currently running.</p>
  # <note>
  # <p>When you start a stopped instance, Lightsail assigns a new public IP address to the
  # instance. To use the same IP address after stopping and starting an instance, create a
  # static IP address and attach it to the instance. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip">Lightsail Dev Guide</a>.</p>
  # </note>
  # <p>The <code>stop instance</code> operation supports tag-based access control via resource
  # tags applied to the resource identified by <code>instance name</code>. For more information,
  # see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def stop_instance(input : StopInstanceRequest) : StopInstanceResult
    path = "/ls/api/2016-11-28/StopInstance"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    StopInstanceResult.from_request(request)
  end



      # <p>Stops a specific database that is currently running in Amazon Lightsail.</p>
  # <p>The <code>stop relational database</code> operation supports tag-based access control via
  # resource tags applied to the resource identified by relationalDatabaseName. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def stop_relational_database(input : StopRelationalDatabaseRequest) : StopRelationalDatabaseResult
    path = "/ls/api/2016-11-28/StopRelationalDatabase"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    StopRelationalDatabaseResult.from_request(request)
  end



      # <p>Adds one or more tags to the specified Amazon Lightsail resource. Each resource can have a
  # maximum of 50 tags. Each tag consists of a key and an optional value. Tag keys must be unique
  # per resource. For more information about tags, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  # Dev Guide</a>.</p>
  # <p>The <code>tag resource</code> operation supports tag-based access control via request tags
  # and resource tags applied to the resource identified by <code>resource name</code>. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def tag_resource(input : TagResourceRequest) : TagResourceResult
    path = "/ls/api/2016-11-28/TagResource"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    TagResourceResult.from_request(request)
  end



      # <p>Tests an alarm by displaying a banner on the Amazon Lightsail console. If a notification
  # trigger is configured for the specified alarm, the test also sends a notification to the
  # notification protocol (<code>Email</code> and/or <code>SMS</code>) configured for the
  # alarm.</p>
  # <p>An alarm is used to monitor a single metric for one of your resources. When a metric
  # condition is met, the alarm can notify you by email, SMS text message, and a banner displayed
  # on the Amazon Lightsail console. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms
  # in Amazon Lightsail</a>.</p>
  def test_alarm(input : TestAlarmRequest) : TestAlarmResult
    path = "/ls/api/2016-11-28/TestAlarm"
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    TestAlarmResult.from_request(request)
  end



      # <p>Attempts to unpeer the Lightsail VPC from the user's default VPC.</p>
  def unpeer_vpc(input : UnpeerVpcRequest) : UnpeerVpcResult
    path = "/ls/api/2016-11-28/UnpeerVpc"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    UnpeerVpcResult.from_request(request)
  end



      # <p>Deletes the specified set of tag keys and their values from the specified Amazon Lightsail
  # resource.</p>
  # <p>The <code>untag resource</code> operation supports tag-based access control via request
  # tags and resource tags applied to the resource identified by <code>resource name</code>. For
  # more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def untag_resource(input : UntagResourceRequest) : UntagResourceResult
    path = "/ls/api/2016-11-28/UntagResource"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    UntagResourceResult.from_request(request)
  end



      # <p>Updates the configuration of your Amazon Lightsail container service, such as its power,
  # scale, and public domain names.</p>
  def update_container_service(input : UpdateContainerServiceRequest) : UpdateContainerServiceResult
    path = "/ls/api/2016-11-28/container-services/{serviceName}"
    if label = input.service_name
      path.gsub("{serviceName}", label)
    else
      raise "No value provided for input HTTP label: serviceName"
    end
    request = HTTP::Request.new("PATCH", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    UpdateContainerServiceResult.from_request(request)
  end



      # <p>Updates an existing Amazon Lightsail content delivery network (CDN) distribution.</p>
  # <p>Use this action to update the configuration of your existing distribution</p>
  def update_distribution(input : UpdateDistributionRequest) : UpdateDistributionResult
    path = "/ls/api/2016-11-28/UpdateDistribution"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    UpdateDistributionResult.from_request(request)
  end



      # <p>Updates the bundle of your Amazon Lightsail content delivery network (CDN)
  # distribution.</p>
  # <p>A distribution bundle specifies the monthly network transfer quota and monthly cost of
  # your dsitribution.</p>
  # <p>Update your distribution's bundle if your distribution is going over its monthly network
  # transfer quota and is incurring an overage fee.</p>
  # <p>You can update your distribution's bundle only one time within your monthly AWS billing
  # cycle. To determine if you can update your distribution's bundle, use the
  # <code>GetDistributions</code> action. The <code>ableToUpdateBundle</code> parameter in the
  # result will indicate whether you can currently update your distribution's bundle.</p>
  def update_distribution_bundle(input : UpdateDistributionBundleRequest) : UpdateDistributionBundleResult
    path = "/ls/api/2016-11-28/UpdateDistributionBundle"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    UpdateDistributionBundleResult.from_request(request)
  end



      # <p>Updates a domain recordset after it is created.</p>
  # <p>The <code>update domain entry</code> operation supports tag-based access control via
  # resource tags applied to the resource identified by <code>domain name</code>. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def update_domain_entry(input : UpdateDomainEntryRequest) : UpdateDomainEntryResult
    path = "/ls/api/2016-11-28/UpdateDomainEntry"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    UpdateDomainEntryResult.from_request(request)
  end



      # <p>Updates the specified attribute for a load balancer. You can only update one attribute at
  # a time.</p>
  # <p>The <code>update load balancer attribute</code> operation supports tag-based access
  # control via resource tags applied to the resource identified by <code>load balancer
  # name</code>. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def update_load_balancer_attribute(input : UpdateLoadBalancerAttributeRequest) : UpdateLoadBalancerAttributeResult
    path = "/ls/api/2016-11-28/UpdateLoadBalancerAttribute"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    UpdateLoadBalancerAttributeResult.from_request(request)
  end



      # <p>Allows the update of one or more attributes of a database in Amazon Lightsail.</p>
  # <p>Updates are applied immediately, or in cases where the updates could result in an outage,
  # are applied during the database's predefined maintenance window.</p>
  # <p>The <code>update relational database</code> operation supports tag-based access control
  # via resource tags applied to the resource identified by relationalDatabaseName. For more
  # information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def update_relational_database(input : UpdateRelationalDatabaseRequest) : UpdateRelationalDatabaseResult
    path = "/ls/api/2016-11-28/UpdateRelationalDatabase"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    UpdateRelationalDatabaseResult.from_request(request)
  end



      # <p>Allows the update of one or more parameters of a database in Amazon Lightsail.</p>
  # <p>Parameter updates don't cause outages; therefore, their application is not subject to the
  # preferred maintenance window. However, there are two ways in which parameter updates are
  # applied: <code>dynamic</code> or <code>pending-reboot</code>. Parameters marked with a
  # <code>dynamic</code> apply type are applied immediately. Parameters marked with a
  # <code>pending-reboot</code> apply type are applied only after the database is rebooted using
  # the <code>reboot relational database</code> operation.</p>
  # <p>The <code>update relational database parameters</code> operation supports tag-based access
  # control via resource tags applied to the resource identified by relationalDatabaseName. For
  # more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail Dev Guide</a>.</p>
  def update_relational_database_parameters(input : UpdateRelationalDatabaseParametersRequest) : UpdateRelationalDatabaseParametersResult
    path = "/ls/api/2016-11-28/UpdateRelationalDatabaseParameters"
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    raise AccessDeniedException if response.code == 403
    raise AccountSetupInProgressException if response.code == 428
    raise InvalidInputException if response.code == 400
    raise NotFoundException if response.code == 404
    raise OperationFailureException if response.code == 400
    raise ServiceException if response.code == 500
    raise UnauthenticatedException if response.code == 401

    UpdateRelationalDatabaseParametersResult.from_request(request)
  end





  class AllocateStaticIpRequest 
    include JSON1_1

    # <p>The name of the static IP address.</p>
    @[Protocol::Field(location: :body, name: "staticIpName", required: true)]
    property static_ip_name : String
  end

  class ResourceLocationStruct 
    include JSON1_1

    # <p>The Availability Zone. Follows the format <code>us-east-2a</code> (case-sensitive).</p>
    @[Protocol::Field(location: :body, name: "availabilityZone", required: false)]
    property availability_zone : String?
    # <p>The AWS Region name.</p>
    @[Protocol::Field(location: :body, name: "regionName", required: false)]
    property region_name : String?
  end

  class OperationStruct 
    include JSON1_1

    # <p>The ID of the operation.</p>
    @[Protocol::Field(location: :body, name: "id", required: false)]
    property id : String?
    # <p>The resource name.</p>
    @[Protocol::Field(location: :body, name: "resourceName", required: false)]
    property resource_name : String?
    # <p>The resource type. </p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The timestamp when the operation was initialized (e.g.,
    # <code>1479816991.349</code>).</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The AWS Region and Availability Zone.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>A Boolean value indicating whether the operation is terminal.</p>
    @[Protocol::Field(location: :body, name: "isTerminal", required: false)]
    property is_terminal : Bool?
    # <p>Details about the operation (e.g., <code>Debian-1GB-Ohio-1</code>).</p>
    @[Protocol::Field(location: :body, name: "operationDetails", required: false)]
    property operation_details : String?
    # <p>The type of operation. </p>
    @[Protocol::Field(location: :body, name: "operationType", required: false)]
    property operation_type : String?
    # <p>The status of the operation. </p>
    @[Protocol::Field(location: :body, name: "status", required: false)]
    property status : String?
    # <p>The timestamp when the status was changed (e.g., <code>1479816991.349</code>).</p>
    @[Protocol::Field(location: :body, name: "statusChangedAt", required: false)]
    property status_changed_at : Time?
    # <p>The error code.</p>
    @[Protocol::Field(location: :body, name: "errorCode", required: false)]
    property error_code : String?
    # <p>The error details.</p>
    @[Protocol::Field(location: :body, name: "errorDetails", required: false)]
    property error_details : String?
  end

  class AllocateStaticIpResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class AccessDeniedException < Exception
    include JSON1_1

    # 
    @[Protocol::Field(location: :body, name: "code", required: false)]
    property code : String?
    # 
    @[Protocol::Field(location: :body, name: "docs", required: false)]
    property docs : String?
    # 
    @[Protocol::Field(location: :body, name: "message", required: false)]
    property message : String?
    # 
    @[Protocol::Field(location: :body, name: "tip", required: false)]
    property tip : String?
  end

  class AccountSetupInProgressException < Exception
    include JSON1_1

    # 
    @[Protocol::Field(location: :body, name: "code", required: false)]
    property code : String?
    # 
    @[Protocol::Field(location: :body, name: "docs", required: false)]
    property docs : String?
    # 
    @[Protocol::Field(location: :body, name: "message", required: false)]
    property message : String?
    # 
    @[Protocol::Field(location: :body, name: "tip", required: false)]
    property tip : String?
  end

  class InvalidInputException < Exception
    include JSON1_1

    # 
    @[Protocol::Field(location: :body, name: "code", required: false)]
    property code : String?
    # 
    @[Protocol::Field(location: :body, name: "docs", required: false)]
    property docs : String?
    # 
    @[Protocol::Field(location: :body, name: "message", required: false)]
    property message : String?
    # 
    @[Protocol::Field(location: :body, name: "tip", required: false)]
    property tip : String?
  end

  class NotFoundException < Exception
    include JSON1_1

    # 
    @[Protocol::Field(location: :body, name: "code", required: false)]
    property code : String?
    # 
    @[Protocol::Field(location: :body, name: "docs", required: false)]
    property docs : String?
    # 
    @[Protocol::Field(location: :body, name: "message", required: false)]
    property message : String?
    # 
    @[Protocol::Field(location: :body, name: "tip", required: false)]
    property tip : String?
  end

  class OperationFailureException < Exception
    include JSON1_1

    # 
    @[Protocol::Field(location: :body, name: "code", required: false)]
    property code : String?
    # 
    @[Protocol::Field(location: :body, name: "docs", required: false)]
    property docs : String?
    # 
    @[Protocol::Field(location: :body, name: "message", required: false)]
    property message : String?
    # 
    @[Protocol::Field(location: :body, name: "tip", required: false)]
    property tip : String?
  end

  class ServiceException < Exception
    include JSON1_1

    # 
    @[Protocol::Field(location: :body, name: "code", required: false)]
    property code : String?
    # 
    @[Protocol::Field(location: :body, name: "docs", required: false)]
    property docs : String?
    # 
    @[Protocol::Field(location: :body, name: "message", required: false)]
    property message : String?
    # 
    @[Protocol::Field(location: :body, name: "tip", required: false)]
    property tip : String?
  end

  class UnauthenticatedException < Exception
    include JSON1_1

    # 
    @[Protocol::Field(location: :body, name: "code", required: false)]
    property code : String?
    # 
    @[Protocol::Field(location: :body, name: "docs", required: false)]
    property docs : String?
    # 
    @[Protocol::Field(location: :body, name: "message", required: false)]
    property message : String?
    # 
    @[Protocol::Field(location: :body, name: "tip", required: false)]
    property tip : String?
  end

  class AttachCertificateToDistributionRequest 
    include JSON1_1

    # <p>The name of the distribution that the certificate will be attached to.</p>
    # <p>Use the <code>GetDistributions</code> action to get a list of distribution names that you
    # can specify.</p>
    @[Protocol::Field(location: :body, name: "distributionName", required: true)]
    property distribution_name : String
    # <p>The name of the certificate to attach to a distribution.</p>
    # <p>Only certificates with a status of <code>ISSUED</code> can be attached to a
    # distribution.</p>
    # <p>Use the <code>GetCertificates</code> action to get a list of certificate names that you
    # can specify.</p>
    # <note>
    # <p>This is the name of the certificate resource type and is used only to reference the
    # certificate in other API actions. It can be different than the domain name of the
    # certificate. For example, your certificate name might be
    # <code>WordPress-Blog-Certificate</code> and the domain name of the certificate might be
    # <code>example.com</code>.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "certificateName", required: true)]
    property certificate_name : String
  end

  class AttachCertificateToDistributionResultStruct 
    include JSON1_1

    # <p>An object that describes the result of the action, such as the status of the request, the
    # timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class AttachDiskRequest 
    include JSON1_1

    # <p>The unique Lightsail disk name (e.g., <code>my-disk</code>).</p>
    @[Protocol::Field(location: :body, name: "diskName", required: true)]
    property disk_name : String
    # <p>The name of the Lightsail instance where you want to utilize the storage disk.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
    # <p>The disk path to expose to the instance (e.g., <code>/dev/xvdf</code>).</p>
    @[Protocol::Field(location: :body, name: "diskPath", required: true)]
    property disk_path : String
  end

  class AttachDiskResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class AttachInstancesToLoadBalancerRequest 
    include JSON1_1

    # <p>The name of the load balancer.</p>
    @[Protocol::Field(location: :body, name: "loadBalancerName", required: true)]
    property load_balancer_name : String
    # <p>An array of strings representing the instance name(s) you want to attach to your load
    # balancer.</p>
    # <p>An instance must be <code>running</code> before you can attach it to your load
    # balancer.</p>
    # <p>There are no additional limits on the number of instances you can attach to your load
    # balancer, aside from the limit of Lightsail instances you can create in your account
    # (20).</p>
    @[Protocol::Field(location: :body, name: "instanceNames", required: true)]
    property instance_names : Array(String)
  end

  class AttachInstancesToLoadBalancerResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class AttachLoadBalancerTlsCertificateRequest 
    include JSON1_1

    # <p>The name of the load balancer to which you want to associate the SSL/TLS
    # certificate.</p>
    @[Protocol::Field(location: :body, name: "loadBalancerName", required: true)]
    property load_balancer_name : String
    # <p>The name of your SSL/TLS certificate.</p>
    @[Protocol::Field(location: :body, name: "certificateName", required: true)]
    property certificate_name : String
  end

  class AttachLoadBalancerTlsCertificateResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    # <p>These SSL/TLS certificates are only usable by Lightsail load balancers. You can't get
    # the certificate and use it for another purpose.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class AttachStaticIpRequest 
    include JSON1_1

    # <p>The name of the static IP.</p>
    @[Protocol::Field(location: :body, name: "staticIpName", required: true)]
    property static_ip_name : String
    # <p>The instance name to which you want to attach the static IP address.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
  end

  class AttachStaticIpResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class PortInfoStruct 
    include JSON1_1

    # <p>The first port in a range of open ports on an instance.</p>
    # <p>Allowed ports:</p>
    # <ul>
    # <li>
    # <p>TCP and UDP - <code>0</code> to <code>65535</code>
    # </p>
    # </li>
    # <li>
    # <p>ICMP - The ICMP type. For example, specify <code>8</code> as the <code>fromPort</code>
    # (ICMP type), and <code>-1</code> as the <code>toPort</code> (ICMP code), to enable ICMP
    # Ping. For more information, see <a href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control Messages</a> on <i>Wikipedia</i>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "fromPort", required: false)]
    property from_port : Int32?
    # <p>The last port in a range of open ports on an instance.</p>
    # <p>Allowed ports:</p>
    # <ul>
    # <li>
    # <p>TCP and UDP - <code>0</code> to <code>65535</code>
    # </p>
    # </li>
    # <li>
    # <p>ICMP - The ICMP code. For example, specify <code>8</code> as the <code>fromPort</code>
    # (ICMP type), and <code>-1</code> as the <code>toPort</code> (ICMP code), to enable ICMP
    # Ping. For more information, see <a href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control Messages</a> on <i>Wikipedia</i>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "toPort", required: false)]
    property to_port : Int32?
    # <p>The IP protocol name.</p>
    # <p>The name can be one of the following:</p>
    # <ul>
    # <li>
    # <p>
    # <code>tcp</code> - Transmission Control Protocol (TCP) provides reliable, ordered, and
    # error-checked delivery of streamed data between applications running on hosts
    # communicating by an IP network. If you have an application that doesn't require reliable
    # data stream service, use UDP instead.</p>
    # </li>
    # <li>
    # <p>
    # <code>all</code> - All transport layer protocol types. For more general information,
    # see <a href="https://en.wikipedia.org/wiki/Transport_layer">Transport layer</a> on
    # <i>Wikipedia</i>.</p>
    # </li>
    # <li>
    # <p>
    # <code>udp</code> - With User Datagram Protocol (UDP), computer applications can send
    # messages (or datagrams) to other hosts on an Internet Protocol (IP) network. Prior
    # communications are not required to set up transmission channels or data paths.
    # Applications that don't require reliable data stream service can use UDP, which provides a
    # connectionless datagram service that emphasizes reduced latency over reliability. If you
    # do require reliable data stream service, use TCP instead.</p>
    # </li>
    # <li>
    # <p>
    # <code>icmp</code> - Internet Control Message Protocol (ICMP) is used to send error
    # messages and operational information indicating success or failure when communicating with
    # an instance. For example, an error is indicated when an instance could not be reached.
    # When you specify <code>icmp</code> as the <code>protocol</code>, you must specify the ICMP
    # type using the <code>fromPort</code> parameter, and ICMP code using the
    # <code>toPort</code> parameter.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "protocol", required: false)]
    property protocol : String?
    # <p>The IP address, or range of IP addresses in CIDR notation, that are allowed to connect to
    # an instance through the ports, and the protocol. Lightsail supports IPv4 addresses.</p>
    # <p>Examples:</p>
    # <ul>
    # <li>
    # <p>To allow the IP address <code>192.0.2.44</code>, specify <code>192.0.2.44</code> or
    # <code>192.0.2.44/32</code>. </p>
    # </li>
    # <li>
    # <p>To allow the IP addresses <code>192.0.2.0</code> to <code>192.0.2.255</code>, specify
    # <code>192.0.2.0/24</code>.</p>
    # </li>
    # </ul>
    # <p>For more information about CIDR block notation, see <a href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless
    # Inter-Domain Routing</a> on <i>Wikipedia</i>.</p>
    @[Protocol::Field(location: :body, name: "cidrs", required: false)]
    property cidrs : Array(String)?
    # <p>An alias that defines access for a preconfigured range of IP addresses.</p>
    # <p>The only alias currently supported is <code>lightsail-connect</code>, which allows IP
    # addresses of the browser-based RDP/SSH client in the Lightsail console to connect to your
    # instance.</p>
    @[Protocol::Field(location: :body, name: "cidrListAliases", required: false)]
    property cidr_list_aliases : Array(String)?
  end

  class CloseInstancePublicPortsRequest 
    include JSON1_1

    # <p>An object to describe the ports to close for the specified instance.</p>
    @[Protocol::Field(location: :body, name: "portInfo", required: true)]
    property port_info : PortInfoStruct
    # <p>The name of the instance for which to close ports.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
  end

  class CloseInstancePublicPortsResultStruct 
    include JSON1_1

    # <p>An object that describes the result of the action, such as the status of the request, the
    # timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class CopySnapshotRequest 
    include JSON1_1

    # <p>The name of the source manual snapshot to copy.</p>
    # <p>Constraint:</p>
    # <ul>
    # <li>
    # <p>Define this parameter only when copying a manual snapshot as another manual
    # snapshot.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "sourceSnapshotName", required: false)]
    property source_snapshot_name : String?
    # <p>The name of the source instance or disk from which the source automatic snapshot was
    # created.</p>
    # <p>Constraint:</p>
    # <ul>
    # <li>
    # <p>Define this parameter only when copying an automatic snapshot as a manual snapshot.
    # For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots">Lightsail Dev Guide</a>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "sourceResourceName", required: false)]
    property source_resource_name : String?
    # <p>The date of the source automatic snapshot to copy. Use the <code>get auto snapshots</code>
    # operation to identify the dates of the available automatic snapshots.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must be specified in <code>YYYY-MM-DD</code> format.</p>
    # </li>
    # <li>
    # <p>This parameter cannot be defined together with the <code>use latest restorable auto
    # snapshot</code> parameter. The <code>restore date</code> and <code>use latest restorable
    # auto snapshot</code> parameters are mutually exclusive.</p>
    # </li>
    # <li>
    # <p>Define this parameter only when copying an automatic snapshot as a manual snapshot.
    # For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots">Lightsail Dev Guide</a>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "restoreDate", required: false)]
    property restore_date : String?
    # <p>A Boolean value to indicate whether to use the latest available automatic snapshot of the
    # specified source instance or disk.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>This parameter cannot be defined together with the <code>restore date</code>
    # parameter. The <code>use latest restorable auto snapshot</code> and <code>restore
    # date</code> parameters are mutually exclusive.</p>
    # </li>
    # <li>
    # <p>Define this parameter only when copying an automatic snapshot as a manual snapshot.
    # For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots">Lightsail Dev Guide</a>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "useLatestRestorableAutoSnapshot", required: false)]
    property use_latest_restorable_auto_snapshot : Bool?
    # <p>The name of the new manual snapshot to be created as a copy.</p>
    @[Protocol::Field(location: :body, name: "targetSnapshotName", required: true)]
    property target_snapshot_name : String
    # <p>The AWS Region where the source manual or automatic snapshot is located.</p>
    @[Protocol::Field(location: :body, name: "sourceRegion", required: true)]
    property source_region : String
  end

  class CopySnapshotResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class TagStruct 
    include JSON1_1

    # <p>The key of the tag.</p>
    # <p>Constraints: Tag keys accept a maximum of 128 letters, numbers, spaces in UTF-8, or the
    # following characters: + - = . _ : / @</p>
    @[Protocol::Field(location: :body, name: "key", required: false)]
    property key : String?
    # <p>The value of the tag.</p>
    # <p>Constraints: Tag values accept a maximum of 256 letters, numbers, spaces in UTF-8, or the
    # following characters: + - = . _ : / @</p>
    @[Protocol::Field(location: :body, name: "value", required: false)]
    property value : String?
  end

  class CreateCertificateRequest 
    include JSON1_1

    # <p>The name for the certificate.</p>
    @[Protocol::Field(location: :body, name: "certificateName", required: true)]
    property certificate_name : String
    # <p>The domain name (e.g., <code>example.com</code>) for the certificate.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: true)]
    property domain_name : String
    # <p>An array of strings that specify the alternate domains (e.g., <code>example2.com</code>)
    # and subdomains (e.g., <code>blog.example.com</code>) for the certificate.</p>
    # <p>You can specify a maximum of nine alternate domains (in addition to the primary domain
    # name).</p>
    # <p>Wildcard domain entries (e.g., <code>*.example.com</code>) are not supported.</p>
    @[Protocol::Field(location: :body, name: "subjectAlternativeNames", required: false)]
    property subject_alternative_names : Array(String)?
    # <p>The tag keys and optional values to add to the certificate during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class ResourceRecordStruct 
    include JSON1_1

    # <p>The name of the record.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The DNS record type.</p>
    @[Protocol::Field(location: :body, name: "type", required: false)]
    property type : String?
    # <p>The value for the DNS record.</p>
    @[Protocol::Field(location: :body, name: "value", required: false)]
    property value : String?
  end

  class DomainValidationRecordStruct 
    include JSON1_1

    # <p>The domain name of the certificate validation record. For example,
    # <code>example.com</code> or <code>www.example.com</code>.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: false)]
    property domain_name : String?
    # <p>An object that describes the DNS records to add to your domain's DNS to validate it for
    # the certificate.</p>
    @[Protocol::Field(location: :body, name: "resourceRecord", required: false)]
    property resource_record : ResourceRecordStruct?
  end

  class RenewalSummaryStruct 
    include JSON1_1

    # <p>An array of objects that describe the domain validation records of the certificate.</p>
    @[Protocol::Field(location: :body, name: "domainValidationRecords", required: false)]
    property domain_validation_records : Array(DomainValidationRecordStruct)?
    # <p>The renewal status of the certificate.</p>
    # <p>The following renewal status are possible:</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>PendingAutoRenewal</code>
    # </b> - Lightsail is
    # attempting to automatically validate the domain names of the certificate. No further
    # action is required. </p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>PendingValidation</code>
    # </b> - Lightsail couldn't
    # automatically validate one or more domain names of the certificate. You must take action
    # to validate these domain names or the certificate won't be renewed. Check to make sure
    # your certificate's domain validation records exist in your domain's DNS, and that your
    # certificate remains in use.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Success</code>
    # </b> - All domain names in the
    # certificate are validated, and Lightsail renewed the certificate. No further action is
    # required. </p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Failed</code>
    # </b> - One or more domain names were
    # not validated before the certificate expired, and Lightsail did not renew the
    # certificate. You can request a new certificate using the <code>CreateCertificate</code>
    # action.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "renewalStatus", required: false)]
    property renewal_status : String?
    # <p>The reason for the renewal status of the certificate.</p>
    @[Protocol::Field(location: :body, name: "renewalStatusReason", required: false)]
    property renewal_status_reason : String?
    # <p>The timestamp when the certificate was last updated.</p>
    @[Protocol::Field(location: :body, name: "updatedAt", required: false)]
    property updated_at : Time?
  end

  class CertificateStruct 
    include JSON1_1

    # <p>The Amazon Resource Name (ARN) of the certificate.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The name of the certificate (e.g., <code>my-certificate</code>).</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The domain name of the certificate.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: false)]
    property domain_name : String?
    # <p>The validation status of the certificate.</p>
    @[Protocol::Field(location: :body, name: "status", required: false)]
    property status : String?
    # <p>The serial number of the certificate.</p>
    @[Protocol::Field(location: :body, name: "serialNumber", required: false)]
    property serial_number : String?
    # <p>An array of strings that specify the alternate domains (e.g., <code>example2.com</code>)
    # and subdomains (e.g., <code>blog.example.com</code>) of the certificate.</p>
    @[Protocol::Field(location: :body, name: "subjectAlternativeNames", required: false)]
    property subject_alternative_names : Array(String)?
    # <p>An array of objects that describe the domain validation records of the certificate.</p>
    @[Protocol::Field(location: :body, name: "domainValidationRecords", required: false)]
    property domain_validation_records : Array(DomainValidationRecordStruct)?
    # <p>The validation failure reason, if any, of the certificate.</p>
    # <p>The following failure reasons are possible:</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>NO_AVAILABLE_CONTACTS</code>
    # </b> - This failure
    # applies to email validation, which is not available for Lightsail certificates.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>ADDITIONAL_VERIFICATION_REQUIRED</code>
    # </b> -
    # Lightsail requires additional information to process this certificate request. This can
    # happen as a fraud-protection measure, such as when the domain ranks within the Alexa top
    # 1000 websites. To provide the required information, use the <a href="https://console.aws.amazon.com/support/home">AWS Support Center</a> to contact
    # AWS Support.</p>
    # <note>
    # <p>You cannot request a certificate for Amazon-owned domain names such as those ending
    # in amazonaws.com, cloudfront.net, or elasticbeanstalk.com.</p>
    # </note>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>DOMAIN_NOT_ALLOWED</code>
    # </b> - One or more of the
    # domain names in the certificate request was reported as an unsafe domain by <a href="https://www.virustotal.com/gui/home/url">VirusTotal</a>. To correct the
    # problem, search for your domain name on the <a href="https://www.virustotal.com/gui/home/url">VirusTotal</a> website. If your domain
    # is reported as suspicious, see <a href="https://www.google.com/webmasters/hacked/?hl=en">Google Help for Hacked
    # Websites</a> to learn what you can do.</p>
    # <p>If you believe that the result is a false positive, notify the organization that is
    # reporting the domain. VirusTotal is an aggregate of several antivirus and URL scanners and
    # cannot remove your domain from a block list itself. After you correct the problem and the
    # VirusTotal registry has been updated, request a new certificate.</p>
    # <p>If you see this error and your domain is not included in the VirusTotal list, visit
    # the <a href="https://console.aws.amazon.com/support/home">AWS Support Center</a>
    # and create a case.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>INVALID_PUBLIC_DOMAIN</code>
    # </b> - One or more of
    # the domain names in the certificate request is not valid. Typically, this is because a
    # domain name in the request is not a valid top-level domain. Try to request a certificate
    # again, correcting any spelling errors or typos that were in the failed request, and ensure
    # that all domain names in the request are for valid top-level domains. For example, you
    # cannot request a certificate for <code>example.invalidpublicdomain</code> because
    # <code>invalidpublicdomain</code> is not a valid top-level domain.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>OTHER</code>
    # </b> - Typically, this failure occurs
    # when there is a typographical error in one or more of the domain names in the certificate
    # request. Try to request a certificate again, correcting any spelling errors or typos that
    # were in the failed request. </p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "requestFailureReason", required: false)]
    property request_failure_reason : String?
    # <p>The number of Lightsail resources that the certificate is attached to.</p>
    @[Protocol::Field(location: :body, name: "inUseResourceCount", required: false)]
    property in_use_resource_count : Int32?
    # <p>The algorithm used to generate the key pair (the public and private key) of the
    # certificate.</p>
    @[Protocol::Field(location: :body, name: "keyAlgorithm", required: false)]
    property key_algorithm : String?
    # <p>The timestamp when the certificate was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The timestamp when the certificate was issued.</p>
    @[Protocol::Field(location: :body, name: "issuedAt", required: false)]
    property issued_at : Time?
    # <p>The certificate authority that issued the certificate.</p>
    @[Protocol::Field(location: :body, name: "issuerCA", required: false)]
    property issuer_ca : String?
    # <p>The timestamp when the certificate is first valid.</p>
    @[Protocol::Field(location: :body, name: "notBefore", required: false)]
    property not_before : Time?
    # <p>The timestamp when the certificate expires.</p>
    @[Protocol::Field(location: :body, name: "notAfter", required: false)]
    property not_after : Time?
    # <p>The renewal eligibility of the certificate.</p>
    @[Protocol::Field(location: :body, name: "eligibleToRenew", required: false)]
    property eligible_to_renew : String?
    # <p>An object that describes the status of the certificate renewal managed by
    # Lightsail.</p>
    @[Protocol::Field(location: :body, name: "renewalSummary", required: false)]
    property renewal_summary : RenewalSummaryStruct?
    # <p>The timestamp when the certificate was revoked. This value is present only when the
    # certificate status is <code>REVOKED</code>.</p>
    @[Protocol::Field(location: :body, name: "revokedAt", required: false)]
    property revoked_at : Time?
    # <p>The reason the certificate was revoked. This value is present only when the certificate
    # status is <code>REVOKED</code>.</p>
    @[Protocol::Field(location: :body, name: "revocationReason", required: false)]
    property revocation_reason : String?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>The support code. Include this code in your email to support when you have questions about
    # your Lightsail certificate. This code enables our support team to look up your Lightsail
    # information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
  end

  class CertificateSummaryStruct 
    include JSON1_1

    # <p>The Amazon Resource Name (ARN) of the certificate.</p>
    @[Protocol::Field(location: :body, name: "certificateArn", required: false)]
    property certificate_arn : String?
    # <p>The name of the certificate.</p>
    @[Protocol::Field(location: :body, name: "certificateName", required: false)]
    property certificate_name : String?
    # <p>The domain name of the certificate.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: false)]
    property domain_name : String?
    # <p>An object that describes a certificate in detail.</p>
    @[Protocol::Field(location: :body, name: "certificateDetail", required: false)]
    property certificate_detail : CertificateStruct?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class CreateCertificateResultStruct 
    include JSON1_1

    # <p>An object that describes the certificate created.</p>
    @[Protocol::Field(location: :body, name: "certificate", required: false)]
    property certificate : CertificateSummaryStruct?
    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class InstanceEntryStruct 
    include JSON1_1

    # <p>The name of the export snapshot record, which contains the exported Lightsail instance
    # snapshot that will be used as the source of the new Amazon EC2 instance.</p>
    # <p>Use the <code>get export snapshot records</code> operation to get a list of export
    # snapshot records that you can use to create a CloudFormation stack.</p>
    @[Protocol::Field(location: :body, name: "sourceName", required: true)]
    property source_name : String
    # <p>The instance type (e.g., <code>t2.micro</code>) to use for the new Amazon EC2 instance.</p>
    @[Protocol::Field(location: :body, name: "instanceType", required: true)]
    property instance_type : String
    # <p>The port configuration to use for the new Amazon EC2 instance.</p>
    # <p>The following configuration options are available:</p>
    # <ul>
    # <li>
    # <p>
    # <code>DEFAULT</code> - Use the default firewall settings from the Lightsail instance
    # blueprint.</p>
    # </li>
    # <li>
    # <p>
    # <code>INSTANCE</code> - Use the configured firewall settings from the source
    # Lightsail instance.</p>
    # </li>
    # <li>
    # <p>
    # <code>NONE</code> - Use the default Amazon EC2 security group.</p>
    # </li>
    # <li>
    # <p>
    # <code>CLOSED</code> - All ports closed.</p>
    # </li>
    # </ul>
    # <note>
    # <p>If you configured <code>lightsail-connect</code> as a <code>cidrListAliases</code> on
    # your instance, or if you chose to allow the Lightsail browser-based SSH or RDP clients to
    # connect to your instance, that configuration is not carried over to your new Amazon EC2
    # instance.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "portInfoSource", required: true)]
    property port_info_source : String
    # <p>A launch script you can create that configures a server with additional user data. For
    # example, you might want to run <code>apt-get -y update</code>.</p>
    # <note>
    # <p>Depending on the machine image you choose, the command to get software on your instance
    # varies. Amazon Linux and CentOS use <code>yum</code>, Debian and Ubuntu use
    # <code>apt-get</code>, and FreeBSD uses <code>pkg</code>.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "userData", required: false)]
    property user_data : String?
    # <p>The Availability Zone for the new Amazon EC2 instance.</p>
    @[Protocol::Field(location: :body, name: "availabilityZone", required: true)]
    property availability_zone : String
  end

  class CreateCloudFormationStackRequest 
    include JSON1_1

    # <p>An array of parameters that will be used to create the new Amazon EC2 instance. You can only
    # pass one instance entry at a time in this array. You will get an invalid parameter error if
    # you pass more than one instance entry in this array.</p>
    @[Protocol::Field(location: :body, name: "instances", required: true)]
    property instances : Array(InstanceEntryStruct)
  end

  class CreateCloudFormationStackResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class CreateContactMethodRequest 
    include JSON1_1

    # <p>The protocol of the contact method, such as <code>Email</code> or <code>SMS</code> (text
    # messaging).</p>
    # <p>The <code>SMS</code> protocol is supported only in the following AWS Regions.</p>
    # <ul>
    # <li>
    # <p>US East (N. Virginia) (<code>us-east-1</code>)</p>
    # </li>
    # <li>
    # <p>US West (Oregon) (<code>us-west-2</code>)</p>
    # </li>
    # <li>
    # <p>Europe (Ireland) (<code>eu-west-1</code>)</p>
    # </li>
    # <li>
    # <p>Asia Pacific (Tokyo) (<code>ap-northeast-1</code>)</p>
    # </li>
    # <li>
    # <p>Asia Pacific (Singapore) (<code>ap-southeast-1</code>)</p>
    # </li>
    # <li>
    # <p>Asia Pacific (Sydney) (<code>ap-southeast-2</code>)</p>
    # </li>
    # </ul>
    # <p>For a list of countries/regions where SMS text messages can be sent, and the latest AWS
    # Regions where SMS text messaging is supported, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-supported-regions-countries.html">Supported Regions and Countries</a> in the <i>Amazon SNS Developer
    # Guide</i>.</p>
    # <p>For more information about notifications in Amazon Lightsail, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
    @[Protocol::Field(location: :body, name: "protocol", required: true)]
    property protocol : String
    # <p>The destination of the contact method, such as an email address or a mobile phone
    # number.</p>
    # <p>Use the E.164 format when specifying a mobile phone number. E.164 is a standard for the
    # phone number structure used for international telecommunication. Phone numbers that follow
    # this format can have a maximum of 15 digits, and they are prefixed with the plus character (+)
    # and the country code. For example, a U.S. phone number in E.164 format would be specified as
    # +1XXX5550100. For more information, see <a href="https://en.wikipedia.org/wiki/E.164">E.164</a> on <i>Wikipedia</i>.</p>
    @[Protocol::Field(location: :body, name: "contactEndpoint", required: true)]
    property contact_endpoint : String
  end

  class CreateContactMethodResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class ContainerStruct 
    include JSON1_1

    # <p>The name of the image used for the container.</p>
    # 
    # <p>Container images sourced from your Lightsail container service, that are registered and
    # stored on your service, start with a colon (<code>:</code>). For example,
    # <code>:container-service-1.mystaticwebsite.1</code>. Container images sourced from a public
    # registry like Docker Hub don't start with a colon. For example, <code>nginx:latest</code> or
    # <code>nginx</code>.</p>
    @[Protocol::Field(location: :body, name: "image", required: false)]
    property image : String?
    # <p>The launch command for the container.</p>
    @[Protocol::Field(location: :body, name: "command", required: false)]
    property command : Array(String)?
    # <p>The environment variables of the container.</p>
    @[Protocol::Field(location: :body, name: "environment", required: false)]
    property environment : Hash(String, String)?
    # <p>The open firewall ports of the container.</p>
    @[Protocol::Field(location: :body, name: "ports", required: false)]
    property ports : Hash(String, String)?
  end

  class ContainerServiceHealthCheckConfigStruct 
    include JSON1_1

    # <p>The number of consecutive health checks successes required before moving the container to
    # the <code>Healthy</code> state.</p>
    @[Protocol::Field(location: :body, name: "healthyThreshold", required: false)]
    property healthy_threshold : Int32?
    # <p>The number of consecutive health check failures required before moving the container to
    # the <code>Unhealthy</code> state.</p>
    @[Protocol::Field(location: :body, name: "unhealthyThreshold", required: false)]
    property unhealthy_threshold : Int32?
    # <p>The amount of time, in seconds, during which no response means a failed health check. You
    # may specify between 2 and 60 seconds.</p>
    @[Protocol::Field(location: :body, name: "timeoutSeconds", required: false)]
    property timeout_seconds : Int32?
    # <p>The approximate interval, in seconds, between health checks of an individual container.
    # You may specify between 5 and 300 seconds.</p>
    @[Protocol::Field(location: :body, name: "intervalSeconds", required: false)]
    property interval_seconds : Int32?
    # <p>The path on the container on which to perform the health check.</p>
    @[Protocol::Field(location: :body, name: "path", required: false)]
    property path : String?
    # <p>The HTTP codes to use when checking for a successful response from a container. You can
    # specify values between 200 and 499.</p>
    @[Protocol::Field(location: :body, name: "successCodes", required: false)]
    property success_codes : String?
  end

  class EndpointRequest 
    include JSON1_1

    # <p>The name of the container for the endpoint.</p>
    @[Protocol::Field(location: :body, name: "containerName", required: true)]
    property container_name : String
    # <p>The port of the container to which traffic is forwarded to.</p>
    @[Protocol::Field(location: :body, name: "containerPort", required: true)]
    property container_port : Int32
    # <p>An object that describes the health check configuration of the container.</p>
    @[Protocol::Field(location: :body, name: "healthCheck", required: false)]
    property health_check : ContainerServiceHealthCheckConfigStruct?
  end

  class ContainerServiceDeploymentRequest 
    include JSON1_1

    # <p>An object that describes the configuration for the containers of the deployment.</p>
    @[Protocol::Field(location: :body, name: "containers", required: false)]
    property containers : Hash(String, ContainerStruct)?
    # <p>An object that describes the endpoint of the deployment.</p>
    @[Protocol::Field(location: :body, name: "publicEndpoint", required: false)]
    property public_endpoint : EndpointRequest?
  end

  class CreateContainerServiceRequest 
    include JSON1_1

    # <p>The name for the container service.</p>
    # 
    # <p>The name that you specify for your container service will make up part of its default
    # domain. The default domain of a container service is typically
    # <code>https://<ServiceName>.<RandomGUID>.<AWSRegion>.cs.amazonlightsail.com</code>.
    # If the name of your container service is <code>container-service-1</code>, and it's located in
    # the US East (Ohio) AWS region (<code>us-east-2</code>), then the domain for your container
    # service will be like the following example:
    # <code>https://container-service-1.ur4EXAMPLE2uq.us-east-2.cs.amazonlightsail.com</code>
    # </p>
    # 
    # <p>The following are the requirements for container service names:</p>
    # 
    # <ul>
    # <li>
    # <p>Must be unique within each AWS Region in your Lightsail account.</p>
    # </li>
    # <li>
    # <p>Must contain 1 to 63 characters.</p>
    # </li>
    # <li>
    # <p>Must contain only alphanumeric characters and hyphens.</p>
    # </li>
    # <li>
    # <p>A hyphen (-) can separate words but cannot be at the start or end of the name.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "serviceName", required: true)]
    property service_name : String
    # <p>The power specification for the container service.</p>
    # 
    # <p>The power specifies the amount of memory, vCPUs, and base monthly cost of each node of the
    # container service. The <code>power</code> and <code>scale</code> of a container service makes
    # up its configured capacity. To determine the monthly price of your container service, multiply
    # the base price of the <code>power</code> with the <code>scale</code> (the number of nodes) of
    # the service.</p>
    # 
    # <p>Use the <code>GetContainerServicePowers</code> action to get a list of power options that
    # you can specify using this parameter, and their base monthly cost.</p>
    @[Protocol::Field(location: :body, name: "power", required: true)]
    property power : String
    # <p>The scale specification for the container service.</p>
    # 
    # <p>The scale specifies the allocated compute nodes of the container service. The
    # <code>power</code> and <code>scale</code> of a container service makes up its configured
    # capacity. To determine the monthly price of your container service, multiply the base price of
    # the <code>power</code> with the <code>scale</code> (the number of nodes) of the
    # service.</p>
    @[Protocol::Field(location: :body, name: "scale", required: true)]
    property scale : Int32
    # <p>The tag keys and optional values for the container service.</p>
    # 
    # <p>For more information about tags in Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>The public domain names to use with the container service, such as
    # <code>example.com</code> and <code>www.example.com</code>.</p>
    # 
    # <p>You can specify up to four public domain names for a container service. The domain names
    # that you specify are used when you create a deployment with a container configured as the
    # public endpoint of your container service.</p>
    # 
    # <p>If you don't specify public domain names, then you can use the default domain of the
    # container service.</p>
    # 
    # <important>
    # <p>You must create and validate an SSL/TLS certificate before you can use public domain
    # names with your container service. Use the <code>CreateCertificate</code> action to create a
    # certificate for the public domain names you want to use with your container service.</p>
    # </important>
    # 
    # <p>You can specify public domain names using a string to array map as shown in the example
    # later on this page.</p>
    @[Protocol::Field(location: :body, name: "publicDomainNames", required: false)]
    property public_domain_names : Hash(String, Array(String))?
    # <p>An object that describes a deployment for the container service.</p>
    # 
    # <p>A deployment specifies the containers that will be launched on the container service and
    # their settings, such as the ports to open, the environment variables to apply, and the launch
    # command to run. It also specifies the container that will serve as the public endpoint of the
    # deployment and its settings, such as the HTTP or HTTPS port to use, and the health check
    # configuration.</p>
    @[Protocol::Field(location: :body, name: "deployment", required: false)]
    property deployment : ContainerServiceDeploymentRequest?
  end

  class ContainerServiceEndpointStruct 
    include JSON1_1

    # <p>The name of the container entry of the deployment that the endpoint configuration applies
    # to.</p>
    @[Protocol::Field(location: :body, name: "containerName", required: false)]
    property container_name : String?
    # <p>The port of the specified container to which traffic is forwarded to.</p>
    @[Protocol::Field(location: :body, name: "containerPort", required: false)]
    property container_port : Int32?
    # <p>An object that describes the health check configuration of the container.</p>
    @[Protocol::Field(location: :body, name: "healthCheck", required: false)]
    property health_check : ContainerServiceHealthCheckConfigStruct?
  end

  class ContainerServiceDeploymentStruct 
    include JSON1_1

    # <p>The version number of the deployment.</p>
    @[Protocol::Field(location: :body, name: "version", required: false)]
    property version : Int32?
    # <p>The state of the deployment.</p>
    # 
    # <p>A deployment can be in one of the following states:</p>
    # <ul>
    # <li>
    # <p>
    # <code>Activating</code> - The deployment is being created.</p>
    # </li>
    # <li>
    # <p>
    # <code>Active</code> - The deployment was successfully created, and it's currently
    # running on the container service. The container service can have only one deployment in an
    # active state at a time.</p>
    # </li>
    # <li>
    # <p>
    # <code>Inactive</code> - The deployment was previously successfully created, but it is
    # not currently running on the container service.</p>
    # </li>
    # <li>
    # <p>
    # <code>Failed</code> - The deployment failed. Use the <code>GetContainerLog</code>
    # action to view the log events for the containers in the deployment to try to determine the
    # reason for the failure.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
    # <p>An object that describes the configuration for the containers of the deployment.</p>
    @[Protocol::Field(location: :body, name: "containers", required: false)]
    property containers : Hash(String, ContainerStruct)?
    # <p>An object that describes the endpoint of the deployment.</p>
    @[Protocol::Field(location: :body, name: "publicEndpoint", required: false)]
    property public_endpoint : ContainerServiceEndpointStruct?
    # <p>The timestamp when the deployment was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
  end

  class ContainerServiceStruct 
    include JSON1_1

    # <p>The name of the container service.</p>
    @[Protocol::Field(location: :body, name: "containerServiceName", required: false)]
    property container_service_name : String?
    # <p>The Amazon Resource Name (ARN) of the container service.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The timestamp when the container service was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>An object that describes the location of the container service, such as the AWS Region
    # and Availability Zone.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The Lightsail resource type of the container service (i.e.,
    # <code>ContainerService</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>The power specification of the container service.</p>
    # 
    # <p>The power specifies the amount of RAM, the number of vCPUs, and the base price of the
    # container service.</p>
    @[Protocol::Field(location: :body, name: "power", required: false)]
    property power : String?
    # <p>The ID of the power of the container service.</p>
    @[Protocol::Field(location: :body, name: "powerId", required: false)]
    property power_id : String?
    # <p>The current state of the container service.</p>
    # <p>The state can be:</p>
    # <ul>
    # <li>
    # <p>
    # <code>Pending</code> - The container service is being created.</p>
    # </li>
    # <li>
    # <p>
    # <code>Ready</code> - The container service is created but does not have a container
    # deployment.</p>
    # </li>
    # <li>
    # <p>
    # <code>Disabled</code> - The container service is disabled.</p>
    # </li>
    # <li>
    # <p>
    # <code>Updating</code> - The container service capacity or other setting is being
    # updated.</p>
    # </li>
    # <li>
    # <p>
    # <code>Deploying</code> - The container service is launching a container
    # deployment.</p>
    # </li>
    # <li>
    # <p>
    # <code>Running</code> - The container service is created and it has a container
    # deployment.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
    # <p>The scale specification of the container service.</p>
    # 
    # <p>The scale specifies the allocated compute nodes of the container service.</p>
    @[Protocol::Field(location: :body, name: "scale", required: false)]
    property scale : Int32?
    # <p>An object that describes the current container deployment of the container service.</p>
    @[Protocol::Field(location: :body, name: "currentDeployment", required: false)]
    property current_deployment : ContainerServiceDeploymentStruct?
    # <p>An object that describes the next deployment of the container service.</p>
    # 
    # <p>This value is <code>null</code> when there is no deployment in a <code>pending</code>
    # state.</p>
    @[Protocol::Field(location: :body, name: "nextDeployment", required: false)]
    property next_deployment : ContainerServiceDeploymentStruct?
    # <p>A Boolean value indicating whether the container service is disabled.</p>
    @[Protocol::Field(location: :body, name: "isDisabled", required: false)]
    property is_disabled : Bool?
    # <p>The principal ARN of the container service.</p>
    # 
    # <p>The principal ARN can be used to create a trust relationship between your standard AWS
    # account and your Lightsail container service. This allows you to give your service
    # permission to access resources in your standard AWS account.</p>
    @[Protocol::Field(location: :body, name: "principalArn", required: false)]
    property principal_arn : String?
    # <p>The private domain name of the container service.</p>
    # 
    # <p>The private domain name is accessible only by other resources within the default virtual
    # private cloud (VPC) of your Lightsail account.</p>
    @[Protocol::Field(location: :body, name: "privateDomainName", required: false)]
    property private_domain_name : String?
    # <p>The public domain name of the container service, such as <code>example.com</code> and
    # <code>www.example.com</code>.</p>
    # 
    # <p>You can specify up to four public domain names for a container service. The domain names
    # that you specify are used when you create a deployment with a container configured as the
    # public endpoint of your container service.</p>
    # 
    # <p>If you don't specify public domain names, then you can use the default domain of the
    # container service.</p>
    # 
    # <important>
    # <p>You must create and validate an SSL/TLS certificate before you can use public domain
    # names with your container service. Use the <code>CreateCertificate</code> action to create a
    # certificate for the public domain names you want to use with your container service.</p>
    # </important>
    # 
    # <p>See <code>CreateContainerService</code> or <code>UpdateContainerService</code> for
    # information about how to specify public domain names for your Lightsail container
    # service.</p>
    @[Protocol::Field(location: :body, name: "publicDomainNames", required: false)]
    property public_domain_names : Hash(String, Array(String))?
    # <p>The publicly accessible URL of the container service.</p>
    # 
    # <p>If no public endpoint is specified in the <code>currentDeployment</code>, this URL returns
    # a 404 response.</p>
    @[Protocol::Field(location: :body, name: "url", required: false)]
    property url : String?
  end

  class CreateContainerServiceResultStruct 
    include JSON1_1

    # <p>An object that describes a container service.</p>
    @[Protocol::Field(location: :body, name: "containerService", required: false)]
    property container_service : ContainerServiceStruct?
  end

  class CreateContainerServiceDeploymentRequest 
    include JSON1_1

    # <p>The name of the container service for which to create the deployment.</p>
    @[Protocol::Field(location: :uri, name: "serviceName", required: true)]
    property service_name : String
    # <p>An object that describes the settings of the containers that will be launched on the
    # container service.</p>
    @[Protocol::Field(location: :body, name: "containers", required: false)]
    property containers : Hash(String, ContainerStruct)?
    # <p>An object that describes the settings of the public endpoint for the container
    # service.</p>
    @[Protocol::Field(location: :body, name: "publicEndpoint", required: false)]
    property public_endpoint : EndpointRequest?
  end

  class CreateContainerServiceDeploymentResultStruct 
    include JSON1_1

    # <p>An object that describes a container service.</p>
    @[Protocol::Field(location: :body, name: "containerService", required: false)]
    property container_service : ContainerServiceStruct?
  end

  class CreateContainerServiceRegistryLoginRequest 
    include JSON1_1

  end

  class ContainerServiceRegistryLoginStruct 
    include JSON1_1

    # <p>The container service registry username to use to push container images to the container
    # image registry of a Lightsail account.</p>
    @[Protocol::Field(location: :body, name: "username", required: false)]
    property username : String?
    # <p>The container service registry password to use to push container images to the container
    # image registry of a Lightsail account</p>
    @[Protocol::Field(location: :body, name: "password", required: false)]
    property password : String?
    # <p>The timestamp of when the container image registry username and password expire.</p>
    # 
    # <p>The log in credentials expire 12 hours after they are created, at which point you will
    # need to create a new set of log in credentials using the
    # <code>CreateContainerServiceRegistryLogin</code> action.</p>
    @[Protocol::Field(location: :body, name: "expiresAt", required: false)]
    property expires_at : Time?
    # <p>The address to use to push container images to the container image registry of a
    # Lightsail account.</p>
    @[Protocol::Field(location: :body, name: "registry", required: false)]
    property registry : String?
  end

  class CreateContainerServiceRegistryLoginResultStruct 
    include JSON1_1

    # <p>An object that describes the log in information for the container service registry of your
    # Lightsail account.</p>
    @[Protocol::Field(location: :body, name: "registryLogin", required: false)]
    property registry_login : ContainerServiceRegistryLoginStruct?
  end

  class AutoSnapshotAddOnRequest 
    include JSON1_1

    # <p>The daily time when an automatic snapshot will be created.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must be in <code>HH:00</code> format, and in an hourly increment.</p>
    # </li>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>The snapshot will be automatically created between the time specified and up to 45
    # minutes after.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "snapshotTimeOfDay", required: false)]
    property snapshot_time_of_day : String?
  end

  class AddOnRequest 
    include JSON1_1

    # <p>The add-on type.</p>
    @[Protocol::Field(location: :body, name: "addOnType", required: true)]
    property add_on_type : String
    # <p>An object that represents additional parameters when enabling or modifying the automatic
    # snapshot add-on.</p>
    @[Protocol::Field(location: :body, name: "autoSnapshotAddOnRequest", required: false)]
    property auto_snapshot_add_on_request : AutoSnapshotAddOnRequest?
  end

  class CreateDiskRequest 
    include JSON1_1

    # <p>The unique Lightsail disk name (e.g., <code>my-disk</code>).</p>
    @[Protocol::Field(location: :body, name: "diskName", required: true)]
    property disk_name : String
    # <p>The Availability Zone where you want to create the disk (e.g., <code>us-east-2a</code>).
    # Use the same Availability Zone as the Lightsail instance to which you want to attach the
    # disk.</p>
    # <p>Use the <code>get regions</code> operation to list the Availability Zones where
    # Lightsail is currently available.</p>
    @[Protocol::Field(location: :body, name: "availabilityZone", required: true)]
    property availability_zone : String
    # <p>The size of the disk in GB (e.g., <code>32</code>).</p>
    @[Protocol::Field(location: :body, name: "sizeInGb", required: true)]
    property size_in_gb : Int32
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>An array of objects that represent the add-ons to enable for the new disk.</p>
    @[Protocol::Field(location: :body, name: "addOns", required: false)]
    property add_ons : Array(AddOnRequest)?
  end

  class CreateDiskResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class CreateDiskFromSnapshotRequest 
    include JSON1_1

    # <p>The unique Lightsail disk name (e.g., <code>my-disk</code>).</p>
    @[Protocol::Field(location: :body, name: "diskName", required: true)]
    property disk_name : String
    # <p>The name of the disk snapshot (e.g., <code>my-snapshot</code>) from which to create the
    # new storage disk.</p>
    # <p>Constraint:</p>
    # <ul>
    # <li>
    # <p>This parameter cannot be defined together with the <code>source disk name</code>
    # parameter. The <code>disk snapshot name</code> and <code>source disk name</code>
    # parameters are mutually exclusive.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "diskSnapshotName", required: false)]
    property disk_snapshot_name : String?
    # <p>The Availability Zone where you want to create the disk (e.g., <code>us-east-2a</code>).
    # Choose the same Availability Zone as the Lightsail instance where you want to create the
    # disk.</p>
    # <p>Use the GetRegions operation to list the Availability Zones where Lightsail is currently
    # available.</p>
    @[Protocol::Field(location: :body, name: "availabilityZone", required: true)]
    property availability_zone : String
    # <p>The size of the disk in GB (e.g., <code>32</code>).</p>
    @[Protocol::Field(location: :body, name: "sizeInGb", required: true)]
    property size_in_gb : Int32
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>An array of objects that represent the add-ons to enable for the new disk.</p>
    @[Protocol::Field(location: :body, name: "addOns", required: false)]
    property add_ons : Array(AddOnRequest)?
    # <p>The name of the source disk from which the source automatic snapshot was created.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>This parameter cannot be defined together with the <code>disk snapshot name</code>
    # parameter. The <code>source disk name</code> and <code>disk snapshot name</code>
    # parameters are mutually exclusive.</p>
    # </li>
    # <li>
    # <p>Define this parameter only when creating a new disk from an automatic snapshot. For
    # more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "sourceDiskName", required: false)]
    property source_disk_name : String?
    # <p>The date of the automatic snapshot to use for the new disk. Use the <code>get auto
    # snapshots</code> operation to identify the dates of the available automatic
    # snapshots.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must be specified in <code>YYYY-MM-DD</code> format.</p>
    # </li>
    # <li>
    # <p>This parameter cannot be defined together with the <code>use latest restorable auto
    # snapshot</code> parameter. The <code>restore date</code> and <code>use latest restorable
    # auto snapshot</code> parameters are mutually exclusive.</p>
    # </li>
    # <li>
    # <p>Define this parameter only when creating a new disk from an automatic snapshot. For
    # more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "restoreDate", required: false)]
    property restore_date : String?
    # <p>A Boolean value to indicate whether to use the latest available automatic snapshot.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>This parameter cannot be defined together with the <code>restore date</code>
    # parameter. The <code>use latest restorable auto snapshot</code> and <code>restore
    # date</code> parameters are mutually exclusive.</p>
    # </li>
    # <li>
    # <p>Define this parameter only when creating a new disk from an automatic snapshot. For
    # more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "useLatestRestorableAutoSnapshot", required: false)]
    property use_latest_restorable_auto_snapshot : Bool?
  end

  class CreateDiskFromSnapshotResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class CreateDiskSnapshotRequest 
    include JSON1_1

    # <p>The unique name of the source disk (e.g., <code>Disk-Virginia-1</code>).</p>
    # <note>
    # <p>This parameter cannot be defined together with the <code>instance name</code> parameter.
    # The <code>disk name</code> and <code>instance name</code> parameters are mutually
    # exclusive.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "diskName", required: false)]
    property disk_name : String?
    # <p>The name of the destination disk snapshot (e.g., <code>my-disk-snapshot</code>) based on
    # the source disk.</p>
    @[Protocol::Field(location: :body, name: "diskSnapshotName", required: true)]
    property disk_snapshot_name : String
    # <p>The unique name of the source instance (e.g., <code>Amazon_Linux-512MB-Virginia-1</code>).
    # When this is defined, a snapshot of the instance's system volume is created.</p>
    # <note>
    # <p>This parameter cannot be defined together with the <code>disk name</code> parameter. The
    # <code>instance name</code> and <code>disk name</code> parameters are mutually
    # exclusive.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "instanceName", required: false)]
    property instance_name : String?
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class CreateDiskSnapshotResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class InputOriginStruct 
    include JSON1_1

    # <p>The name of the origin resource.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The AWS Region name of the origin resource.</p>
    @[Protocol::Field(location: :body, name: "regionName", required: false)]
    property region_name : String?
    # <p>The protocol that your Amazon Lightsail distribution uses when establishing a connection
    # with your origin to pull content.</p>
    @[Protocol::Field(location: :body, name: "protocolPolicy", required: false)]
    property protocol_policy : String?
  end

  class CacheBehaviorStruct 
    include JSON1_1

    # <p>The cache behavior of the distribution.</p>
    # <p>The following cache behaviors can be specified:</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>cache</code>
    # </b> - This option is best for static
    # sites. When specified, your distribution caches and serves your entire website as static
    # content. This behavior is ideal for websites with static content that doesn't change
    # depending on who views it, or for websites that don't use cookies, headers, or query
    # strings to personalize content.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>dont-cache</code>
    # </b> - This option is best for
    # sites that serve a mix of static and dynamic content. When specified, your distribution
    # caches and serve only the content that is specified in the distribution's
    # <code>CacheBehaviorPerPath</code> parameter. This behavior is ideal for websites or web
    # applications that use cookies, headers, and query strings to personalize content for
    # individual users.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "behavior", required: false)]
    property behavior : String?
  end

  class CookieObjectStruct 
    include JSON1_1

    # <p>Specifies which cookies to forward to the distribution's origin for a cache behavior:
    # <code>all</code>, <code>none</code>, or <code>allow-list</code> to forward only the cookies
    # specified in the <code>cookiesAllowList</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "option", required: false)]
    property option : String?
    # <p>The specific cookies to forward to your distribution's origin.</p>
    @[Protocol::Field(location: :body, name: "cookiesAllowList", required: false)]
    property cookies_allow_list : Array(String)?
  end

  class HeaderObjectStruct 
    include JSON1_1

    # <p>The headers that you want your distribution to forward to your origin and base caching
    # on.</p>
    # <p>You can configure your distribution to do one of the following:</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>all</code>
    # </b> - Forward all headers to your
    # origin.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>none</code>
    # </b> - Forward only the default
    # headers.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>allow-list</code>
    # </b> - Forward only the headers
    # you specify using the <code>headersAllowList</code> parameter.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "option", required: false)]
    property option : String?
    # <p>The specific headers to forward to your distribution's origin.</p>
    @[Protocol::Field(location: :body, name: "headersAllowList", required: false)]
    property headers_allow_list : Array(String)?
  end

  class QueryStringObjectStruct 
    include JSON1_1

    # <p>Indicates whether the distribution forwards and caches based on query strings.</p>
    @[Protocol::Field(location: :body, name: "option", required: false)]
    property option : Bool?
    # <p>The specific query strings that the distribution forwards to the origin.</p>
    # <p>Your distribution will cache content based on the specified query strings.</p>
    # <p>If the <code>option</code> parameter is true, then your distribution forwards all query
    # strings, regardless of what you specify using the <code>queryStringsAllowList</code>
    # parameter.</p>
    @[Protocol::Field(location: :body, name: "queryStringsAllowList", required: false)]
    property query_strings_allow_list : Array(String)?
  end

  class CacheSettingsStruct 
    include JSON1_1

    # <p>The default amount of time that objects stay in the distribution's cache before the
    # distribution forwards another request to the origin to determine whether the content has been
    # updated.</p>
    # <note>
    # <p>The value specified applies only when the origin does not add HTTP headers such as
    # <code>Cache-Control max-age</code>, <code>Cache-Control s-maxage</code>, and
    # <code>Expires</code> to objects.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "defaultTTL", required: false)]
    property default_ttl : Int64?
    # <p>The minimum amount of time that objects stay in the distribution's cache before the
    # distribution forwards another request to the origin to determine whether the object has been
    # updated.</p>
    # <p>A value of <code>0</code> must be specified for <code>minimumTTL</code> if the
    # distribution is configured to forward all headers to the origin.</p>
    @[Protocol::Field(location: :body, name: "minimumTTL", required: false)]
    property minimum_ttl : Int64?
    # <p>The maximum amount of time that objects stay in the distribution's cache before the
    # distribution forwards another request to the origin to determine whether the object has been
    # updated.</p>
    # <p>The value specified applies only when the origin adds HTTP headers such as
    # <code>Cache-Control max-age</code>, <code>Cache-Control s-maxage</code>, and
    # <code>Expires</code> to objects.</p>
    @[Protocol::Field(location: :body, name: "maximumTTL", required: false)]
    property maximum_ttl : Int64?
    # <p>The HTTP methods that are processed and forwarded to the distribution's origin.</p>
    # <p>You can specify the following options:</p>
    # <ul>
    # <li>
    # <p>
    # <code>GET,HEAD</code> - The distribution forwards the <code>GET</code> and
    # <code>HEAD</code> methods.</p>
    # </li>
    # <li>
    # <p>
    # <code>GET,HEAD,OPTIONS</code> - The distribution forwards the <code>GET</code>,
    # <code>HEAD</code>, and <code>OPTIONS</code> methods.</p>
    # </li>
    # <li>
    # <p>
    # <code>GET,HEAD,OPTIONS,PUT,PATCH,POST,DELETE</code> - The distribution forwards the
    # <code>GET</code>, <code>HEAD</code>, <code>OPTIONS</code>, <code>PUT</code>,
    # <code>PATCH</code>, <code>POST</code>, and <code>DELETE</code> methods.</p>
    # </li>
    # </ul>
    # <p>If you specify the third option, you might need to restrict access to your distribution's
    # origin so users can't perform operations that you don't want them to. For example, you might
    # not want users to have permission to delete objects from your origin.</p>
    @[Protocol::Field(location: :body, name: "allowedHTTPMethods", required: false)]
    property allowed_http_methods : String?
    # <p>The HTTP method responses that are cached by your distribution.</p>
    # <p>You can specify the following options:</p>
    # <ul>
    # <li>
    # <p>
    # <code>GET,HEAD</code> - The distribution caches responses to the <code>GET</code> and
    # <code>HEAD</code> methods.</p>
    # </li>
    # <li>
    # <p>
    # <code>GET,HEAD,OPTIONS</code> - The distribution caches responses to the
    # <code>GET</code>, <code>HEAD</code>, and <code>OPTIONS</code> methods.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "cachedHTTPMethods", required: false)]
    property cached_http_methods : String?
    # <p>An object that describes the cookies that are forwarded to the origin. Your content is
    # cached based on the cookies that are forwarded.</p>
    @[Protocol::Field(location: :body, name: "forwardedCookies", required: false)]
    property forwarded_cookies : CookieObjectStruct?
    # <p>An object that describes the headers that are forwarded to the origin. Your content is
    # cached based on the headers that are forwarded.</p>
    @[Protocol::Field(location: :body, name: "forwardedHeaders", required: false)]
    property forwarded_headers : HeaderObjectStruct?
    # <p>An object that describes the query strings that are forwarded to the origin. Your content
    # is cached based on the query strings that are forwarded.</p>
    @[Protocol::Field(location: :body, name: "forwardedQueryStrings", required: false)]
    property forwarded_query_strings : QueryStringObjectStruct?
  end

  class CacheBehaviorPerPathStruct 
    include JSON1_1

    # <p>The path to a directory or file to cached, or not cache. Use an asterisk symbol to specify
    # wildcard directories (<code>path/to/assets/*</code>), and file types (<code>*.html, *jpg,
    # *js</code>). Directories and file paths are case-sensitive.</p>
    # <p>Examples:</p>
    # <ul>
    # <li>
    # <p>Specify the following to cache all files in the document root of an Apache web server
    # running on a Lightsail instance.</p>
    # <p>
    # <code>var/www/html/</code>
    # </p>
    # </li>
    # <li>
    # <p>Specify the following file to cache only the index page in the document root of an
    # Apache web server.</p>
    # <p>
    # <code>var/www/html/index.html</code>
    # </p>
    # </li>
    # <li>
    # <p>Specify the following to cache only the .html files in the document root of an Apache
    # web server.</p>
    # <p>
    # <code>var/www/html/*.html</code>
    # </p>
    # </li>
    # <li>
    # <p>Specify the following to cache only the .jpg, .png, and .gif files in the images
    # sub-directory of the document root of an Apache web server.</p>
    # <p>
    # <code>var/www/html/images/*.jpg</code>
    # </p>
    # <p>
    # <code>var/www/html/images/*.png</code>
    # </p>
    # <p>
    # <code>var/www/html/images/*.gif</code>
    # </p>
    # <p>Specify the following to cache all files in the images sub-directory of the document
    # root of an Apache web server.</p>
    # <p>
    # <code>var/www/html/images/</code>
    # </p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "path", required: false)]
    property path : String?
    # <p>The cache behavior for the specified path.</p>
    # <p>You can specify one of the following per-path cache behaviors:</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>cache</code>
    # </b> - This behavior caches the
    # specified path.
    # </p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>dont-cache</code>
    # </b> - This behavior doesn't cache
    # the specified path.
    # </p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "behavior", required: false)]
    property behavior : String?
  end

  class CreateDistributionRequest 
    include JSON1_1

    # <p>The name for the distribution.</p>
    @[Protocol::Field(location: :body, name: "distributionName", required: true)]
    property distribution_name : String
    # <p>An object that describes the origin resource for the distribution, such as a Lightsail
    # instance or load balancer.</p>
    # <p>The distribution pulls, caches, and serves content from the origin.</p>
    @[Protocol::Field(location: :body, name: "origin", required: true)]
    property origin : InputOriginStruct
    # <p>An object that describes the default cache behavior for the distribution.</p>
    @[Protocol::Field(location: :body, name: "defaultCacheBehavior", required: true)]
    property default_cache_behavior : CacheBehaviorStruct
    # <p>An object that describes the cache behavior settings for the distribution.</p>
    @[Protocol::Field(location: :body, name: "cacheBehaviorSettings", required: false)]
    property cache_behavior_settings : CacheSettingsStruct?
    # <p>An array of objects that describe the per-path cache behavior for the distribution.</p>
    @[Protocol::Field(location: :body, name: "cacheBehaviors", required: false)]
    property cache_behaviors : Array(CacheBehaviorPerPathStruct)?
    # <p>The bundle ID to use for the distribution.</p>
    # <p>A distribution bundle describes the specifications of your distribution, such as the
    # monthly cost and monthly network transfer quota.</p>
    # <p>Use the <code>GetDistributionBundles</code> action to get a list of distribution bundle
    # IDs that you can specify.</p>
    @[Protocol::Field(location: :body, name: "bundleId", required: true)]
    property bundle_id : String
    # <p>The tag keys and optional values to add to the distribution during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class OriginStruct 
    include JSON1_1

    # <p>The name of the origin resource.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The resource type of the origin resource (e.g., <i>Instance</i>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The AWS Region name of the origin resource.</p>
    @[Protocol::Field(location: :body, name: "regionName", required: false)]
    property region_name : String?
    # <p>The protocol that your Amazon Lightsail distribution uses when establishing a connection
    # with your origin to pull content.</p>
    @[Protocol::Field(location: :body, name: "protocolPolicy", required: false)]
    property protocol_policy : String?
  end

  class LightsailDistributionStruct 
    include JSON1_1

    # <p>The name of the distribution.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the distribution.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The support code. Include this code in your email to support when you have questions about
    # your Lightsail distribution. This code enables our support team to look up your Lightsail
    # information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>The timestamp when the distribution was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>An object that describes the location of the distribution, such as the AWS Region and
    # Availability Zone.</p>
    # <note>
    # <p>Lightsail distributions are global resources that can reference an origin in any AWS
    # Region, and distribute its content globally. However, all distributions are located in the
    # <code>us-east-1</code> Region.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The Lightsail resource type (e.g., <code>Distribution</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The alternate domain names of the distribution.</p>
    @[Protocol::Field(location: :body, name: "alternativeDomainNames", required: false)]
    property alternative_domain_names : Array(String)?
    # <p>The status of the distribution.</p>
    @[Protocol::Field(location: :body, name: "status", required: false)]
    property status : String?
    # <p>Indicates whether the distribution is enabled.</p>
    @[Protocol::Field(location: :body, name: "isEnabled", required: false)]
    property is_enabled : Bool?
    # <p>The domain name of the distribution.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: false)]
    property domain_name : String?
    # <p>The ID of the bundle currently applied to the distribution.</p>
    @[Protocol::Field(location: :body, name: "bundleId", required: false)]
    property bundle_id : String?
    # <p>The name of the SSL/TLS certificate attached to the distribution, if any.</p>
    @[Protocol::Field(location: :body, name: "certificateName", required: false)]
    property certificate_name : String?
    # <p>An object that describes the origin resource of the distribution, such as a Lightsail
    # instance or load balancer.</p>
    # <p>The distribution pulls, caches, and serves content from the origin.</p>
    @[Protocol::Field(location: :body, name: "origin", required: false)]
    property origin : OriginStruct?
    # <p>The public DNS of the origin.</p>
    @[Protocol::Field(location: :body, name: "originPublicDNS", required: false)]
    property origin_public_dns : String?
    # <p>An object that describes the default cache behavior of the distribution.</p>
    @[Protocol::Field(location: :body, name: "defaultCacheBehavior", required: false)]
    property default_cache_behavior : CacheBehaviorStruct?
    # <p>An object that describes the cache behavior settings of the distribution.</p>
    @[Protocol::Field(location: :body, name: "cacheBehaviorSettings", required: false)]
    property cache_behavior_settings : CacheSettingsStruct?
    # <p>An array of objects that describe the per-path cache behavior of the distribution.</p>
    @[Protocol::Field(location: :body, name: "cacheBehaviors", required: false)]
    property cache_behaviors : Array(CacheBehaviorPerPathStruct)?
    # <p>Indicates whether the bundle that is currently applied to your distribution, specified
    # using the <code>distributionName</code> parameter, can be changed to another bundle.</p>
    # <p>Use the <code>UpdateDistributionBundle</code> action to change your distribution's
    # bundle.</p>
    @[Protocol::Field(location: :body, name: "ableToUpdateBundle", required: false)]
    property able_to_update_bundle : Bool?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class CreateDistributionResultStruct 
    include JSON1_1

    # <p>An object that describes the distribution created.</p>
    @[Protocol::Field(location: :body, name: "distribution", required: false)]
    property distribution : LightsailDistributionStruct?
    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class CreateDomainRequest 
    include JSON1_1

    # <p>The domain name to manage (e.g., <code>example.com</code>).</p>
    # <note>
    # <p>You cannot register a new domain name using Lightsail. You must register a domain name
    # using Amazon Route 53 or another domain name registrar. If you have already registered your
    # domain, you can enter its name in this parameter to manage the DNS records for that
    # domain.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "domainName", required: true)]
    property domain_name : String
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class CreateDomainResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class DomainEntryStruct 
    include JSON1_1

    # <p>The ID of the domain recordset entry.</p>
    @[Protocol::Field(location: :body, name: "id", required: false)]
    property id : String?
    # <p>The name of the domain.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The target AWS name server (e.g., <code>ns-111.awsdns-22.com.</code>).</p>
    # <p>For Lightsail load balancers, the value looks like
    # <code>ab1234c56789c6b86aba6fb203d443bc-123456789.us-east-2.elb.amazonaws.com</code>. Be sure
    # to also set <code>isAlias</code> to <code>true</code> when setting up an A record for a load
    # balancer.</p>
    @[Protocol::Field(location: :body, name: "target", required: false)]
    property target : String?
    # <p>When <code>true</code>, specifies whether the domain entry is an alias used by the
    # Lightsail load balancer. You can include an alias (A type) record in your request, which
    # points to a load balancer DNS name and routes traffic to your load balancer.</p>
    @[Protocol::Field(location: :body, name: "isAlias", required: false)]
    property is_alias : Bool?
    # <p>The type of domain entry, such as address (A), canonical name (CNAME), mail exchanger
    # (MX), name server (NS), start of authority (SOA), service locator (SRV), or text (TXT).</p>
    # <p>The following domain entry types can be used:</p>
    # <ul>
    # <li>
    # <p>
    # <code>A</code>
    # </p>
    # </li>
    # <li>
    # <p>
    # <code>CNAME</code>
    # </p>
    # </li>
    # <li>
    # <p>
    # <code>MX</code>
    # </p>
    # </li>
    # <li>
    # <p>
    # <code>NS</code>
    # </p>
    # </li>
    # <li>
    # <p>
    # <code>SOA</code>
    # </p>
    # </li>
    # <li>
    # <p>
    # <code>SRV</code>
    # </p>
    # </li>
    # <li>
    # <p>
    # <code>TXT</code>
    # </p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "type", required: false)]
    property type : String?
    # <p>(Deprecated) The options for the domain entry.</p>
    # <note>
    # <p>In releases prior to November 29, 2017, this parameter was not included in the API
    # response. It is now deprecated.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "options", required: false)]
    property options : Hash(String, String)?
  end

  class CreateDomainEntryRequest 
    include JSON1_1

    # <p>The domain name (e.g., <code>example.com</code>) for which you want to create the domain
    # entry.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: true)]
    property domain_name : String
    # <p>An array of key-value pairs containing information about the domain entry request.</p>
    @[Protocol::Field(location: :body, name: "domainEntry", required: true)]
    property domain_entry : DomainEntryStruct
  end

  class CreateDomainEntryResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class CreateInstancesRequest 
    include JSON1_1

    # <p>The names to use for your new Lightsail instances. Separate multiple values using
    # quotation marks and commas, for example:
    # <code>["MyFirstInstance","MySecondInstance"]</code>
    # </p>
    @[Protocol::Field(location: :body, name: "instanceNames", required: true)]
    property instance_names : Array(String)
    # <p>The Availability Zone in which to create your instance. Use the following format:
    # <code>us-east-2a</code> (case sensitive). You can get a list of Availability Zones by using
    # the <a href="http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html">get
    # regions</a> operation. Be sure to add the <code>include Availability Zones</code>
    # parameter to your request.</p>
    @[Protocol::Field(location: :body, name: "availabilityZone", required: true)]
    property availability_zone : String
    # <p>(Deprecated) The name for your custom image.</p>
    # <note>
    # <p>In releases prior to June 12, 2017, this parameter was ignored by the API. It is now
    # deprecated.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "customImageName", required: false)]
    property custom_image_name : String?
    # <p>The ID for a virtual private server image (e.g., <code>app_wordpress_4_4</code> or
    # <code>app_lamp_7_0</code>). Use the <code>get blueprints</code> operation to return a list
    # of available images (or <i>blueprints</i>).</p>
    # <note>
    # <p>Use active blueprints when creating new instances. Inactive blueprints are listed to
    # support customers with existing instances and are not necessarily available to create new
    # instances. Blueprints are marked inactive when they become outdated due to operating system
    # updates or new application releases.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "blueprintId", required: true)]
    property blueprint_id : String
    # <p>The bundle of specification information for your virtual private server (or
    # <i>instance</i>), including the pricing plan (e.g.,
    # <code>micro_1_0</code>).</p>
    @[Protocol::Field(location: :body, name: "bundleId", required: true)]
    property bundle_id : String
    # <p>A launch script you can create that configures a server with additional user data. For
    # example, you might want to run <code>apt-get -y update</code>.</p>
    # <note>
    # <p>Depending on the machine image you choose, the command to get software on your instance
    # varies. Amazon Linux and CentOS use <code>yum</code>, Debian and Ubuntu use
    # <code>apt-get</code>, and FreeBSD uses <code>pkg</code>. For a complete list, see the
    # <a href="https://lightsail.aws.amazon.com/ls/docs/getting-started/article/compare-options-choose-lightsail-instance-image">Dev Guide</a>.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "userData", required: false)]
    property user_data : String?
    # <p>The name of your key pair.</p>
    @[Protocol::Field(location: :body, name: "keyPairName", required: false)]
    property key_pair_name : String?
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>An array of objects representing the add-ons to enable for the new instance.</p>
    @[Protocol::Field(location: :body, name: "addOns", required: false)]
    property add_ons : Array(AddOnRequest)?
  end

  class CreateInstancesResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DiskMapStruct 
    include JSON1_1

    # <p>The original disk path exposed to the instance (for example,
    # <code>/dev/sdh</code>).</p>
    @[Protocol::Field(location: :body, name: "originalDiskPath", required: false)]
    property original_disk_path : String?
    # <p>The new disk name (e.g., <code>my-new-disk</code>).</p>
    @[Protocol::Field(location: :body, name: "newDiskName", required: false)]
    property new_disk_name : String?
  end

  class CreateInstancesFromSnapshotRequest 
    include JSON1_1

    # <p>The names for your new instances.</p>
    @[Protocol::Field(location: :body, name: "instanceNames", required: true)]
    property instance_names : Array(String)
    # <p>An object containing information about one or more disk mappings.</p>
    @[Protocol::Field(location: :body, name: "attachedDiskMapping", required: false)]
    property attached_disk_mapping : Hash(String, Array(DiskMapStruct))?
    # <p>The Availability Zone where you want to create your instances. Use the following
    # formatting: <code>us-east-2a</code> (case sensitive). You can get a list of Availability Zones
    # by using the <a href="http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html">get
    # regions</a> operation. Be sure to add the <code>include Availability Zones</code>
    # parameter to your request.</p>
    @[Protocol::Field(location: :body, name: "availabilityZone", required: true)]
    property availability_zone : String
    # <p>The name of the instance snapshot on which you are basing your new instances. Use the get
    # instance snapshots operation to return information about your existing snapshots.</p>
    # <p>Constraint:</p>
    # <ul>
    # <li>
    # <p>This parameter cannot be defined together with the <code>source instance name</code>
    # parameter. The <code>instance snapshot name</code> and <code>source instance name</code>
    # parameters are mutually exclusive.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "instanceSnapshotName", required: false)]
    property instance_snapshot_name : String?
    # <p>The bundle of specification information for your virtual private server (or
    # <i>instance</i>), including the pricing plan (e.g.,
    # <code>micro_1_0</code>).</p>
    @[Protocol::Field(location: :body, name: "bundleId", required: true)]
    property bundle_id : String
    # <p>You can create a launch script that configures a server with additional user data. For
    # example, <code>apt-get -y update</code>.</p>
    # <note>
    # <p>Depending on the machine image you choose, the command to get software on your instance
    # varies. Amazon Linux and CentOS use <code>yum</code>, Debian and Ubuntu use
    # <code>apt-get</code>, and FreeBSD uses <code>pkg</code>. For a complete list, see the
    # <a href="https://lightsail.aws.amazon.com/ls/docs/getting-started/article/compare-options-choose-lightsail-instance-image">Dev Guide</a>.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "userData", required: false)]
    property user_data : String?
    # <p>The name for your key pair.</p>
    @[Protocol::Field(location: :body, name: "keyPairName", required: false)]
    property key_pair_name : String?
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>An array of objects representing the add-ons to enable for the new instance.</p>
    @[Protocol::Field(location: :body, name: "addOns", required: false)]
    property add_ons : Array(AddOnRequest)?
    # <p>The name of the source instance from which the source automatic snapshot was
    # created.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>This parameter cannot be defined together with the <code>instance snapshot name</code>
    # parameter. The <code>source instance name</code> and <code>instance snapshot name</code>
    # parameters are mutually exclusive.</p>
    # </li>
    # <li>
    # <p>Define this parameter only when creating a new instance from an automatic snapshot.
    # For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "sourceInstanceName", required: false)]
    property source_instance_name : String?
    # <p>The date of the automatic snapshot to use for the new instance. Use the <code>get auto
    # snapshots</code> operation to identify the dates of the available automatic
    # snapshots.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must be specified in <code>YYYY-MM-DD</code> format.</p>
    # </li>
    # <li>
    # <p>This parameter cannot be defined together with the <code>use latest restorable auto
    # snapshot</code> parameter. The <code>restore date</code> and <code>use latest restorable
    # auto snapshot</code> parameters are mutually exclusive.</p>
    # </li>
    # <li>
    # <p>Define this parameter only when creating a new instance from an automatic snapshot.
    # For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "restoreDate", required: false)]
    property restore_date : String?
    # <p>A Boolean value to indicate whether to use the latest available automatic snapshot.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>This parameter cannot be defined together with the <code>restore date</code>
    # parameter. The <code>use latest restorable auto snapshot</code> and <code>restore
    # date</code> parameters are mutually exclusive.</p>
    # </li>
    # <li>
    # <p>Define this parameter only when creating a new instance from an automatic snapshot.
    # For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "useLatestRestorableAutoSnapshot", required: false)]
    property use_latest_restorable_auto_snapshot : Bool?
  end

  class CreateInstancesFromSnapshotResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class CreateInstanceSnapshotRequest 
    include JSON1_1

    # <p>The name for your new snapshot.</p>
    @[Protocol::Field(location: :body, name: "instanceSnapshotName", required: true)]
    property instance_snapshot_name : String
    # <p>The Lightsail instance on which to base your snapshot.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class CreateInstanceSnapshotResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class CreateKeyPairRequest 
    include JSON1_1

    # <p>The name for your new key pair.</p>
    @[Protocol::Field(location: :body, name: "keyPairName", required: true)]
    property key_pair_name : String
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class KeyPairStruct 
    include JSON1_1

    # <p>The friendly name of the SSH key pair.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the key pair (e.g.,
    # <code>arn:aws:lightsail:us-east-2:123456789101:KeyPair/05859e3d-331d-48ba-9034-12345EXAMPLE</code>).</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The support code. Include this code in your email to support when you have questions about
    # an instance or another resource in Lightsail. This code enables our support team to look up
    # your Lightsail information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>The timestamp when the key pair was created (e.g., <code>1479816991.349</code>).</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The region name and Availability Zone where the key pair was created.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The resource type (usually <code>KeyPair</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>The RSA fingerprint of the key pair.</p>
    @[Protocol::Field(location: :body, name: "fingerprint", required: false)]
    property fingerprint : String?
  end

  class CreateKeyPairResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about the new key pair you just
    # created.</p>
    @[Protocol::Field(location: :body, name: "keyPair", required: false)]
    property key_pair : KeyPairStruct?
    # <p>A base64-encoded public key of the <code>ssh-rsa</code> type.</p>
    @[Protocol::Field(location: :body, name: "publicKeyBase64", required: false)]
    property public_key_base64 : String?
    # <p>A base64-encoded RSA private key.</p>
    @[Protocol::Field(location: :body, name: "privateKeyBase64", required: false)]
    property private_key_base64 : String?
    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class CreateLoadBalancerRequest 
    include JSON1_1

    # <p>The name of your load balancer.</p>
    @[Protocol::Field(location: :body, name: "loadBalancerName", required: true)]
    property load_balancer_name : String
    # <p>The instance port where you're creating your load balancer.</p>
    @[Protocol::Field(location: :body, name: "instancePort", required: true)]
    property instance_port : Int32
    # <p>The path you provided to perform the load balancer health check. If you didn't specify a
    # health check path, Lightsail uses the root path of your website (e.g.,
    # <code>"/"</code>).</p>
    # <p>You may want to specify a custom health check path other than the root of your application
    # if your home page loads slowly or has a lot of media or scripting on it.</p>
    @[Protocol::Field(location: :body, name: "healthCheckPath", required: false)]
    property health_check_path : String?
    # <p>The name of the SSL/TLS certificate.</p>
    # <p>If you specify <code>certificateName</code>, then <code>certificateDomainName</code> is
    # required (and vice-versa).</p>
    @[Protocol::Field(location: :body, name: "certificateName", required: false)]
    property certificate_name : String?
    # <p>The domain name with which your certificate is associated (e.g.,
    # <code>example.com</code>).</p>
    # <p>If you specify <code>certificateDomainName</code>, then <code>certificateName</code> is
    # required (and vice-versa).</p>
    @[Protocol::Field(location: :body, name: "certificateDomainName", required: false)]
    property certificate_domain_name : String?
    # <p>The optional alternative domains and subdomains to use with your SSL/TLS certificate
    # (e.g., <code>www.example.com</code>, <code>example.com</code>, <code>m.example.com</code>,
    # <code>blog.example.com</code>).</p>
    @[Protocol::Field(location: :body, name: "certificateAlternativeNames", required: false)]
    property certificate_alternative_names : Array(String)?
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class CreateLoadBalancerResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class CreateLoadBalancerTlsCertificateRequest 
    include JSON1_1

    # <p>The load balancer name where you want to create the SSL/TLS certificate.</p>
    @[Protocol::Field(location: :body, name: "loadBalancerName", required: true)]
    property load_balancer_name : String
    # <p>The SSL/TLS certificate name.</p>
    # <p>You can have up to 10 certificates in your account at one time. Each Lightsail load
    # balancer can have up to 2 certificates associated with it at one time. There is also an
    # overall limit to the number of certificates that can be issue in a 365-day period. For more
    # information, see <a href="http://docs.aws.amazon.com/acm/latest/userguide/acm-limits.html">Limits</a>.</p>
    @[Protocol::Field(location: :body, name: "certificateName", required: true)]
    property certificate_name : String
    # <p>The domain name (e.g., <code>example.com</code>) for your SSL/TLS certificate.</p>
    @[Protocol::Field(location: :body, name: "certificateDomainName", required: true)]
    property certificate_domain_name : String
    # <p>An array of strings listing alternative domains and subdomains for your SSL/TLS
    # certificate. Lightsail will de-dupe the names for you. You can have a maximum of 9
    # alternative names (in addition to the 1 primary domain). We do not support wildcards (e.g.,
    # <code>*.example.com</code>).</p>
    @[Protocol::Field(location: :body, name: "certificateAlternativeNames", required: false)]
    property certificate_alternative_names : Array(String)?
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class CreateLoadBalancerTlsCertificateResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class CreateRelationalDatabaseRequest 
    include JSON1_1

    # <p>The name to use for your new database.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must contain from 2 to 255 alphanumeric characters, or hyphens.</p>
    # </li>
    # <li>
    # <p>The first and last character must be a letter or number.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
    # <p>The Availability Zone in which to create your new database. Use the
    # <code>us-east-2a</code> case-sensitive format.</p>
    # <p>You can get a list of Availability Zones by using the <code>get regions</code> operation.
    # Be sure to add the <code>include relational database Availability Zones</code> parameter to
    # your request.</p>
    @[Protocol::Field(location: :body, name: "availabilityZone", required: false)]
    property availability_zone : String?
    # <p>The blueprint ID for your new database. A blueprint describes the major engine version of
    # a database.</p>
    # <p>You can get a list of database blueprints IDs by using the <code>get relational database
    # blueprints</code> operation.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseBlueprintId", required: true)]
    property relational_database_blueprint_id : String
    # <p>The bundle ID for your new database. A bundle describes the performance specifications for
    # your database.</p>
    # <p>You can get a list of database bundle IDs by using the <code>get relational database
    # bundles</code> operation.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseBundleId", required: true)]
    property relational_database_bundle_id : String
    # <p>The name of the master database created when the Lightsail database resource is
    # created.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must contain from 1 to 64 alphanumeric characters.</p>
    # </li>
    # <li>
    # <p>Cannot be a word reserved by the specified database engine</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "masterDatabaseName", required: true)]
    property master_database_name : String
    # <p>The master user name for your new database.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Master user name is required.</p>
    # </li>
    # <li>
    # <p>Must contain from 1 to 16 alphanumeric characters.</p>
    # </li>
    # <li>
    # <p>The first character must be a letter.</p>
    # </li>
    # <li>
    # <p>Cannot be a reserved word for the database engine you choose.</p>
    # <p>For more information about reserved words in MySQL 5.6 or 5.7, see the Keywords and
    # Reserved Words articles for <a href="https://dev.mysql.com/doc/refman/5.6/en/keywords.html">MySQL 5.6</a> or <a href="https://dev.mysql.com/doc/refman/5.7/en/keywords.html">MySQL 5.7</a>
    # respectively.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "masterUsername", required: true)]
    property master_username : String
    # <p>The password for the master user of your new database. The password can include any
    # printable ASCII character except "/", """, or "@".</p>
    # <p>Constraints: Must contain 8 to 41 characters.</p>
    @[Protocol::Field(location: :body, name: "masterUserPassword", required: false)]
    property master_user_password : String?
    # <p>The daily time range during which automated backups are created for your new database if
    # automated backups are enabled.</p>
    # <p>The default is a 30-minute window selected at random from an 8-hour block of time for each
    # AWS Region. For more information about the preferred backup window time blocks for each
    # region, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow">Working With Backups</a> guide in the Amazon Relational Database Service (Amazon RDS) documentation.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must be in the <code>hh24:mi-hh24:mi</code> format.</p>
    # <p>Example: <code>16:00-16:30</code>
    # </p>
    # </li>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Must not conflict with the preferred maintenance window.</p>
    # </li>
    # <li>
    # <p>Must be at least 30 minutes.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "preferredBackupWindow", required: false)]
    property preferred_backup_window : String?
    # <p>The weekly time range during which system maintenance can occur on your new
    # database.</p>
    # <p>The default is a 30-minute window selected at random from an 8-hour block of time for each
    # AWS Region, occurring on a random day of the week.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must be in the <code>ddd:hh24:mi-ddd:hh24:mi</code> format.</p>
    # </li>
    # <li>
    # <p>Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.</p>
    # </li>
    # <li>
    # <p>Must be at least 30 minutes.</p>
    # </li>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Example: <code>Tue:17:00-Tue:17:30</code>
    # </p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "preferredMaintenanceWindow", required: false)]
    property preferred_maintenance_window : String?
    # <p>Specifies the accessibility options for your new database. A value of <code>true</code>
    # specifies a database that is available to resources outside of your Lightsail account. A
    # value of <code>false</code> specifies a database that is available only to your Lightsail
    # resources in the same region as your database.</p>
    @[Protocol::Field(location: :body, name: "publiclyAccessible", required: false)]
    property publicly_accessible : Bool?
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class CreateRelationalDatabaseResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class CreateRelationalDatabaseFromSnapshotRequest 
    include JSON1_1

    # <p>The name to use for your new database.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must contain from 2 to 255 alphanumeric characters, or hyphens.</p>
    # </li>
    # <li>
    # <p>The first and last character must be a letter or number.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
    # <p>The Availability Zone in which to create your new database. Use the
    # <code>us-east-2a</code> case-sensitive format.</p>
    # <p>You can get a list of Availability Zones by using the <code>get regions</code> operation.
    # Be sure to add the <code>include relational database Availability Zones</code> parameter to
    # your request.</p>
    @[Protocol::Field(location: :body, name: "availabilityZone", required: false)]
    property availability_zone : String?
    # <p>Specifies the accessibility options for your new database. A value of <code>true</code>
    # specifies a database that is available to resources outside of your Lightsail account. A
    # value of <code>false</code> specifies a database that is available only to your Lightsail
    # resources in the same region as your database.</p>
    @[Protocol::Field(location: :body, name: "publiclyAccessible", required: false)]
    property publicly_accessible : Bool?
    # <p>The name of the database snapshot from which to create your new database.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseSnapshotName", required: false)]
    property relational_database_snapshot_name : String?
    # <p>The bundle ID for your new database. A bundle describes the performance specifications for
    # your database.</p>
    # <p>You can get a list of database bundle IDs by using the <code>get relational database
    # bundles</code> operation.</p>
    # <p>When creating a new database from a snapshot, you cannot choose a bundle that is smaller
    # than the bundle of the source database.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseBundleId", required: false)]
    property relational_database_bundle_id : String?
    # <p>The name of the source database.</p>
    @[Protocol::Field(location: :body, name: "sourceRelationalDatabaseName", required: false)]
    property source_relational_database_name : String?
    # <p>The date and time to restore your database from.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must be before the latest restorable time for the database.</p>
    # </li>
    # <li>
    # <p>Cannot be specified if the <code>use latest restorable time</code> parameter is
    # <code>true</code>.</p>
    # </li>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Specified in the Unix time format.</p>
    # <p>For example, if you wish to use a restore time of October 1, 2018, at 8 PM UTC, then
    # you input <code>1538424000</code> as the restore time.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "restoreTime", required: false)]
    property restore_time : Time?
    # <p>Specifies whether your database is restored from the latest backup time. A value of
    # <code>true</code> restores from the latest backup time. </p>
    # <p>Default: <code>false</code>
    # </p>
    # <p>Constraints: Cannot be specified if the <code>restore time</code> parameter is
    # provided.</p>
    @[Protocol::Field(location: :body, name: "useLatestRestorableTime", required: false)]
    property use_latest_restorable_time : Bool?
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class CreateRelationalDatabaseFromSnapshotResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class CreateRelationalDatabaseSnapshotRequest 
    include JSON1_1

    # <p>The name of the database on which to base your new snapshot.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
    # <p>The name for your new database snapshot.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must contain from 2 to 255 alphanumeric characters, or hyphens.</p>
    # </li>
    # <li>
    # <p>The first and last character must be a letter or number.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "relationalDatabaseSnapshotName", required: true)]
    property relational_database_snapshot_name : String
    # <p>The tag keys and optional values to add to the resource during create.</p>
    # <p>Use the <code>TagResource</code> action to tag a resource after it's created.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
  end

  class CreateRelationalDatabaseSnapshotResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteAlarmRequest 
    include JSON1_1

    # <p>The name of the alarm to delete.</p>
    @[Protocol::Field(location: :body, name: "alarmName", required: true)]
    property alarm_name : String
  end

  class DeleteAlarmResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteAutoSnapshotRequest 
    include JSON1_1

    # <p>The name of the source instance or disk from which to delete the automatic
    # snapshot.</p>
    @[Protocol::Field(location: :body, name: "resourceName", required: true)]
    property resource_name : String
    # <p>The date of the automatic snapshot to delete in <code>YYYY-MM-DD</code> format. Use the
    # <code>get auto snapshots</code> operation to get the available automatic snapshots for a
    # resource.</p>
    @[Protocol::Field(location: :body, name: "date", required: true)]
    property date : String
  end

  class DeleteAutoSnapshotResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteCertificateRequest 
    include JSON1_1

    # <p>The name of the certificate to delete.</p>
    # <p>Use the <code>GetCertificates</code> action to get a list of certificate names that you
    # can specify.</p>
    @[Protocol::Field(location: :body, name: "certificateName", required: true)]
    property certificate_name : String
  end

  class DeleteCertificateResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteContactMethodRequest 
    include JSON1_1

    # <p>The protocol that will be deleted, such as <code>Email</code> or <code>SMS</code> (text
    # messaging).</p>
    # <note>
    # <p>To delete an <code>Email</code> and an <code>SMS</code> contact method if you added
    # both, you must run separate <code>DeleteContactMethod</code> actions to delete each
    # protocol.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "protocol", required: true)]
    property protocol : String
  end

  class DeleteContactMethodResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteContainerImageRequest 
    include JSON1_1

    # <p>The name of the container service for which to delete a registered container image.</p>
    @[Protocol::Field(location: :uri, name: "serviceName", required: true)]
    property service_name : String
    # <p>The name of the container image to delete from the container service.</p>
    # 
    # <p>Use the <code>GetContainerImages</code> action to get the name of the container images
    # that are registered to a container service.</p>
    # 
    # <note>
    # <p>Container images sourced from your Lightsail container service, that are registered
    # and stored on your service, start with a colon (<code>:</code>). For example,
    # <code>:container-service-1.mystaticwebsite.1</code>. Container images sourced from a
    # public registry like Docker Hub don't start with a colon. For example,
    # <code>nginx:latest</code> or <code>nginx</code>.</p>
    # </note>
    @[Protocol::Field(location: :uri, name: "image", required: true)]
    property image : String
  end

  class DeleteContainerImageResultStruct 
    include JSON1_1

  end

  class DeleteContainerServiceRequest 
    include JSON1_1

    # <p>The name of the container service to delete.</p>
    @[Protocol::Field(location: :uri, name: "serviceName", required: true)]
    property service_name : String
  end

  class DeleteContainerServiceResultStruct 
    include JSON1_1

  end

  class DeleteDiskRequest 
    include JSON1_1

    # <p>The unique name of the disk you want to delete (e.g., <code>my-disk</code>).</p>
    @[Protocol::Field(location: :body, name: "diskName", required: true)]
    property disk_name : String
    # <p>A Boolean value to indicate whether to delete the enabled add-ons for the disk.</p>
    @[Protocol::Field(location: :body, name: "forceDeleteAddOns", required: false)]
    property force_delete_add_ons : Bool?
  end

  class DeleteDiskResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteDiskSnapshotRequest 
    include JSON1_1

    # <p>The name of the disk snapshot you want to delete (e.g.,
    # <code>my-disk-snapshot</code>).</p>
    @[Protocol::Field(location: :body, name: "diskSnapshotName", required: true)]
    property disk_snapshot_name : String
  end

  class DeleteDiskSnapshotResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteDistributionRequest 
    include JSON1_1

    # <p>The name of the distribution to delete.</p>
    # <p>Use the <code>GetDistributions</code> action to get a list of distribution names that you
    # can specify.</p>
    @[Protocol::Field(location: :body, name: "distributionName", required: false)]
    property distribution_name : String?
  end

  class DeleteDistributionResultStruct 
    include JSON1_1

    # <p>An object that describes the result of the action, such as the status of the request, the
    # timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class DeleteDomainRequest 
    include JSON1_1

    # <p>The specific domain name to delete.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: true)]
    property domain_name : String
  end

  class DeleteDomainResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class DeleteDomainEntryRequest 
    include JSON1_1

    # <p>The name of the domain entry to delete.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: true)]
    property domain_name : String
    # <p>An array of key-value pairs containing information about your domain entries.</p>
    @[Protocol::Field(location: :body, name: "domainEntry", required: true)]
    property domain_entry : DomainEntryStruct
  end

  class DeleteDomainEntryResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class DeleteInstanceRequest 
    include JSON1_1

    # <p>The name of the instance to delete.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
    # <p>A Boolean value to indicate whether to delete the enabled add-ons for the disk.</p>
    @[Protocol::Field(location: :body, name: "forceDeleteAddOns", required: false)]
    property force_delete_add_ons : Bool?
  end

  class DeleteInstanceResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteInstanceSnapshotRequest 
    include JSON1_1

    # <p>The name of the snapshot to delete.</p>
    @[Protocol::Field(location: :body, name: "instanceSnapshotName", required: true)]
    property instance_snapshot_name : String
  end

  class DeleteInstanceSnapshotResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteKeyPairRequest 
    include JSON1_1

    # <p>The name of the key pair to delete.</p>
    @[Protocol::Field(location: :body, name: "keyPairName", required: true)]
    property key_pair_name : String
  end

  class DeleteKeyPairResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class DeleteKnownHostKeysRequest 
    include JSON1_1

    # <p>The name of the instance for which you want to reset the host key or certificate.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
  end

  class DeleteKnownHostKeysResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteLoadBalancerRequest 
    include JSON1_1

    # <p>The name of the load balancer you want to delete.</p>
    @[Protocol::Field(location: :body, name: "loadBalancerName", required: true)]
    property load_balancer_name : String
  end

  class DeleteLoadBalancerResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteLoadBalancerTlsCertificateRequest 
    include JSON1_1

    # <p>The load balancer name.</p>
    @[Protocol::Field(location: :body, name: "loadBalancerName", required: true)]
    property load_balancer_name : String
    # <p>The SSL/TLS certificate name.</p>
    @[Protocol::Field(location: :body, name: "certificateName", required: true)]
    property certificate_name : String
    # <p>When <code>true</code>, forces the deletion of an SSL/TLS certificate.</p>
    # <p>There can be two certificates associated with a Lightsail load balancer: the primary and
    # the backup. The <code>force</code> parameter is required when the primary SSL/TLS certificate
    # is in use by an instance attached to the load balancer.</p>
    @[Protocol::Field(location: :body, name: "force", required: false)]
    property force : Bool?
  end

  class DeleteLoadBalancerTlsCertificateResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteRelationalDatabaseRequest 
    include JSON1_1

    # <p>The name of the database that you are deleting.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
    # <p>Determines whether a final database snapshot is created before your database is deleted.
    # If <code>true</code> is specified, no database snapshot is created. If <code>false</code> is
    # specified, a database snapshot is created before your database is deleted.</p>
    # <p>You must specify the <code>final relational database snapshot name</code> parameter if the
    # <code>skip final snapshot</code> parameter is <code>false</code>.</p>
    # <p>Default: <code>false</code>
    # </p>
    @[Protocol::Field(location: :body, name: "skipFinalSnapshot", required: false)]
    property skip_final_snapshot : Bool?
    # <p>The name of the database snapshot created if <code>skip final snapshot</code> is
    # <code>false</code>, which is the default value for that parameter.</p>
    # <note>
    # <p>Specifying this parameter and also specifying the <code>skip final snapshot</code>
    # parameter to <code>true</code> results in an error.</p>
    # </note>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must contain from 2 to 255 alphanumeric characters, or hyphens.</p>
    # </li>
    # <li>
    # <p>The first and last character must be a letter or number.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "finalRelationalDatabaseSnapshotName", required: false)]
    property final_relational_database_snapshot_name : String?
  end

  class DeleteRelationalDatabaseResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DeleteRelationalDatabaseSnapshotRequest 
    include JSON1_1

    # <p>The name of the database snapshot that you are deleting.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseSnapshotName", required: true)]
    property relational_database_snapshot_name : String
  end

  class DeleteRelationalDatabaseSnapshotResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DetachCertificateFromDistributionRequest 
    include JSON1_1

    # <p>The name of the distribution from which to detach the certificate.</p>
    # <p>Use the <code>GetDistributions</code> action to get a list of distribution names that you
    # can specify.</p>
    @[Protocol::Field(location: :body, name: "distributionName", required: true)]
    property distribution_name : String
  end

  class DetachCertificateFromDistributionResultStruct 
    include JSON1_1

    # <p>An object that describes the result of the action, such as the status of the request, the
    # timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class DetachDiskRequest 
    include JSON1_1

    # <p>The unique name of the disk you want to detach from your instance (e.g.,
    # <code>my-disk</code>).</p>
    @[Protocol::Field(location: :body, name: "diskName", required: true)]
    property disk_name : String
  end

  class DetachDiskResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DetachInstancesFromLoadBalancerRequest 
    include JSON1_1

    # <p>The name of the Lightsail load balancer.</p>
    @[Protocol::Field(location: :body, name: "loadBalancerName", required: true)]
    property load_balancer_name : String
    # <p>An array of strings containing the names of the instances you want to detach from the load
    # balancer.</p>
    @[Protocol::Field(location: :body, name: "instanceNames", required: true)]
    property instance_names : Array(String)
  end

  class DetachInstancesFromLoadBalancerResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DetachStaticIpRequest 
    include JSON1_1

    # <p>The name of the static IP to detach from the instance.</p>
    @[Protocol::Field(location: :body, name: "staticIpName", required: true)]
    property static_ip_name : String
  end

  class DetachStaticIpResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DisableAddOnRequest 
    include JSON1_1

    # <p>The add-on type to disable.</p>
    @[Protocol::Field(location: :body, name: "addOnType", required: true)]
    property add_on_type : String
    # <p>The name of the source resource for which to disable the add-on.</p>
    @[Protocol::Field(location: :body, name: "resourceName", required: true)]
    property resource_name : String
  end

  class DisableAddOnResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class DownloadDefaultKeyPairRequest 
    include JSON1_1

  end

  class DownloadDefaultKeyPairResultStruct 
    include JSON1_1

    # <p>A base64-encoded public key of the <code>ssh-rsa</code> type.</p>
    @[Protocol::Field(location: :body, name: "publicKeyBase64", required: false)]
    property public_key_base64 : String?
    # <p>A base64-encoded RSA private key.</p>
    @[Protocol::Field(location: :body, name: "privateKeyBase64", required: false)]
    property private_key_base64 : String?
  end

  class EnableAddOnRequest 
    include JSON1_1

    # <p>The name of the source resource for which to enable or modify the add-on.</p>
    @[Protocol::Field(location: :body, name: "resourceName", required: true)]
    property resource_name : String
    # <p>An array of strings representing the add-on to enable or modify.</p>
    @[Protocol::Field(location: :body, name: "addOnRequest", required: true)]
    property add_on_request : AddOnRequest
  end

  class EnableAddOnResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class ExportSnapshotRequest 
    include JSON1_1

    # <p>The name of the instance or disk snapshot to be exported to Amazon EC2.</p>
    @[Protocol::Field(location: :body, name: "sourceSnapshotName", required: true)]
    property source_snapshot_name : String
  end

  class ExportSnapshotResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class GetActiveNamesRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetActiveNames</code> request. If your
    # results are paginated, the response will return a next page token that you can specify as the
    # page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetActiveNamesResultStruct 
    include JSON1_1

    # <p>The list of active names returned by the get active names request.</p>
    @[Protocol::Field(location: :body, name: "activeNames", required: false)]
    property active_names : Array(String)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetActiveNames</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetAlarmsRequest 
    include JSON1_1

    # <p>The name of the alarm.</p>
    # <p>Specify an alarm name to return information about a specific alarm.</p>
    @[Protocol::Field(location: :body, name: "alarmName", required: false)]
    property alarm_name : String?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetAlarms</code> request. If your results
    # are paginated, the response will return a next page token that you can specify as the page
    # token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
    # <p>The name of the Lightsail resource being monitored by the alarm.</p>
    # <p>Specify a monitored resource name to return information about all alarms for a specific
    # resource.</p>
    @[Protocol::Field(location: :body, name: "monitoredResourceName", required: false)]
    property monitored_resource_name : String?
  end

  class MonitoredResourceInfoStruct 
    include JSON1_1

    # <p>The Amazon Resource Name (ARN) of the resource being monitored.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The name of the Lightsail resource being monitored.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Lightsail resource type of the resource being monitored.</p>
    # <p>Instances, load balancers, and relational databases are the only Lightsail resources
    # that can currently be monitored by alarms.</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
  end

  class AlarmStruct 
    include JSON1_1

    # <p>The name of the alarm.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the alarm.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The timestamp when the alarm was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>An object that lists information about the location of the alarm.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The Lightsail resource type (e.g., <code>Alarm</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The support code. Include this code in your email to support when you have questions about
    # your Lightsail alarm. This code enables our support team to look up your Lightsail
    # information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>An object that lists information about the resource monitored by the alarm.</p>
    @[Protocol::Field(location: :body, name: "monitoredResourceInfo", required: false)]
    property monitored_resource_info : MonitoredResourceInfoStruct?
    # <p>The arithmetic operation used when comparing the specified statistic and threshold.</p>
    @[Protocol::Field(location: :body, name: "comparisonOperator", required: false)]
    property comparison_operator : String?
    # <p>The number of periods over which data is compared to the specified threshold.</p>
    @[Protocol::Field(location: :body, name: "evaluationPeriods", required: false)]
    property evaluation_periods : Int32?
    # <p>The period, in seconds, over which the statistic is applied.</p>
    @[Protocol::Field(location: :body, name: "period", required: false)]
    property period : Int32?
    # <p>The value against which the specified statistic is compared.</p>
    @[Protocol::Field(location: :body, name: "threshold", required: false)]
    property threshold : Float64?
    # <p>The number of data points that must not within the specified threshold to trigger the
    # alarm.</p>
    @[Protocol::Field(location: :body, name: "datapointsToAlarm", required: false)]
    property datapoints_to_alarm : Int32?
    # <p>Specifies how the alarm handles missing data points.</p>
    # <p>An alarm can treat missing data in the following ways:</p>
    # <ul>
    # <li>
    # <p>
    # <code>breaching</code> - Assume the missing data is not within the threshold. Missing
    # data counts towards the number of times the metric is not within the threshold.</p>
    # </li>
    # <li>
    # <p>
    # <code>notBreaching</code> - Assume the missing data is within the threshold. Missing
    # data does not count towards the number of times the metric is not within the
    # threshold.</p>
    # </li>
    # <li>
    # <p>
    # <code>ignore</code> - Ignore the missing data. Maintains the current alarm
    # state.</p>
    # </li>
    # <li>
    # <p>
    # <code>missing</code> - Missing data is treated as missing.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "treatMissingData", required: false)]
    property treat_missing_data : String?
    # <p>The statistic for the metric associated with the alarm.</p>
    # <p>The following statistics are available:</p>
    # <ul>
    # <li>
    # <p>
    # <code>Minimum</code> - The lowest value observed during the specified period. Use this
    # value to determine low volumes of activity for your application.</p>
    # </li>
    # <li>
    # <p>
    # <code>Maximum</code> - The highest value observed during the specified period. Use
    # this value to determine high volumes of activity for your application.</p>
    # </li>
    # <li>
    # <p>
    # <code>Sum</code> - All values submitted for the matching metric added together. You
    # can use this statistic to determine the total volume of a metric.</p>
    # </li>
    # <li>
    # <p>
    # <code>Average</code> - The value of Sum / SampleCount during the specified period. By
    # comparing this statistic with the Minimum and Maximum values, you can determine the full
    # scope of a metric and how close the average use is to the Minimum and Maximum values. This
    # comparison helps you to know when to increase or decrease your resources.</p>
    # </li>
    # <li>
    # <p>
    # <code>SampleCount</code> - The count, or number, of data points used for the
    # statistical calculation.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "statistic", required: false)]
    property statistic : String?
    # <p>The name of the metric associated with the alarm.</p>
    @[Protocol::Field(location: :body, name: "metricName", required: false)]
    property metric_name : String?
    # <p>The current state of the alarm.</p>
    # <p>An alarm has the following possible states:</p>
    # <ul>
    # <li>
    # <p>
    # <code>ALARM</code> - The metric is outside of the defined threshold.</p>
    # </li>
    # <li>
    # <p>
    # <code>INSUFFICIENT_DATA</code> - The alarm has just started, the metric is not
    # available, or not enough data is available for the metric to determine the alarm
    # state.</p>
    # </li>
    # <li>
    # <p>
    # <code>OK</code> - The metric is within the defined threshold.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
    # <p>The unit of the metric associated with the alarm.</p>
    @[Protocol::Field(location: :body, name: "unit", required: false)]
    property unit : String?
    # <p>The contact protocols for the alarm, such as <code>Email</code>, <code>SMS</code> (text
    # messaging), or both.</p>
    @[Protocol::Field(location: :body, name: "contactProtocols", required: false)]
    property contact_protocols : Array(String)?
    # <p>The alarm states that trigger a notification.</p>
    @[Protocol::Field(location: :body, name: "notificationTriggers", required: false)]
    property notification_triggers : Array(String)?
    # <p>Indicates whether the alarm is enabled.</p>
    @[Protocol::Field(location: :body, name: "notificationEnabled", required: false)]
    property notification_enabled : Bool?
  end

  class GetAlarmsResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the alarms.</p>
    @[Protocol::Field(location: :body, name: "alarms", required: false)]
    property alarms : Array(AlarmStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetAlarms</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetAutoSnapshotsRequest 
    include JSON1_1

    # <p>The name of the source instance or disk from which to get automatic snapshot
    # information.</p>
    @[Protocol::Field(location: :body, name: "resourceName", required: true)]
    property resource_name : String
  end

  class AttachedDiskStruct 
    include JSON1_1

    # <p>The path of the disk (e.g., <code>/dev/xvdf</code>).</p>
    @[Protocol::Field(location: :body, name: "path", required: false)]
    property path : String?
    # <p>The size of the disk in GB.</p>
    @[Protocol::Field(location: :body, name: "sizeInGb", required: false)]
    property size_in_gb : Int32?
  end

  class AutoSnapshotDetailsStruct 
    include JSON1_1

    # <p>The date of the automatic snapshot in <code>YYYY-MM-DD</code> format.</p>
    @[Protocol::Field(location: :body, name: "date", required: false)]
    property date : String?
    # <p>The timestamp when the automatic snapshot was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The status of the automatic snapshot.</p>
    @[Protocol::Field(location: :body, name: "status", required: false)]
    property status : String?
    # <p>An array of objects that describe the block storage disks attached to the instance when
    # the automatic snapshot was created.</p>
    @[Protocol::Field(location: :body, name: "fromAttachedDisks", required: false)]
    property from_attached_disks : Array(AttachedDiskStruct)?
  end

  class GetAutoSnapshotsResultStruct 
    include JSON1_1

    # <p>The name of the source instance or disk for the automatic snapshots.</p>
    @[Protocol::Field(location: :body, name: "resourceName", required: false)]
    property resource_name : String?
    # <p>The resource type (e.g., <code>Instance</code> or <code>Disk</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>An array of objects that describe the automatic snapshots that are available for the
    # specified source instance or disk.</p>
    @[Protocol::Field(location: :body, name: "autoSnapshots", required: false)]
    property auto_snapshots : Array(AutoSnapshotDetailsStruct)?
  end

  class GetBlueprintsRequest 
    include JSON1_1

    # <p>A Boolean value indicating whether to include inactive results in your request.</p>
    @[Protocol::Field(location: :body, name: "includeInactive", required: false)]
    property include_inactive : Bool?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetBlueprints</code> request. If your
    # results are paginated, the response will return a next page token that you can specify as the
    # page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class BlueprintStruct 
    include JSON1_1

    # <p>The ID for the virtual private server image (e.g., <code>app_wordpress_4_4</code> or
    # <code>app_lamp_7_0</code>).</p>
    @[Protocol::Field(location: :body, name: "blueprintId", required: false)]
    property blueprint_id : String?
    # <p>The friendly name of the blueprint (e.g., <code>Amazon Linux</code>).</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The group name of the blueprint (e.g., <code>amazon-linux</code>).</p>
    @[Protocol::Field(location: :body, name: "group", required: false)]
    property group : String?
    # <p>The type of the blueprint (e.g., <code>os</code> or <code>app</code>).</p>
    @[Protocol::Field(location: :body, name: "type", required: false)]
    property type : String?
    # <p>The description of the blueprint.</p>
    @[Protocol::Field(location: :body, name: "description", required: false)]
    property description : String?
    # <p>A Boolean value indicating whether the blueprint is active. Inactive blueprints are listed
    # to support customers with existing instances but are not necessarily available for launch of
    # new instances. Blueprints are marked inactive when they become outdated due to operating
    # system updates or new application releases.</p>
    @[Protocol::Field(location: :body, name: "isActive", required: false)]
    property is_active : Bool?
    # <p>The minimum bundle power required to run this blueprint. For example, you need a bundle
    # with a power value of 500 or more to create an instance that uses a blueprint with a minimum
    # power value of 500. <code>0</code> indicates that the blueprint runs on all instance sizes.
    # </p>
    @[Protocol::Field(location: :body, name: "minPower", required: false)]
    property min_power : Int32?
    # <p>The version number of the operating system, application, or stack (e.g.,
    # <code>2016.03.0</code>).</p>
    @[Protocol::Field(location: :body, name: "version", required: false)]
    property version : String?
    # <p>The version code.</p>
    @[Protocol::Field(location: :body, name: "versionCode", required: false)]
    property version_code : String?
    # <p>The product URL to learn more about the image or blueprint.</p>
    @[Protocol::Field(location: :body, name: "productUrl", required: false)]
    property product_url : String?
    # <p>The end-user license agreement URL for the image or blueprint.</p>
    @[Protocol::Field(location: :body, name: "licenseUrl", required: false)]
    property license_url : String?
    # <p>The operating system platform (either Linux/Unix-based or Windows Server-based) of the
    # blueprint.</p>
    @[Protocol::Field(location: :body, name: "platform", required: false)]
    property platform : String?
  end

  class GetBlueprintsResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs that contains information about the available
    # blueprints.</p>
    @[Protocol::Field(location: :body, name: "blueprints", required: false)]
    property blueprints : Array(BlueprintStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetBlueprints</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetBundlesRequest 
    include JSON1_1

    # <p>A Boolean value that indicates whether to include inactive bundle results in your
    # request.</p>
    @[Protocol::Field(location: :body, name: "includeInactive", required: false)]
    property include_inactive : Bool?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetBundles</code> request. If your results
    # are paginated, the response will return a next page token that you can specify as the page
    # token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class BundleStruct 
    include JSON1_1

    # <p>The price in US dollars (e.g., <code>5.0</code>) of the bundle.</p>
    @[Protocol::Field(location: :body, name: "price", required: false)]
    property price : Float32?
    # <p>The number of vCPUs included in the bundle (e.g., <code>2</code>).</p>
    @[Protocol::Field(location: :body, name: "cpuCount", required: false)]
    property cpu_count : Int32?
    # <p>The size of the SSD (e.g., <code>30</code>).</p>
    @[Protocol::Field(location: :body, name: "diskSizeInGb", required: false)]
    property disk_size_in_gb : Int32?
    # <p>The bundle ID (e.g., <code>micro_1_0</code>).</p>
    @[Protocol::Field(location: :body, name: "bundleId", required: false)]
    property bundle_id : String?
    # <p>The Amazon EC2 instance type (e.g., <code>t2.micro</code>).</p>
    @[Protocol::Field(location: :body, name: "instanceType", required: false)]
    property instance_type : String?
    # <p>A Boolean value indicating whether the bundle is active.</p>
    @[Protocol::Field(location: :body, name: "isActive", required: false)]
    property is_active : Bool?
    # <p>A friendly name for the bundle (e.g., <code>Micro</code>).</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>A numeric value that represents the power of the bundle (e.g., <code>500</code>). You can
    # use the bundle's power value in conjunction with a blueprint's minimum power value to
    # determine whether the blueprint will run on the bundle. For example, you need a bundle with a
    # power value of 500 or more to create an instance that uses a blueprint with a minimum power
    # value of 500.</p>
    @[Protocol::Field(location: :body, name: "power", required: false)]
    property power : Int32?
    # <p>The amount of RAM in GB (e.g., <code>2.0</code>).</p>
    @[Protocol::Field(location: :body, name: "ramSizeInGb", required: false)]
    property ram_size_in_gb : Float32?
    # <p>The data transfer rate per month in GB (e.g., <code>2000</code>).</p>
    @[Protocol::Field(location: :body, name: "transferPerMonthInGb", required: false)]
    property transfer_per_month_in_gb : Int32?
    # <p>The operating system platform (Linux/Unix-based or Windows Server-based) that the bundle
    # supports. You can only launch a <code>WINDOWS</code> bundle on a blueprint that supports the
    # <code>WINDOWS</code> platform. <code>LINUX_UNIX</code> blueprints require a
    # <code>LINUX_UNIX</code> bundle.</p>
    @[Protocol::Field(location: :body, name: "supportedPlatforms", required: false)]
    property supported_platforms : Array(String)?
  end

  class GetBundlesResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs that contains information about the available bundles.</p>
    @[Protocol::Field(location: :body, name: "bundles", required: false)]
    property bundles : Array(BundleStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetBundles</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetCertificatesRequest 
    include JSON1_1

    # <p>The status of the certificates for which to return information.</p>
    # <p>For example, specify <code>ISSUED</code> to return only certificates with an
    # <code>ISSUED</code> status.</p>
    # <p>When omitted, the response includes all of your certificates in the AWS Region where the
    # request is made, regardless of their current status.</p>
    @[Protocol::Field(location: :body, name: "certificateStatuses", required: false)]
    property certificate_statuses : Array(String)?
    # <p>Indicates whether to include detailed information about the certificates in the
    # response.</p>
    # <p>When omitted, the response includes only the certificate names, Amazon Resource Names
    # (ARNs), domain names, and tags.</p>
    @[Protocol::Field(location: :body, name: "includeCertificateDetails", required: false)]
    property include_certificate_details : Bool?
    # <p>The name for the certificate for which to return information.</p>
    # <p>When omitted, the response includes all of your certificates in the AWS Region where the
    # request is made.</p>
    @[Protocol::Field(location: :body, name: "certificateName", required: false)]
    property certificate_name : String?
  end

  class GetCertificatesResultStruct 
    include JSON1_1

    # <p>An object that describes certificates.</p>
    @[Protocol::Field(location: :body, name: "certificates", required: false)]
    property certificates : Array(CertificateSummaryStruct)?
  end

  class GetCloudFormationStackRecordsRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetClouFormationStackRecords</code> request.
    # If your results are paginated, the response will return a next page token that you can specify
    # as the page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class CloudFormationStackRecordSourceInfoStruct 
    include JSON1_1

    # <p>The Lightsail resource type (e.g., <code>ExportSnapshotRecord</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The name of the record.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the export snapshot record.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
  end

  class DestinationInfoStruct 
    include JSON1_1

    # <p>The ID of the resource created at the destination.</p>
    @[Protocol::Field(location: :body, name: "id", required: false)]
    property id : String?
    # <p>The destination service of the record.</p>
    @[Protocol::Field(location: :body, name: "service", required: false)]
    property service : String?
  end

  class CloudFormationStackRecordStruct 
    include JSON1_1

    # <p>The name of the CloudFormation stack record. It starts with
    # <code>CloudFormationStackRecord</code> followed by a GUID.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the CloudFormation stack record.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The date when the CloudFormation stack record was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>A list of objects describing the Availability Zone and AWS Region of the CloudFormation
    # stack record.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The Lightsail resource type (e.g., <code>CloudFormationStackRecord</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The current state of the CloudFormation stack record.</p>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
    # <p>A list of objects describing the source of the CloudFormation stack record.</p>
    @[Protocol::Field(location: :body, name: "sourceInfo", required: false)]
    property source_info : Array(CloudFormationStackRecordSourceInfoStruct)?
    # <p>A list of objects describing the destination service, which is AWS CloudFormation, and the Amazon
    # Resource Name (ARN) of the AWS CloudFormation stack.</p>
    @[Protocol::Field(location: :body, name: "destinationInfo", required: false)]
    property destination_info : DestinationInfoStruct?
  end

  class GetCloudFormationStackRecordsResultStruct 
    include JSON1_1

    # <p>A list of objects describing the CloudFormation stack records.</p>
    @[Protocol::Field(location: :body, name: "cloudFormationStackRecords", required: false)]
    property cloud_formation_stack_records : Array(CloudFormationStackRecordStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another
    # <code>GetCloudFormationStackRecords</code> request and specify the next page token using the
    # <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetContactMethodsRequest 
    include JSON1_1

    # <p>The protocols used to send notifications, such as <code>Email</code>, or <code>SMS</code>
    # (text messaging).</p>
    # <p>Specify a protocol in your request to return information about a specific contact method
    # protocol.</p>
    @[Protocol::Field(location: :body, name: "protocols", required: false)]
    property protocols : Array(String)?
  end

  class ContactMethodStruct 
    include JSON1_1

    # <p>The destination of the contact method, such as an email address or a mobile phone
    # number.</p>
    @[Protocol::Field(location: :body, name: "contactEndpoint", required: false)]
    property contact_endpoint : String?
    # <p>The current status of the contact method.</p>
    # <p>A contact method has the following possible status:</p>
    # <ul>
    # <li>
    # <p>
    # <code>PendingVerification</code> - The contact method has not yet been verified, and
    # the verification has not yet expired.</p>
    # </li>
    # <li>
    # <p>
    # <code>Valid</code> - The contact method has been verified.</p>
    # </li>
    # <li>
    # <p>
    # <code>InValid</code> - An attempt was made to verify the contact method, but the
    # verification has expired.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "status", required: false)]
    property status : String?
    # <p>The protocol of the contact method, such as email or SMS (text messaging).</p>
    @[Protocol::Field(location: :body, name: "protocol", required: false)]
    property protocol : String?
    # <p>The name of the contact method.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the contact method.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The timestamp when the contact method was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # 
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The Lightsail resource type (e.g., <code>ContactMethod</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The support code. Include this code in your email to support when you have questions about
    # your Lightsail contact method. This code enables our support team to look up your
    # Lightsail information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
  end

  class GetContactMethodsResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the contact methods.</p>
    @[Protocol::Field(location: :body, name: "contactMethods", required: false)]
    property contact_methods : Array(ContactMethodStruct)?
  end

  class GetContainerAPIMetadataRequest 
    include JSON1_1

  end

  class GetContainerAPIMetadataResultStruct 
    include JSON1_1

    # <p>Metadata about Lightsail containers, such as the current version of the Lightsail
    # Control (lightsailctl) plugin.</p>
    @[Protocol::Field(location: :body, name: "metadata", required: false)]
    property metadata : Array(Hash(String, String))?
  end

  class GetContainerImagesRequest 
    include JSON1_1

    # <p>The name of the container service for which to return registered container images.</p>
    @[Protocol::Field(location: :uri, name: "serviceName", required: true)]
    property service_name : String
  end

  class ContainerImageStruct 
    include JSON1_1

    # <p>The name of the container image.</p>
    @[Protocol::Field(location: :body, name: "image", required: false)]
    property image : String?
    # <p>The digest of the container image.</p>
    @[Protocol::Field(location: :body, name: "digest", required: false)]
    property digest : String?
    # <p>The timestamp when the container image was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
  end

  class GetContainerImagesResultStruct 
    include JSON1_1

    # <p>An array of objects that describe container images that are registered to the container
    # service.</p>
    @[Protocol::Field(location: :body, name: "containerImages", required: false)]
    property container_images : Array(ContainerImageStruct)?
  end

  class GetContainerLogRequest 
    include JSON1_1

    # <p>The name of the container service for which to get a container log.</p>
    @[Protocol::Field(location: :uri, name: "serviceName", required: true)]
    property service_name : String
    # <p>The name of the container that is either running or previously ran on the container
    # service for which to return a log.</p>
    @[Protocol::Field(location: :uri, name: "containerName", required: true)]
    property container_name : String
    # <p>The start of the time interval for which to get log data.</p>
    # 
    # <p>Constraints:</p>
    # 
    # <ul>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Specified in the Unix time format.</p>
    # 
    # <p>For example, if you wish to use a start time of October 1, 2018, at 8 PM UTC, specify
    # <code>1538424000</code> as the start time.</p>
    # </li>
    # </ul>
    # 
    # <p>You can convert a human-friendly time to Unix time format using a converter like <a href="https://www.epochconverter.com/">Epoch converter</a>.</p>
    @[Protocol::Field(location: :query, name: "startTime", required: false)]
    property start_time : Time?
    # <p>The end of the time interval for which to get log data.</p>
    # 
    # <p>Constraints:</p>
    # 
    # <ul>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Specified in the Unix time format.</p>
    # 
    # <p>For example, if you wish to use an end time of October 1, 2018, at 9 PM UTC, specify
    # <code>1538427600</code> as the end time.</p>
    # </li>
    # </ul>
    # 
    # <p>You can convert a human-friendly time to Unix time format using a converter like <a href="https://www.epochconverter.com/">Epoch converter</a>.</p>
    @[Protocol::Field(location: :query, name: "endTime", required: false)]
    property end_time : Time?
    # <p>The pattern to use to filter the returned log events to a specific term.</p>
    # 
    # <p>The following are a few examples of filter patterns that you can specify:</p>
    # <ul>
    # <li>
    # <p>To return all log events, specify a filter pattern of <code>""</code>.</p>
    # </li>
    # <li>
    # <p>To exclude log events that contain the <code>ERROR</code> term, and return all other
    # log events, specify a filter pattern of <code>"-ERROR"</code>.</p>
    # </li>
    # <li>
    # <p>To return log events that contain the <code>ERROR</code> term, specify a filter
    # pattern of <code>"ERROR"</code>.</p>
    # </li>
    # <li>
    # <p>To return log events that contain both the <code>ERROR</code> and
    # <code>Exception</code> terms, specify a filter pattern of <code>"ERROR
    # Exception"</code>.</p>
    # </li>
    # <li>
    # <p>To return log events that contain the <code>ERROR</code>
    # <i>or</i> the <code>Exception</code> term, specify a filter pattern of
    # <code>"?ERROR ?Exception"</code>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :query, name: "filterPattern", required: false)]
    property filter_pattern : String?
    # <p>The token to advance to the next page of results from your request.</p>
    # 
    # <p>To get a page token, perform an initial <code>GetContainerLog</code> request. If your
    # results are paginated, the response will return a next page token that you can specify as the
    # page token in a subsequent request.</p>
    @[Protocol::Field(location: :query, name: "pageToken", required: false)]
    property page_token : String?
  end

  class ContainerServiceLogEventStruct 
    include JSON1_1

    # <p>The timestamp when the container service log event was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The message of the container service log event.</p>
    @[Protocol::Field(location: :body, name: "message", required: false)]
    property message : String?
  end

  class GetContainerLogResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the log events of a container.</p>
    @[Protocol::Field(location: :body, name: "logEvents", required: false)]
    property log_events : Array(ContainerServiceLogEventStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # 
    # <p>A next page token is not returned if there are no more results to display.</p>
    # 
    # <p>To get the next page of results, perform another <code>GetContainerLog</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetContainerServiceDeploymentsRequest 
    include JSON1_1

    # <p>The name of the container service for which to return deployments.</p>
    @[Protocol::Field(location: :uri, name: "serviceName", required: true)]
    property service_name : String
  end

  class GetContainerServiceDeploymentsResultStruct 
    include JSON1_1

    # <p>An array of objects that describe deployments for a container service.</p>
    @[Protocol::Field(location: :body, name: "deployments", required: false)]
    property deployments : Array(ContainerServiceDeploymentStruct)?
  end

  class GetContainerServiceMetricDataRequest 
    include JSON1_1

    # <p>The name of the container service for which to get metric data.</p>
    @[Protocol::Field(location: :uri, name: "serviceName", required: true)]
    property service_name : String
    # <p>The metric for which you want to return information.</p>
    # 
    # <p>Valid container service metric names are listed below, along with the most useful
    # statistics to include in your request, and the published unit value.</p>
    # 
    # <ul>
    # <li>
    # <p>
    # <code>CPUUtilization</code> - The average percentage of compute units that are
    # currently in use across all nodes of the container service. This metric identifies the
    # processing power required to run containers on each node of the container service.</p>
    # <p>Statistics: The most useful statistics are <code>Maximum</code> and
    # <code>Average</code>.</p>
    # <p>Unit: The published unit is <code>Percent</code>.</p>
    # </li>
    # <li>
    # <p>
    # <code>MemoryUtilization</code> - The average percentage of available memory that is
    # currently in use across all nodes of the container service. This metric identifies the
    # memory required to run containers on each node of the container service.</p>
    # <p>Statistics: The most useful statistics are <code>Maximum</code> and
    # <code>Average</code>.</p>
    # <p>Unit: The published unit is <code>Percent</code>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :query, name: "metricName", required: true)]
    property metric_name : String
    # <p>The start time of the time period.</p>
    @[Protocol::Field(location: :query, name: "startTime", required: true)]
    property start_time : Time
    # <p>The end time of the time period.</p>
    @[Protocol::Field(location: :query, name: "endTime", required: true)]
    property end_time : Time
    # <p>The granularity, in seconds, of the returned data points.</p>
    # 
    # <p>All container service metric data is available in 5-minute (300 seconds)
    # granularity.</p>
    @[Protocol::Field(location: :query, name: "period", required: true)]
    property period : Int32
    # <p>The statistic for the metric.</p>
    # 
    # <p>The following statistics are available:</p>
    # 
    # <ul>
    # <li>
    # <p>
    # <code>Minimum</code> - The lowest value observed during the specified period. Use this
    # value to determine low volumes of activity for your application.</p>
    # </li>
    # <li>
    # <p>
    # <code>Maximum</code> - The highest value observed during the specified period. Use
    # this value to determine high volumes of activity for your application.</p>
    # </li>
    # <li>
    # <p>
    # <code>Sum</code> - All values submitted for the matching metric added together. You
    # can use this statistic to determine the total volume of a metric.</p>
    # </li>
    # <li>
    # <p>
    # <code>Average</code> - The value of <code>Sum</code> / <code>SampleCount</code> during
    # the specified period. By comparing this statistic with the <code>Minimum</code> and
    # <code>Maximum</code> values, you can determine the full scope of a metric and how close
    # the average use is to the <code>Minimum</code> and <code>Maximum</code> values. This
    # comparison helps you to know when to increase or decrease your resources.</p>
    # </li>
    # <li>
    # <p>
    # <code>SampleCount</code> - The count, or number, of data points used for the
    # statistical calculation.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :query, name: "statistics", required: true)]
    property statistics : Array(String)
  end

  class MetricDatapointStruct 
    include JSON1_1

    # <p>The average.</p>
    @[Protocol::Field(location: :body, name: "average", required: false)]
    property average : Float64?
    # <p>The maximum.</p>
    @[Protocol::Field(location: :body, name: "maximum", required: false)]
    property maximum : Float64?
    # <p>The minimum.</p>
    @[Protocol::Field(location: :body, name: "minimum", required: false)]
    property minimum : Float64?
    # <p>The sample count.</p>
    @[Protocol::Field(location: :body, name: "sampleCount", required: false)]
    property sample_count : Float64?
    # <p>The sum.</p>
    @[Protocol::Field(location: :body, name: "sum", required: false)]
    property sum : Float64?
    # <p>The timestamp (e.g., <code>1479816991.349</code>).</p>
    @[Protocol::Field(location: :body, name: "timestamp", required: false)]
    property timestamp : Time?
    # <p>The unit. </p>
    @[Protocol::Field(location: :body, name: "unit", required: false)]
    property unit : String?
  end

  class GetContainerServiceMetricDataResultStruct 
    include JSON1_1

    # <p>The name of the metric returned. </p>
    @[Protocol::Field(location: :body, name: "metricName", required: false)]
    property metric_name : String?
    # <p>An array of objects that describe the metric data returned.</p>
    @[Protocol::Field(location: :body, name: "metricData", required: false)]
    property metric_data : Array(MetricDatapointStruct)?
  end

  class GetContainerServicePowersRequest 
    include JSON1_1

  end

  class ContainerServicePowerStruct 
    include JSON1_1

    # <p>The ID of the power (e.g., <code>nano-1</code>).</p>
    @[Protocol::Field(location: :body, name: "powerId", required: false)]
    property power_id : String?
    # <p>The monthly price of the power in USD.</p>
    @[Protocol::Field(location: :body, name: "price", required: false)]
    property price : Float32?
    # <p>The number of vCPUs included in the power.</p>
    @[Protocol::Field(location: :body, name: "cpuCount", required: false)]
    property cpu_count : Float32?
    # <p>The amount of RAM (in GB) of the power.</p>
    @[Protocol::Field(location: :body, name: "ramSizeInGb", required: false)]
    property ram_size_in_gb : Float32?
    # <p>The friendly name of the power (e.g., <code>nano</code>).</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>A Boolean value indicating whether the power is active and can be specified for container
    # services.</p>
    @[Protocol::Field(location: :body, name: "isActive", required: false)]
    property is_active : Bool?
  end

  class GetContainerServicePowersResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the powers that can be specified for a container
    # service.</p>
    @[Protocol::Field(location: :body, name: "powers", required: false)]
    property powers : Array(ContainerServicePowerStruct)?
  end

  class GetContainerServicesRequest 
    include JSON1_1

    # <p>The name of the container service for which to return information.</p>
    # 
    # <p>When omitted, the response includes all of your container services in the AWS Region
    # where the request is made.</p>
    @[Protocol::Field(location: :query, name: "serviceName", required: false)]
    property service_name : String?
  end

  class ContainerServicesListResultStruct 
    include JSON1_1

    # <p>An array of objects that describe one or more container services.</p>
    @[Protocol::Field(location: :body, name: "containerServices", required: false)]
    property container_services : Array(ContainerServiceStruct)?
  end

  class GetDiskRequest 
    include JSON1_1

    # <p>The name of the disk (e.g., <code>my-disk</code>).</p>
    @[Protocol::Field(location: :body, name: "diskName", required: true)]
    property disk_name : String
  end

  class AddOnStruct 
    include JSON1_1

    # <p>The name of the add-on.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The status of the add-on.</p>
    @[Protocol::Field(location: :body, name: "status", required: false)]
    property status : String?
    # <p>The daily time when an automatic snapshot is created.</p>
    # <p>The time shown is in <code>HH:00</code> format, and in Coordinated Universal Time
    # (UTC).</p>
    # <p>The snapshot is automatically created between the time shown and up to 45 minutes
    # after.</p>
    @[Protocol::Field(location: :body, name: "snapshotTimeOfDay", required: false)]
    property snapshot_time_of_day : String?
    # <p>The next daily time an automatic snapshot will be created.</p>
    # <p>The time shown is in <code>HH:00</code> format, and in Coordinated Universal Time
    # (UTC).</p>
    # <p>The snapshot is automatically created between the time shown and up to 45 minutes
    # after.</p>
    @[Protocol::Field(location: :body, name: "nextSnapshotTimeOfDay", required: false)]
    property next_snapshot_time_of_day : String?
  end

  class DiskStruct 
    include JSON1_1

    # <p>The unique name of the disk.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the disk.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The support code. Include this code in your email to support when you have questions about
    # an instance or another resource in Lightsail. This code enables our support team to look up
    # your Lightsail information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>The date when the disk was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The AWS Region and Availability Zone where the disk is located.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The Lightsail resource type (e.g., <code>Disk</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>An array of objects representing the add-ons enabled on the disk.</p>
    @[Protocol::Field(location: :body, name: "addOns", required: false)]
    property add_ons : Array(AddOnStruct)?
    # <p>The size of the disk in GB.</p>
    @[Protocol::Field(location: :body, name: "sizeInGb", required: false)]
    property size_in_gb : Int32?
    # <p>A Boolean value indicating whether this disk is a system disk (has an operating system
    # loaded on it).</p>
    @[Protocol::Field(location: :body, name: "isSystemDisk", required: false)]
    property is_system_disk : Bool?
    # <p>The input/output operations per second (IOPS) of the disk.</p>
    @[Protocol::Field(location: :body, name: "iops", required: false)]
    property iops : Int32?
    # <p>The disk path.</p>
    @[Protocol::Field(location: :body, name: "path", required: false)]
    property path : String?
    # <p>Describes the status of the disk.</p>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
    # <p>The resources to which the disk is attached.</p>
    @[Protocol::Field(location: :body, name: "attachedTo", required: false)]
    property attached_to : String?
    # <p>A Boolean value indicating whether the disk is attached.</p>
    @[Protocol::Field(location: :body, name: "isAttached", required: false)]
    property is_attached : Bool?
    # <p>(Deprecated) The attachment state of the disk.</p>
    # <note>
    # <p>In releases prior to November 14, 2017, this parameter returned <code>attached</code>
    # for system disks in the API response. It is now deprecated, but still included in the
    # response. Use <code>isAttached</code> instead.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "attachmentState", required: false)]
    property attachment_state : String?
    # <p>(Deprecated) The number of GB in use by the disk.</p>
    # <note>
    # <p>In releases prior to November 14, 2017, this parameter was not included in the API
    # response. It is now deprecated.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "gbInUse", required: false)]
    property gb_in_use : Int32?
  end

  class GetDiskResultStruct 
    include JSON1_1

    # <p>An object containing information about the disk.</p>
    @[Protocol::Field(location: :body, name: "disk", required: false)]
    property disk : DiskStruct?
  end

  class GetDisksRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetDisks</code> request. If your results are
    # paginated, the response will return a next page token that you can specify as the page token
    # in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetDisksResultStruct 
    include JSON1_1

    # <p>An array of objects containing information about all block storage disks.</p>
    @[Protocol::Field(location: :body, name: "disks", required: false)]
    property disks : Array(DiskStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetDisks</code> request and specify
    # the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetDiskSnapshotRequest 
    include JSON1_1

    # <p>The name of the disk snapshot (e.g., <code>my-disk-snapshot</code>).</p>
    @[Protocol::Field(location: :body, name: "diskSnapshotName", required: true)]
    property disk_snapshot_name : String
  end

  class DiskSnapshotStruct 
    include JSON1_1

    # <p>The name of the disk snapshot (e.g., <code>my-disk-snapshot</code>).</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the disk snapshot.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The support code. Include this code in your email to support when you have questions about
    # an instance or another resource in Lightsail. This code enables our support team to look up
    # your Lightsail information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>The date when the disk snapshot was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The AWS Region and Availability Zone where the disk snapshot was created.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The Lightsail resource type (e.g., <code>DiskSnapshot</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>The size of the disk in GB.</p>
    @[Protocol::Field(location: :body, name: "sizeInGb", required: false)]
    property size_in_gb : Int32?
    # <p>The status of the disk snapshot operation.</p>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
    # <p>The progress of the disk snapshot operation.</p>
    @[Protocol::Field(location: :body, name: "progress", required: false)]
    property progress : String?
    # <p>The unique name of the source disk from which the disk snapshot was created.</p>
    @[Protocol::Field(location: :body, name: "fromDiskName", required: false)]
    property from_disk_name : String?
    # <p>The Amazon Resource Name (ARN) of the source disk from which the disk snapshot was
    # created.</p>
    @[Protocol::Field(location: :body, name: "fromDiskArn", required: false)]
    property from_disk_arn : String?
    # <p>The unique name of the source instance from which the disk (system volume) snapshot was
    # created.</p>
    @[Protocol::Field(location: :body, name: "fromInstanceName", required: false)]
    property from_instance_name : String?
    # <p>The Amazon Resource Name (ARN) of the source instance from which the disk (system volume)
    # snapshot was created.</p>
    @[Protocol::Field(location: :body, name: "fromInstanceArn", required: false)]
    property from_instance_arn : String?
    # <p>A Boolean value indicating whether the snapshot was created from an automatic
    # snapshot.</p>
    @[Protocol::Field(location: :body, name: "isFromAutoSnapshot", required: false)]
    property is_from_auto_snapshot : Bool?
  end

  class GetDiskSnapshotResultStruct 
    include JSON1_1

    # <p>An object containing information about the disk snapshot.</p>
    @[Protocol::Field(location: :body, name: "diskSnapshot", required: false)]
    property disk_snapshot : DiskSnapshotStruct?
  end

  class GetDiskSnapshotsRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetDiskSnapshots</code> request. If your
    # results are paginated, the response will return a next page token that you can specify as the
    # page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetDiskSnapshotsResultStruct 
    include JSON1_1

    # <p>An array of objects containing information about all block storage disk snapshots.</p>
    @[Protocol::Field(location: :body, name: "diskSnapshots", required: false)]
    property disk_snapshots : Array(DiskSnapshotStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetDiskSnapshots</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetDistributionBundlesRequest 
    include JSON1_1

  end

  class DistributionBundleStruct 
    include JSON1_1

    # <p>The ID of the bundle.</p>
    @[Protocol::Field(location: :body, name: "bundleId", required: false)]
    property bundle_id : String?
    # <p>The name of the distribution bundle.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The monthly price, in US dollars, of the bundle.</p>
    @[Protocol::Field(location: :body, name: "price", required: false)]
    property price : Float32?
    # <p>The monthly network transfer quota of the bundle.</p>
    @[Protocol::Field(location: :body, name: "transferPerMonthInGb", required: false)]
    property transfer_per_month_in_gb : Int32?
    # <p>Indicates whether the bundle is active, and can be specified for a new
    # distribution.</p>
    @[Protocol::Field(location: :body, name: "isActive", required: false)]
    property is_active : Bool?
  end

  class GetDistributionBundlesResultStruct 
    include JSON1_1

    # <p>An object that describes a distribution bundle.</p>
    @[Protocol::Field(location: :body, name: "bundles", required: false)]
    property bundles : Array(DistributionBundleStruct)?
  end

  class GetDistributionLatestCacheResetRequest 
    include JSON1_1

    # <p>The name of the distribution for which to return the timestamp of the last cache
    # reset.</p>
    # <p>Use the <code>GetDistributions</code> action to get a list of distribution names that you
    # can specify.</p>
    # <p>When omitted, the response includes the latest cache reset timestamp of all your
    # distributions.</p>
    @[Protocol::Field(location: :body, name: "distributionName", required: false)]
    property distribution_name : String?
  end

  class GetDistributionLatestCacheResetResultStruct 
    include JSON1_1

    # <p>The status of the last cache reset.</p>
    @[Protocol::Field(location: :body, name: "status", required: false)]
    property status : String?
    # <p>The timestamp of the last cache reset (e.g., <code>1479734909.17</code>) in Unix time
    # format.</p>
    @[Protocol::Field(location: :body, name: "createTime", required: false)]
    property create_time : Time?
  end

  class GetDistributionMetricDataRequest 
    include JSON1_1

    # <p>The name of the distribution for which to get metric data.</p>
    # <p>Use the <code>GetDistributions</code> action to get a list of distribution names that you
    # can specify.</p>
    @[Protocol::Field(location: :body, name: "distributionName", required: true)]
    property distribution_name : String
    # <p>The metric for which you want to return information.</p>
    # <p>Valid distribution metric names are listed below, along with the most useful
    # <code>statistics</code> to include in your request, and the published <code>unit</code>
    # value.</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>Requests</code>
    # </b> - The total number of viewer
    # requests received by your Lightsail distribution, for all HTTP methods, and for both
    # HTTP and HTTPS requests.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>None</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>BytesDownloaded</code>
    # </b> - The number of bytes
    # downloaded by viewers for GET, HEAD, and OPTIONS requests.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>None</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>BytesUploaded </code>
    # </b> - The number of bytes
    # uploaded to your origin by your Lightsail distribution, using POST and PUT
    # requests.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>None</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>TotalErrorRate</code>
    # </b> - The percentage of all
    # viewer requests for which the response's HTTP status code was 4xx or 5xx.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Average</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Percent</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>4xxErrorRate</code>
    # </b> - The percentage of all
    # viewer requests for which the response's HTTP status cod was 4xx. In these cases, the
    # client or client viewer may have made an error. For example, a status code of 404 (Not
    # Found) means that the client requested an object that could not be found.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Average</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Percent</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>5xxErrorRate</code>
    # </b> - The percentage of all
    # viewer requests for which the response's HTTP status code was 5xx. In these cases, the
    # origin server did not satisfy the requests. For example, a status code of 503 (Service
    # Unavailable) means that the origin server is currently unavailable.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Average</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Percent</code>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "metricName", required: true)]
    property metric_name : String
    # <p>The start of the time interval for which to get metric data.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Specified in the Unix time format.</p>
    # <p>For example, if you wish to use a start time of October 1, 2018, at 8 PM UTC, specify
    # <code>1538424000</code> as the start time.</p>
    # </li>
    # </ul>
    # <p>You can convert a human-friendly time to Unix time format using a converter like <a href="https://www.epochconverter.com/">Epoch converter</a>.</p>
    @[Protocol::Field(location: :body, name: "startTime", required: true)]
    property start_time : Time
    # <p>The end of the time interval for which to get metric data.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Specified in the Unix time format.</p>
    # <p>For example, if you wish to use an end time of October 1, 2018, at 9 PM UTC, specify
    # <code>1538427600</code> as the end time.</p>
    # </li>
    # </ul>
    # <p>You can convert a human-friendly time to Unix time format using a converter like <a href="https://www.epochconverter.com/">Epoch converter</a>.</p>
    @[Protocol::Field(location: :body, name: "endTime", required: true)]
    property end_time : Time
    # <p>The granularity, in seconds, for the metric data points that will be returned.</p>
    @[Protocol::Field(location: :body, name: "period", required: true)]
    property period : Int32
    # <p>The unit for the metric data request.</p>
    # <p>Valid units depend on the metric data being requested. For the valid units with each
    # available metric, see the <code>metricName</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "unit", required: true)]
    property unit : String
    # <p>The statistic for the metric.</p>
    # <p>The following statistics are available:</p>
    # <ul>
    # <li>
    # <p>
    # <code>Minimum</code> - The lowest value observed during the specified period. Use this
    # value to determine low volumes of activity for your application.</p>
    # </li>
    # <li>
    # <p>
    # <code>Maximum</code> - The highest value observed during the specified period. Use
    # this value to determine high volumes of activity for your application.</p>
    # </li>
    # <li>
    # <p>
    # <code>Sum</code> - All values submitted for the matching metric added together. You
    # can use this statistic to determine the total volume of a metric.</p>
    # </li>
    # <li>
    # <p>
    # <code>Average</code> - The value of Sum / SampleCount during the specified period. By
    # comparing this statistic with the Minimum and Maximum values, you can determine the full
    # scope of a metric and how close the average use is to the Minimum and Maximum values. This
    # comparison helps you to know when to increase or decrease your resources.</p>
    # </li>
    # <li>
    # <p>
    # <code>SampleCount</code> - The count, or number, of data points used for the
    # statistical calculation.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "statistics", required: true)]
    property statistics : Array(String)
  end

  class GetDistributionMetricDataResultStruct 
    include JSON1_1

    # <p>The name of the metric returned.</p>
    @[Protocol::Field(location: :body, name: "metricName", required: false)]
    property metric_name : String?
    # <p>An array of objects that describe the metric data returned.</p>
    @[Protocol::Field(location: :body, name: "metricData", required: false)]
    property metric_data : Array(MetricDatapointStruct)?
  end

  class GetDistributionsRequest 
    include JSON1_1

    # <p>The name of the distribution for which to return information.</p>
    # <p>Use the <code>GetDistributions</code> action to get a list of distribution names that you
    # can specify.</p>
    # <p>When omitted, the response includes all of your distributions in the AWS Region where
    # the request is made.</p>
    @[Protocol::Field(location: :body, name: "distributionName", required: false)]
    property distribution_name : String?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetDistributions</code> request. If your
    # results are paginated, the response will return a next page token that you can specify as the
    # page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetDistributionsResultStruct 
    include JSON1_1

    # <p>An array of objects that describe your distributions.</p>
    @[Protocol::Field(location: :body, name: "distributions", required: false)]
    property distributions : Array(LightsailDistributionStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetDistributions</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetDomainRequest 
    include JSON1_1

    # <p>The domain name for which your want to return information about.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: true)]
    property domain_name : String
  end

  class DomainStruct 
    include JSON1_1

    # <p>The name of the domain.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the domain recordset (e.g.,
    # <code>arn:aws:lightsail:global:123456789101:Domain/824cede0-abc7-4f84-8dbc-12345EXAMPLE</code>).</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The support code. Include this code in your email to support when you have questions about
    # an instance or another resource in Lightsail. This code enables our support team to look up
    # your Lightsail information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>The date when the domain recordset was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The AWS Region and Availability Zones where the domain recordset was created.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The resource type. </p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>An array of key-value pairs containing information about the domain entries.</p>
    @[Protocol::Field(location: :body, name: "domainEntries", required: false)]
    property domain_entries : Array(DomainEntryStruct)?
  end

  class GetDomainResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about your get domain request.</p>
    @[Protocol::Field(location: :body, name: "domain", required: false)]
    property domain : DomainStruct?
  end

  class GetDomainsRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetDomains</code> request. If your results
    # are paginated, the response will return a next page token that you can specify as the page
    # token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetDomainsResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about each of the domain entries in the
    # user's account.</p>
    @[Protocol::Field(location: :body, name: "domains", required: false)]
    property domains : Array(DomainStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetDomains</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetExportSnapshotRecordsRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetExportSnapshotRecords</code> request. If
    # your results are paginated, the response will return a next page token that you can specify as
    # the page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class DiskInfoStruct 
    include JSON1_1

    # <p>The disk name.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The disk path.</p>
    @[Protocol::Field(location: :body, name: "path", required: false)]
    property path : String?
    # <p>The size of the disk in GB (e.g., <code>32</code>).</p>
    @[Protocol::Field(location: :body, name: "sizeInGb", required: false)]
    property size_in_gb : Int32?
    # <p>A Boolean value indicating whether this disk is a system disk (has an operating system
    # loaded on it).</p>
    @[Protocol::Field(location: :body, name: "isSystemDisk", required: false)]
    property is_system_disk : Bool?
  end

  class InstanceSnapshotInfoStruct 
    include JSON1_1

    # <p>The bundle ID from which the source instance was created (e.g.,
    # <code>micro_1_0</code>).</p>
    @[Protocol::Field(location: :body, name: "fromBundleId", required: false)]
    property from_bundle_id : String?
    # <p>The blueprint ID from which the source instance (e.g., <code>os_debian_8_3</code>).</p>
    @[Protocol::Field(location: :body, name: "fromBlueprintId", required: false)]
    property from_blueprint_id : String?
    # <p>A list of objects describing the disks that were attached to the source instance.</p>
    @[Protocol::Field(location: :body, name: "fromDiskInfo", required: false)]
    property from_disk_info : Array(DiskInfoStruct)?
  end

  class DiskSnapshotInfoStruct 
    include JSON1_1

    # <p>The size of the disk in GB (e.g., <code>32</code>).</p>
    @[Protocol::Field(location: :body, name: "sizeInGb", required: false)]
    property size_in_gb : Int32?
  end

  class ExportSnapshotRecordSourceInfoStruct 
    include JSON1_1

    # <p>The Lightsail resource type (e.g., <code>InstanceSnapshot</code> or
    # <code>DiskSnapshot</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The date when the source instance or disk snapshot was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The name of the source instance or disk snapshot.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the source instance or disk snapshot.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The name of the snapshot's source instance or disk.</p>
    @[Protocol::Field(location: :body, name: "fromResourceName", required: false)]
    property from_resource_name : String?
    # <p>The Amazon Resource Name (ARN) of the snapshot's source instance or disk.</p>
    @[Protocol::Field(location: :body, name: "fromResourceArn", required: false)]
    property from_resource_arn : String?
    # <p>A list of objects describing an instance snapshot.</p>
    @[Protocol::Field(location: :body, name: "instanceSnapshotInfo", required: false)]
    property instance_snapshot_info : InstanceSnapshotInfoStruct?
    # <p>A list of objects describing a disk snapshot.</p>
    @[Protocol::Field(location: :body, name: "diskSnapshotInfo", required: false)]
    property disk_snapshot_info : DiskSnapshotInfoStruct?
  end

  class ExportSnapshotRecordStruct 
    include JSON1_1

    # <p>The export snapshot record name.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the export snapshot record.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The date when the export snapshot record was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The AWS Region and Availability Zone where the export snapshot record is located.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The Lightsail resource type (e.g., <code>ExportSnapshotRecord</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The state of the export snapshot record.</p>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
    # <p>A list of objects describing the source of the export snapshot record.</p>
    @[Protocol::Field(location: :body, name: "sourceInfo", required: false)]
    property source_info : ExportSnapshotRecordSourceInfoStruct?
    # <p>A list of objects describing the destination of the export snapshot record.</p>
    @[Protocol::Field(location: :body, name: "destinationInfo", required: false)]
    property destination_info : DestinationInfoStruct?
  end

  class GetExportSnapshotRecordsResultStruct 
    include JSON1_1

    # <p>A list of objects describing the export snapshot records.</p>
    @[Protocol::Field(location: :body, name: "exportSnapshotRecords", required: false)]
    property export_snapshot_records : Array(ExportSnapshotRecordStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetExportSnapshotRecords</code>
    # request and specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetInstanceRequest 
    include JSON1_1

    # <p>The name of the instance.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
  end

  class InstanceHardwareStruct 
    include JSON1_1

    # <p>The number of vCPUs the instance has.</p>
    @[Protocol::Field(location: :body, name: "cpuCount", required: false)]
    property cpu_count : Int32?
    # <p>The disks attached to the instance.</p>
    @[Protocol::Field(location: :body, name: "disks", required: false)]
    property disks : Array(DiskStruct)?
    # <p>The amount of RAM in GB on the instance (e.g., <code>1.0</code>).</p>
    @[Protocol::Field(location: :body, name: "ramSizeInGb", required: false)]
    property ram_size_in_gb : Float32?
  end

  class MonthlyTransferStruct 
    include JSON1_1

    # <p>The amount allocated per month (in GB).</p>
    @[Protocol::Field(location: :body, name: "gbPerMonthAllocated", required: false)]
    property gb_per_month_allocated : Int32?
  end

  class InstancePortInfoStruct 
    include JSON1_1

    # <p>The first port in a range of open ports on an instance.</p>
    # <p>Allowed ports:</p>
    # <ul>
    # <li>
    # <p>TCP and UDP - <code>0</code> to <code>65535</code>
    # </p>
    # </li>
    # <li>
    # <p>ICMP - The ICMP type. For example, specify <code>8</code> as the <code>fromPort</code>
    # (ICMP type), and <code>-1</code> as the <code>toPort</code> (ICMP code), to enable ICMP
    # Ping. For more information, see <a href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control Messages</a> on <i>Wikipedia</i>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "fromPort", required: false)]
    property from_port : Int32?
    # <p>The last port in a range of open ports on an instance.</p>
    # <p>Allowed ports:</p>
    # <ul>
    # <li>
    # <p>TCP and UDP - <code>0</code> to <code>65535</code>
    # </p>
    # </li>
    # <li>
    # <p>ICMP - The ICMP code. For example, specify <code>8</code> as the <code>fromPort</code>
    # (ICMP type), and <code>-1</code> as the <code>toPort</code> (ICMP code), to enable ICMP
    # Ping. For more information, see <a href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control Messages</a> on <i>Wikipedia</i>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "toPort", required: false)]
    property to_port : Int32?
    # <p>The IP protocol name.</p>
    # <p>The name can be one of the following:</p>
    # <ul>
    # <li>
    # <p>
    # <code>tcp</code> - Transmission Control Protocol (TCP) provides reliable, ordered, and
    # error-checked delivery of streamed data between applications running on hosts
    # communicating by an IP network. If you have an application that doesn't require reliable
    # data stream service, use UDP instead.</p>
    # </li>
    # <li>
    # <p>
    # <code>all</code> - All transport layer protocol types. For more general information,
    # see <a href="https://en.wikipedia.org/wiki/Transport_layer">Transport layer</a> on
    # <i>Wikipedia</i>.</p>
    # </li>
    # <li>
    # <p>
    # <code>udp</code> - With User Datagram Protocol (UDP), computer applications can send
    # messages (or datagrams) to other hosts on an Internet Protocol (IP) network. Prior
    # communications are not required to set up transmission channels or data paths.
    # Applications that don't require reliable data stream service can use UDP, which provides a
    # connectionless datagram service that emphasizes reduced latency over reliability. If you
    # do require reliable data stream service, use TCP instead.</p>
    # </li>
    # <li>
    # <p>
    # <code>icmp</code> - Internet Control Message Protocol (ICMP) is used to send error
    # messages and operational information indicating success or failure when communicating with
    # an instance. For example, an error is indicated when an instance could not be reached.
    # When you specify <code>icmp</code> as the <code>protocol</code>, you must specify the ICMP
    # type using the <code>fromPort</code> parameter, and ICMP code using the
    # <code>toPort</code> parameter.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "protocol", required: false)]
    property protocol : String?
    # <p>The location from which access is allowed. For example, <code>Anywhere (0.0.0.0/0)</code>,
    # or <code>Custom</code> if a specific IP address or range of IP addresses is allowed.</p>
    @[Protocol::Field(location: :body, name: "accessFrom", required: false)]
    property access_from : String?
    # <p>The type of access (<code>Public</code> or <code>Private</code>).</p>
    @[Protocol::Field(location: :body, name: "accessType", required: false)]
    property access_type : String?
    # <p>The common name of the port information.</p>
    @[Protocol::Field(location: :body, name: "commonName", required: false)]
    property common_name : String?
    # <p>The access direction (<code>inbound</code> or <code>outbound</code>).</p>
    # <note>
    # <p>Lightsail currently supports only <code>inbound</code> access direction.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "accessDirection", required: false)]
    property access_direction : String?
    # <p>The IP address, or range of IP addresses in CIDR notation, that are allowed to connect to
    # an instance through the ports, and the protocol. Lightsail supports IPv4 addresses.</p>
    # <p>For more information about CIDR block notation, see <a href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless
    # Inter-Domain Routing</a> on <i>Wikipedia</i>.</p>
    @[Protocol::Field(location: :body, name: "cidrs", required: false)]
    property cidrs : Array(String)?
    # <p>An alias that defines access for a preconfigured range of IP addresses.</p>
    # <p>The only alias currently supported is <code>lightsail-connect</code>, which allows IP
    # addresses of the browser-based RDP/SSH client in the Lightsail console to connect to your
    # instance.</p>
    @[Protocol::Field(location: :body, name: "cidrListAliases", required: false)]
    property cidr_list_aliases : Array(String)?
  end

  class InstanceNetworkingStruct 
    include JSON1_1

    # <p>The amount of data in GB allocated for monthly data transfers.</p>
    @[Protocol::Field(location: :body, name: "monthlyTransfer", required: false)]
    property monthly_transfer : MonthlyTransferStruct?
    # <p>An array of key-value pairs containing information about the ports on the instance.</p>
    @[Protocol::Field(location: :body, name: "ports", required: false)]
    property ports : Array(InstancePortInfoStruct)?
  end

  class InstanceStateStruct 
    include JSON1_1

    # <p>The status code for the instance.</p>
    @[Protocol::Field(location: :body, name: "code", required: false)]
    property code : Int32?
    # <p>The state of the instance (e.g., <code>running</code> or <code>pending</code>).</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
  end

  class InstanceStruct 
    include JSON1_1

    # <p>The name the user gave the instance (e.g., <code>Amazon_Linux-1GB-Ohio-1</code>).</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the instance (e.g.,
    # <code>arn:aws:lightsail:us-east-2:123456789101:Instance/244ad76f-8aad-4741-809f-12345EXAMPLE</code>).</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The support code. Include this code in your email to support when you have questions about
    # an instance or another resource in Lightsail. This code enables our support team to look up
    # your Lightsail information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>The timestamp when the instance was created (e.g., <code>1479734909.17</code>) in Unix
    # time format.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The region name and Availability Zone where the instance is located.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The type of resource (usually <code>Instance</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>The blueprint ID (e.g., <code>os_amlinux_2016_03</code>).</p>
    @[Protocol::Field(location: :body, name: "blueprintId", required: false)]
    property blueprint_id : String?
    # <p>The friendly name of the blueprint (e.g., <code>Amazon Linux</code>).</p>
    @[Protocol::Field(location: :body, name: "blueprintName", required: false)]
    property blueprint_name : String?
    # <p>The bundle for the instance (e.g., <code>micro_1_0</code>).</p>
    @[Protocol::Field(location: :body, name: "bundleId", required: false)]
    property bundle_id : String?
    # <p>An array of objects representing the add-ons enabled on the instance.</p>
    @[Protocol::Field(location: :body, name: "addOns", required: false)]
    property add_ons : Array(AddOnStruct)?
    # <p>A Boolean value indicating whether this instance has a static IP assigned to it.</p>
    @[Protocol::Field(location: :body, name: "isStaticIp", required: false)]
    property is_static_ip : Bool?
    # <p>The private IP address of the instance.</p>
    @[Protocol::Field(location: :body, name: "privateIpAddress", required: false)]
    property private_ip_address : String?
    # <p>The public IP address of the instance.</p>
    @[Protocol::Field(location: :body, name: "publicIpAddress", required: false)]
    property public_ip_address : String?
    # <p>The IPv6 address of the instance.</p>
    @[Protocol::Field(location: :body, name: "ipv6Address", required: false)]
    property ipv6_address : String?
    # <p>The size of the vCPU and the amount of RAM for the instance.</p>
    @[Protocol::Field(location: :body, name: "hardware", required: false)]
    property hardware : InstanceHardwareStruct?
    # <p>Information about the public ports and monthly data transfer rates for the
    # instance.</p>
    @[Protocol::Field(location: :body, name: "networking", required: false)]
    property networking : InstanceNetworkingStruct?
    # <p>The status code and the state (e.g., <code>running</code>) for the instance.</p>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : InstanceStateStruct?
    # <p>The user name for connecting to the instance (e.g., <code>ec2-user</code>).</p>
    @[Protocol::Field(location: :body, name: "username", required: false)]
    property username : String?
    # <p>The name of the SSH key being used to connect to the instance (e.g.,
    # <code>LightsailDefaultKeyPair</code>).</p>
    @[Protocol::Field(location: :body, name: "sshKeyName", required: false)]
    property ssh_key_name : String?
  end

  class GetInstanceResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about the specified instance.</p>
    @[Protocol::Field(location: :body, name: "instance", required: false)]
    property instance : InstanceStruct?
  end

  class GetInstanceAccessDetailsRequest 
    include JSON1_1

    # <p>The name of the instance to access.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
    # <p>The protocol to use to connect to your instance. Defaults to <code>ssh</code>.</p>
    @[Protocol::Field(location: :body, name: "protocol", required: false)]
    property protocol : String?
  end

  class PasswordDataStruct 
    include JSON1_1

    # <p>The encrypted password. Ciphertext will be an empty string if access to your new instance
    # is not ready yet. When you create an instance, it can take up to 15 minutes for the instance
    # to be ready.</p>
    # <note>
    # <p>If you use the default key pair (<code>LightsailDefaultKeyPair</code>), the decrypted
    # password will be available in the password field.</p>
    # <p>If you are using a custom key pair, you need to use your own means of decryption.</p>
    # <p>If you change the Administrator password on the instance, Lightsail will continue to
    # return the original ciphertext value. When accessing the instance using RDP, you need to
    # manually enter the Administrator password after changing it from the default.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "ciphertext", required: false)]
    property ciphertext : String?
    # <p>The name of the key pair that you used when creating your instance. If no key pair name
    # was specified when creating the instance, Lightsail uses the default key pair
    # (<code>LightsailDefaultKeyPair</code>).</p>
    # <p>If you are using a custom key pair, you need to use your own means of decrypting your
    # password using the <code>ciphertext</code>. Lightsail creates the ciphertext by encrypting
    # your password with the public key part of this key pair.</p>
    @[Protocol::Field(location: :body, name: "keyPairName", required: false)]
    property key_pair_name : String?
  end

  class HostKeyAttributesStruct 
    include JSON1_1

    # <p>The SSH host key algorithm or the RDP certificate format.</p>
    # <p>For SSH host keys, the algorithm may be <code>ssh-rsa</code>,
    # <code>ecdsa-sha2-nistp256</code>, <code>ssh-ed25519</code>, etc. For RDP certificates, the
    # algorithm is always <code>x509-cert</code>.</p>
    @[Protocol::Field(location: :body, name: "algorithm", required: false)]
    property algorithm : String?
    # <p>The public SSH host key or the RDP certificate.</p>
    @[Protocol::Field(location: :body, name: "publicKey", required: false)]
    property public_key : String?
    # <p>The time that the SSH host key or RDP certificate was recorded by Lightsail.</p>
    @[Protocol::Field(location: :body, name: "witnessedAt", required: false)]
    property witnessed_at : Time?
    # <p>The SHA-1 fingerprint of the returned SSH host key or RDP certificate.</p>
    # <ul>
    # <li>
    # <p>Example of an SHA-1 SSH fingerprint:</p>
    # <p>
    # <code>SHA1:1CHH6FaAaXjtFOsR/t83vf91SR0</code>
    # </p>
    # </li>
    # <li>
    # <p>Example of an SHA-1 RDP fingerprint:</p>
    # <p>
    # <code>af:34:51:fe:09:f0:e0:da:b8:4e:56:ca:60:c2:10:ff:38:06:db:45</code>
    # </p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "fingerprintSHA1", required: false)]
    property fingerprint_sha1 : String?
    # <p>The SHA-256 fingerprint of the returned SSH host key or RDP certificate.</p>
    # <ul>
    # <li>
    # <p>Example of an SHA-256 SSH fingerprint:</p>
    # <p>
    # <code>SHA256:KTsMnRBh1IhD17HpdfsbzeGA4jOijm5tyXsMjKVbB8o</code>
    # </p>
    # </li>
    # <li>
    # <p>Example of an SHA-256 RDP fingerprint:</p>
    # <p>
    # <code>03:9b:36:9f:4b:de:4e:61:70:fc:7c:c9:78:e7:d2:1a:1c:25:a8:0c:91:f6:7c:e4:d6:a0:85:c8:b4:53:99:68</code>
    # </p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "fingerprintSHA256", required: false)]
    property fingerprint_sha256 : String?
    # <p>The returned RDP certificate is valid after this point in time.</p>
    # <p>This value is listed only for RDP certificates.</p>
    @[Protocol::Field(location: :body, name: "notValidBefore", required: false)]
    property not_valid_before : Time?
    # <p>The returned RDP certificate is not valid after this point in time.</p>
    # <p>This value is listed only for RDP certificates.</p>
    @[Protocol::Field(location: :body, name: "notValidAfter", required: false)]
    property not_valid_after : Time?
  end

  class InstanceAccessDetailsStruct 
    include JSON1_1

    # <p>For SSH access, the public key to use when accessing your instance For OpenSSH clients
    # (e.g., command line SSH), you should save this value to <code>tempkey-cert.pub</code>.</p>
    @[Protocol::Field(location: :body, name: "certKey", required: false)]
    property cert_key : String?
    # <p>For SSH access, the date on which the temporary keys expire.</p>
    @[Protocol::Field(location: :body, name: "expiresAt", required: false)]
    property expires_at : Time?
    # <p>The public IP address of the Amazon Lightsail instance.</p>
    @[Protocol::Field(location: :body, name: "ipAddress", required: false)]
    property ip_address : String?
    # <p>For RDP access, the password for your Amazon Lightsail instance. Password will be an empty
    # string if the password for your new instance is not ready yet. When you create an instance, it
    # can take up to 15 minutes for the instance to be ready.</p>
    # <note>
    # <p>If you create an instance using any key pair other than the default
    # (<code>LightsailDefaultKeyPair</code>), <code>password</code> will always be an empty
    # string.</p>
    # <p>If you change the Administrator password on the instance, Lightsail will continue to
    # return the original password value. When accessing the instance using RDP, you need to
    # manually enter the Administrator password after changing it from the default.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "password", required: false)]
    property password : String?
    # <p>For a Windows Server-based instance, an object with the data you can use to retrieve your
    # password. This is only needed if <code>password</code> is empty and the instance is not new
    # (and therefore the password is not ready yet). When you create an instance, it can take up to
    # 15 minutes for the instance to be ready.</p>
    @[Protocol::Field(location: :body, name: "passwordData", required: false)]
    property password_data : PasswordDataStruct?
    # <p>For SSH access, the temporary private key. For OpenSSH clients (e.g., command line SSH),
    # you should save this value to <code>tempkey</code>).</p>
    @[Protocol::Field(location: :body, name: "privateKey", required: false)]
    property private_key : String?
    # <p>The protocol for these Amazon Lightsail instance access details.</p>
    @[Protocol::Field(location: :body, name: "protocol", required: false)]
    property protocol : String?
    # <p>The name of this Amazon Lightsail instance.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: false)]
    property instance_name : String?
    # <p>The user name to use when logging in to the Amazon Lightsail instance.</p>
    @[Protocol::Field(location: :body, name: "username", required: false)]
    property username : String?
    # <p>Describes the public SSH host keys or the RDP certificate.</p>
    @[Protocol::Field(location: :body, name: "hostKeys", required: false)]
    property host_keys : Array(HostKeyAttributesStruct)?
  end

  class GetInstanceAccessDetailsResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about a get instance access
    # request.</p>
    @[Protocol::Field(location: :body, name: "accessDetails", required: false)]
    property access_details : InstanceAccessDetailsStruct?
  end

  class GetInstanceMetricDataRequest 
    include JSON1_1

    # <p>The name of the instance for which you want to get metrics data.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
    # <p>The metric for which you want to return information.</p>
    # <p>Valid instance metric names are listed below, along with the most useful
    # <code>statistics</code> to include in your request, and the published <code>unit</code>
    # value.</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>BurstCapacityPercentage</code>
    # </b> - The percentage
    # of CPU performance available for your instance to burst above its baseline. Your instance
    # continuously accrues and consumes burst capacity. Burst capacity stops accruing when your
    # instance's <code>BurstCapacityPercentage</code> reaches 100%. For more information, see
    # <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity">Viewing instance burst capacity in Amazon Lightsail</a>.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistics are <code>Maximum</code> and
    # <code>Average</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Percent</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>BurstCapacityTime</code>
    # </b> - The available amount
    # of time for your instance to burst at 100% CPU utilization. Your instance continuously
    # accrues and consumes burst capacity. Burst capacity time stops accruing when your
    # instance's <code>BurstCapacityPercentage</code> metric reaches 100%.</p>
    # <p>Burst capacity time is consumed at the full rate only when your instance operates at
    # 100% CPU utilization. For example, if your instance operates at 50% CPU utilization in the
    # burstable zone for a 5-minute period, then it consumes CPU burst capacity minutes at a 50%
    # rate in that period. Your instance consumed 2 minutes and 30 seconds of CPU burst capacity
    # minutes in the 5-minute period. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity">Viewing instance burst capacity in Amazon Lightsail</a>.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistics are <code>Maximum</code> and
    # <code>Average</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Seconds</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>CPUUtilization</code>
    # </b> - The percentage of
    # allocated compute units that are currently in use on the instance. This metric identifies
    # the processing power to run the applications on the instance. Tools in your operating
    # system can show a lower percentage than Lightsail when the instance is not allocated a
    # full processor core.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistics are <code>Maximum</code> and
    # <code>Average</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Percent</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>NetworkIn</code>
    # </b> - The number of bytes received
    # on all network interfaces by the instance. This metric identifies the volume of incoming
    # network traffic to the instance. The number reported is the number of bytes received
    # during the period. Because this metric is reported in 5-minute intervals, divide the
    # reported number by 300 to find Bytes/second.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Bytes</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>NetworkOut</code>
    # </b> - The number of bytes sent
    # out on all network interfaces by the instance. This metric identifies the volume of
    # outgoing network traffic from the instance. The number reported is the number of bytes
    # sent during the period. Because this metric is reported in 5-minute intervals, divide the
    # reported number by 300 to find Bytes/second.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Bytes</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>StatusCheckFailed</code>
    # </b> - Reports whether the
    # instance passed or failed both the instance status check and the system status check. This
    # metric can be either 0 (passed) or 1 (failed). This metric data is available in 1-minute
    # (60 seconds) granularity.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>StatusCheckFailed_Instance</code>
    # </b> - Reports
    # whether the instance passed or failed the instance status check. This metric can be either
    # 0 (passed) or 1 (failed). This metric data is available in 1-minute (60 seconds)
    # granularity.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>StatusCheckFailed_System</code>
    # </b> - Reports
    # whether the instance passed or failed the system status check. This metric can be either 0
    # (passed) or 1 (failed). This metric data is available in 1-minute (60 seconds)
    # granularity.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "metricName", required: true)]
    property metric_name : String
    # <p>The granularity, in seconds, of the returned data points.</p>
    # <p>The <code>StatusCheckFailed</code>, <code>StatusCheckFailed_Instance</code>, and
    # <code>StatusCheckFailed_System</code> instance metric data is available in 1-minute (60
    # seconds) granularity. All other instance metric data is available in 5-minute (300 seconds)
    # granularity.</p>
    @[Protocol::Field(location: :body, name: "period", required: true)]
    property period : Int32
    # <p>The start time of the time period.</p>
    @[Protocol::Field(location: :body, name: "startTime", required: true)]
    property start_time : Time
    # <p>The end time of the time period.</p>
    @[Protocol::Field(location: :body, name: "endTime", required: true)]
    property end_time : Time
    # <p>The unit for the metric data request. Valid units depend on the metric data being
    # requested. For the valid units to specify with each available metric, see the
    # <code>metricName</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "unit", required: true)]
    property unit : String
    # <p>The statistic for the metric.</p>
    # <p>The following statistics are available:</p>
    # <ul>
    # <li>
    # <p>
    # <code>Minimum</code> - The lowest value observed during the specified period. Use this
    # value to determine low volumes of activity for your application.</p>
    # </li>
    # <li>
    # <p>
    # <code>Maximum</code> - The highest value observed during the specified period. Use
    # this value to determine high volumes of activity for your application.</p>
    # </li>
    # <li>
    # <p>
    # <code>Sum</code> - All values submitted for the matching metric added together. You
    # can use this statistic to determine the total volume of a metric.</p>
    # </li>
    # <li>
    # <p>
    # <code>Average</code> - The value of Sum / SampleCount during the specified period. By
    # comparing this statistic with the Minimum and Maximum values, you can determine the full
    # scope of a metric and how close the average use is to the Minimum and Maximum values. This
    # comparison helps you to know when to increase or decrease your resources.</p>
    # </li>
    # <li>
    # <p>
    # <code>SampleCount</code> - The count, or number, of data points used for the
    # statistical calculation.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "statistics", required: true)]
    property statistics : Array(String)
  end

  class GetInstanceMetricDataResultStruct 
    include JSON1_1

    # <p>The name of the metric returned.</p>
    @[Protocol::Field(location: :body, name: "metricName", required: false)]
    property metric_name : String?
    # <p>An array of objects that describe the metric data returned.</p>
    @[Protocol::Field(location: :body, name: "metricData", required: false)]
    property metric_data : Array(MetricDatapointStruct)?
  end

  class GetInstancePortStatesRequest 
    include JSON1_1

    # <p>The name of the instance for which to return firewall port states.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
  end

  class InstancePortStateStruct 
    include JSON1_1

    # <p>The first port in a range of open ports on an instance.</p>
    # <p>Allowed ports:</p>
    # <ul>
    # <li>
    # <p>TCP and UDP - <code>0</code> to <code>65535</code>
    # </p>
    # </li>
    # <li>
    # <p>ICMP - The ICMP type. For example, specify <code>8</code> as the <code>fromPort</code>
    # (ICMP type), and <code>-1</code> as the <code>toPort</code> (ICMP code), to enable ICMP
    # Ping. For more information, see <a href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control Messages</a> on <i>Wikipedia</i>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "fromPort", required: false)]
    property from_port : Int32?
    # <p>The last port in a range of open ports on an instance.</p>
    # <p>Allowed ports:</p>
    # <ul>
    # <li>
    # <p>TCP and UDP - <code>0</code> to <code>65535</code>
    # </p>
    # </li>
    # <li>
    # <p>ICMP - The ICMP code. For example, specify <code>8</code> as the <code>fromPort</code>
    # (ICMP type), and <code>-1</code> as the <code>toPort</code> (ICMP code), to enable ICMP
    # Ping. For more information, see <a href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control Messages</a> on <i>Wikipedia</i>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "toPort", required: false)]
    property to_port : Int32?
    # <p>The IP protocol name.</p>
    # <p>The name can be one of the following:</p>
    # <ul>
    # <li>
    # <p>
    # <code>tcp</code> - Transmission Control Protocol (TCP) provides reliable, ordered, and
    # error-checked delivery of streamed data between applications running on hosts
    # communicating by an IP network. If you have an application that doesn't require reliable
    # data stream service, use UDP instead.</p>
    # </li>
    # <li>
    # <p>
    # <code>all</code> - All transport layer protocol types. For more general information,
    # see <a href="https://en.wikipedia.org/wiki/Transport_layer">Transport layer</a> on
    # <i>Wikipedia</i>.</p>
    # </li>
    # <li>
    # <p>
    # <code>udp</code> - With User Datagram Protocol (UDP), computer applications can send
    # messages (or datagrams) to other hosts on an Internet Protocol (IP) network. Prior
    # communications are not required to set up transmission channels or data paths.
    # Applications that don't require reliable data stream service can use UDP, which provides a
    # connectionless datagram service that emphasizes reduced latency over reliability. If you
    # do require reliable data stream service, use TCP instead.</p>
    # </li>
    # <li>
    # <p>
    # <code>icmp</code> - Internet Control Message Protocol (ICMP) is used to send error
    # messages and operational information indicating success or failure when communicating with
    # an instance. For example, an error is indicated when an instance could not be reached.
    # When you specify <code>icmp</code> as the <code>protocol</code>, you must specify the ICMP
    # type using the <code>fromPort</code> parameter, and ICMP code using the
    # <code>toPort</code> parameter.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "protocol", required: false)]
    property protocol : String?
    # <p>Specifies whether the instance port is <code>open</code> or <code>closed</code>.</p>
    # <note>
    # <p>The port state for Lightsail instances is always <code>open</code>.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
    # <p>The IP address, or range of IP addresses in CIDR notation, that are allowed to connect to
    # an instance through the ports, and the protocol. Lightsail supports IPv4 addresses.</p>
    # <p>For more information about CIDR block notation, see <a href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless
    # Inter-Domain Routing</a> on <i>Wikipedia</i>.</p>
    @[Protocol::Field(location: :body, name: "cidrs", required: false)]
    property cidrs : Array(String)?
    # <p>An alias that defines access for a preconfigured range of IP addresses.</p>
    # <p>The only alias currently supported is <code>lightsail-connect</code>, which allows IP
    # addresses of the browser-based RDP/SSH client in the Lightsail console to connect to your
    # instance.</p>
    @[Protocol::Field(location: :body, name: "cidrListAliases", required: false)]
    property cidr_list_aliases : Array(String)?
  end

  class GetInstancePortStatesResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the firewall port states for the specified
    # instance.</p>
    @[Protocol::Field(location: :body, name: "portStates", required: false)]
    property port_states : Array(InstancePortStateStruct)?
  end

  class GetInstancesRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetInstances</code> request. If your results
    # are paginated, the response will return a next page token that you can specify as the page
    # token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetInstancesResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about your instances.</p>
    @[Protocol::Field(location: :body, name: "instances", required: false)]
    property instances : Array(InstanceStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetInstances</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetInstanceSnapshotRequest 
    include JSON1_1

    # <p>The name of the snapshot for which you are requesting information.</p>
    @[Protocol::Field(location: :body, name: "instanceSnapshotName", required: true)]
    property instance_snapshot_name : String
  end

  class InstanceSnapshotStruct 
    include JSON1_1

    # <p>The name of the snapshot.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the snapshot (e.g.,
    # <code>arn:aws:lightsail:us-east-2:123456789101:InstanceSnapshot/d23b5706-3322-4d83-81e5-12345EXAMPLE</code>).</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The support code. Include this code in your email to support when you have questions about
    # an instance or another resource in Lightsail. This code enables our support team to look up
    # your Lightsail information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>The timestamp when the snapshot was created (e.g., <code>1479907467.024</code>).</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The region name and Availability Zone where you created the snapshot.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The type of resource (usually <code>InstanceSnapshot</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>The state the snapshot is in.</p>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
    # <p>The progress of the snapshot.</p>
    @[Protocol::Field(location: :body, name: "progress", required: false)]
    property progress : String?
    # <p>An array of disk objects containing information about all block storage disks.</p>
    @[Protocol::Field(location: :body, name: "fromAttachedDisks", required: false)]
    property from_attached_disks : Array(DiskStruct)?
    # <p>The instance from which the snapshot was created.</p>
    @[Protocol::Field(location: :body, name: "fromInstanceName", required: false)]
    property from_instance_name : String?
    # <p>The Amazon Resource Name (ARN) of the instance from which the snapshot was created (e.g.,
    # <code>arn:aws:lightsail:us-east-2:123456789101:Instance/64b8404c-ccb1-430b-8daf-12345EXAMPLE</code>).</p>
    @[Protocol::Field(location: :body, name: "fromInstanceArn", required: false)]
    property from_instance_arn : String?
    # <p>The blueprint ID from which you created the snapshot (e.g., <code>os_debian_8_3</code>). A
    # blueprint is a virtual private server (or <i>instance</i>) image used to create
    # instances quickly.</p>
    @[Protocol::Field(location: :body, name: "fromBlueprintId", required: false)]
    property from_blueprint_id : String?
    # <p>The bundle ID from which you created the snapshot (e.g., <code>micro_1_0</code>).</p>
    @[Protocol::Field(location: :body, name: "fromBundleId", required: false)]
    property from_bundle_id : String?
    # <p>A Boolean value indicating whether the snapshot was created from an automatic
    # snapshot.</p>
    @[Protocol::Field(location: :body, name: "isFromAutoSnapshot", required: false)]
    property is_from_auto_snapshot : Bool?
    # <p>The size in GB of the SSD.</p>
    @[Protocol::Field(location: :body, name: "sizeInGb", required: false)]
    property size_in_gb : Int32?
  end

  class GetInstanceSnapshotResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about the results of your get instance
    # snapshot request.</p>
    @[Protocol::Field(location: :body, name: "instanceSnapshot", required: false)]
    property instance_snapshot : InstanceSnapshotStruct?
  end

  class GetInstanceSnapshotsRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetInstanceSnapshots</code> request. If your
    # results are paginated, the response will return a next page token that you can specify as the
    # page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetInstanceSnapshotsResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about the results of your get instance
    # snapshots request.</p>
    @[Protocol::Field(location: :body, name: "instanceSnapshots", required: false)]
    property instance_snapshots : Array(InstanceSnapshotStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetInstanceSnapshots</code> request
    # and specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetInstanceStateRequest 
    include JSON1_1

    # <p>The name of the instance to get state information about.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
  end

  class GetInstanceStateResultStruct 
    include JSON1_1

    # <p>The state of the instance.</p>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : InstanceStateStruct?
  end

  class GetKeyPairRequest 
    include JSON1_1

    # <p>The name of the key pair for which you are requesting information.</p>
    @[Protocol::Field(location: :body, name: "keyPairName", required: true)]
    property key_pair_name : String
  end

  class GetKeyPairResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about the key pair.</p>
    @[Protocol::Field(location: :body, name: "keyPair", required: false)]
    property key_pair : KeyPairStruct?
  end

  class GetKeyPairsRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetKeyPairs</code> request. If your results
    # are paginated, the response will return a next page token that you can specify as the page
    # token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetKeyPairsResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about the key pairs.</p>
    @[Protocol::Field(location: :body, name: "keyPairs", required: false)]
    property key_pairs : Array(KeyPairStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetKeyPairs</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetLoadBalancerRequest 
    include JSON1_1

    # <p>The name of the load balancer.</p>
    @[Protocol::Field(location: :body, name: "loadBalancerName", required: true)]
    property load_balancer_name : String
  end

  class InstanceHealthSummaryStruct 
    include JSON1_1

    # <p>The name of the Lightsail instance for which you are requesting health check
    # data.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: false)]
    property instance_name : String?
    # <p>Describes the overall instance health. Valid values are below.</p>
    @[Protocol::Field(location: :body, name: "instanceHealth", required: false)]
    property instance_health : String?
    # <p>More information about the instance health. If the <code>instanceHealth</code> is
    # <code>healthy</code>, then an <code>instanceHealthReason</code> value is not
    # provided.</p>
    # <p>If <b>
    # <code>instanceHealth</code>
    # </b> is <code>initial</code>,
    # the <b>
    # <code>instanceHealthReason</code>
    # </b> value can be one of the
    # following:</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>Lb.RegistrationInProgress</code>
    # </b> - The target
    # instance is in the process of being registered with the load balancer.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Lb.InitialHealthChecking</code>
    # </b> - The
    # Lightsail load balancer is still sending the target instance the minimum number of
    # health checks required to determine its health status.</p>
    # </li>
    # </ul>
    # <p>If <b>
    # <code>instanceHealth</code>
    # </b> is <code>unhealthy</code>,
    # the <b>
    # <code>instanceHealthReason</code>
    # </b> value can be one of the
    # following:</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>Instance.ResponseCodeMismatch</code>
    # </b> - The
    # health checks did not return an expected HTTP code.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Instance.Timeout</code>
    # </b> - The health check
    # requests timed out.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Instance.FailedHealthChecks</code>
    # </b> - The health
    # checks failed because the connection to the target instance timed out, the target instance
    # response was malformed, or the target instance failed the health check for an unknown
    # reason.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Lb.InternalError</code>
    # </b> - The health checks
    # failed due to an internal error.</p>
    # </li>
    # </ul>
    # <p>If <b>
    # <code>instanceHealth</code>
    # </b> is <code>unused</code>,
    # the <b>
    # <code>instanceHealthReason</code>
    # </b> value can be one of the
    # following:</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>Instance.NotRegistered</code>
    # </b> - The target
    # instance is not registered with the target group.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Instance.NotInUse</code>
    # </b> - The target group is
    # not used by any load balancer, or the target instance is in an Availability Zone that is
    # not enabled for its load balancer.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Instance.IpUnusable</code>
    # </b> - The target IP
    # address is reserved for use by a Lightsail load balancer.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Instance.InvalidState</code>
    # </b> - The target is in
    # the stopped or terminated state.</p>
    # </li>
    # </ul>
    # <p>If <b>
    # <code>instanceHealth</code>
    # </b> is <code>draining</code>,
    # the <b>
    # <code>instanceHealthReason</code>
    # </b> value can be one of the
    # following:</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>Instance.DeregistrationInProgress</code>
    # </b> - The
    # target instance is in the process of being deregistered and the deregistration delay
    # period has not expired.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "instanceHealthReason", required: false)]
    property instance_health_reason : String?
  end

  class LoadBalancerTlsCertificateSummaryStruct 
    include JSON1_1

    # <p>The name of the SSL/TLS certificate.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>When <code>true</code>, the SSL/TLS certificate is attached to the Lightsail load
    # balancer.</p>
    @[Protocol::Field(location: :body, name: "isAttached", required: false)]
    property is_attached : Bool?
  end

  class LoadBalancerStruct 
    include JSON1_1

    # <p>The name of the load balancer (e.g., <code>my-load-balancer</code>).</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the load balancer.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The support code. Include this code in your email to support when you have questions about
    # your Lightsail load balancer. This code enables our support team to look up your Lightsail
    # information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>The date when your load balancer was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The AWS Region where your load balancer was created (e.g., <code>us-east-2a</code>).
    # Lightsail automatically creates your load balancer across Availability Zones.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The resource type (e.g., <code>LoadBalancer</code>.</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>The DNS name of your Lightsail load balancer.</p>
    @[Protocol::Field(location: :body, name: "dnsName", required: false)]
    property dns_name : String?
    # <p>The status of your load balancer. Valid values are below.</p>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
    # <p>The protocol you have enabled for your load balancer. Valid values are below.</p>
    # <p>You can't just have <code>HTTP_HTTPS</code>, but you can have just
    # <code>HTTP</code>.</p>
    @[Protocol::Field(location: :body, name: "protocol", required: false)]
    property protocol : String?
    # <p>An array of public port settings for your load balancer. For HTTP, use port 80. For HTTPS,
    # use port 443.</p>
    @[Protocol::Field(location: :body, name: "publicPorts", required: false)]
    property public_ports : Array(Int32)?
    # <p>The path you specified to perform your health checks. If no path is specified, the load
    # balancer tries to make a request to the default (root) page.</p>
    @[Protocol::Field(location: :body, name: "healthCheckPath", required: false)]
    property health_check_path : String?
    # <p>The port where the load balancer will direct traffic to your Lightsail instances. For
    # HTTP traffic, it's port 80. For HTTPS traffic, it's port 443.</p>
    @[Protocol::Field(location: :body, name: "instancePort", required: false)]
    property instance_port : Int32?
    # <p>An array of InstanceHealthSummary objects describing the health of the load
    # balancer.</p>
    @[Protocol::Field(location: :body, name: "instanceHealthSummary", required: false)]
    property instance_health_summary : Array(InstanceHealthSummaryStruct)?
    # <p>An array of LoadBalancerTlsCertificateSummary objects that provide additional information
    # about the SSL/TLS certificates. For example, if <code>true</code>, the certificate is attached
    # to the load balancer.</p>
    @[Protocol::Field(location: :body, name: "tlsCertificateSummaries", required: false)]
    property tls_certificate_summaries : Array(LoadBalancerTlsCertificateSummaryStruct)?
    # <p>A string to string map of the configuration options for your load balancer. Valid values
    # are listed below.</p>
    @[Protocol::Field(location: :body, name: "configurationOptions", required: false)]
    property configuration_options : Hash(String, String)?
  end

  class GetLoadBalancerResultStruct 
    include JSON1_1

    # <p>An object containing information about your load balancer.</p>
    @[Protocol::Field(location: :body, name: "loadBalancer", required: false)]
    property load_balancer : LoadBalancerStruct?
  end

  class GetLoadBalancerMetricDataRequest 
    include JSON1_1

    # <p>The name of the load balancer.</p>
    @[Protocol::Field(location: :body, name: "loadBalancerName", required: true)]
    property load_balancer_name : String
    # <p>The metric for which you want to return information.</p>
    # <p>Valid load balancer metric names are listed below, along with the most useful
    # <code>statistics</code> to include in your request, and the published <code>unit</code>
    # value.</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>ClientTLSNegotiationErrorCount</code>
    # </b> - The
    # number of TLS connections initiated by the client that did not establish a session with
    # the load balancer due to a TLS error generated by the load balancer. Possible causes
    # include a mismatch of ciphers or protocols.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>HealthyHostCount</code>
    # </b> - The number of target
    # instances that are considered healthy.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic are <code>Average</code>,
    # <code>Minimum</code>, and <code>Maximum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>HTTPCode_Instance_2XX_Count</code>
    # </b> - The number
    # of HTTP 2XX response codes generated by the target instances. This does not include any
    # response codes generated by the load balancer.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that
    # <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return
    # <code>1</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>HTTPCode_Instance_3XX_Count</code>
    # </b> - The number
    # of HTTP 3XX response codes generated by the target instances. This does not include any
    # response codes generated by the load balancer.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that
    # <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return
    # <code>1</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>HTTPCode_Instance_4XX_Count</code>
    # </b> - The number
    # of HTTP 4XX response codes generated by the target instances. This does not include any
    # response codes generated by the load balancer.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that
    # <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return
    # <code>1</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>HTTPCode_Instance_5XX_Count</code>
    # </b> - The number
    # of HTTP 5XX response codes generated by the target instances. This does not include any
    # response codes generated by the load balancer.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that
    # <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return
    # <code>1</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>HTTPCode_LB_4XX_Count</code>
    # </b> - The number of
    # HTTP 4XX client error codes that originated from the load balancer. Client errors are
    # generated when requests are malformed or incomplete. These requests were not received by
    # the target instance. This count does not include response codes generated by the target
    # instances.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that
    # <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return
    # <code>1</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>HTTPCode_LB_5XX_Count</code>
    # </b> - The number of
    # HTTP 5XX server error codes that originated from the load balancer. This does not include
    # any response codes generated by the target instance. This metric is reported if there are
    # no healthy instances attached to the load balancer, or if the request rate exceeds the
    # capacity of the instances (spillover) or the load balancer.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that
    # <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return
    # <code>1</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>InstanceResponseTime</code>
    # </b> - The time elapsed,
    # in seconds, after the request leaves the load balancer until a response from the target
    # instance is received.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Average</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Seconds</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>RejectedConnectionCount</code>
    # </b> - The number of
    # connections that were rejected because the load balancer had reached its maximum number of
    # connections.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>RequestCount</code>
    # </b> - The number of requests
    # processed over IPv4. This count includes only the requests with a response generated by a
    # target instance of the load balancer.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that
    # <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return
    # <code>1</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>UnhealthyHostCount</code>
    # </b> - The number of
    # target instances that are considered unhealthy.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic are <code>Average</code>,
    # <code>Minimum</code>, and <code>Maximum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "metricName", required: true)]
    property metric_name : String
    # <p>The granularity, in seconds, of the returned data points.</p>
    @[Protocol::Field(location: :body, name: "period", required: true)]
    property period : Int32
    # <p>The start time of the period.</p>
    @[Protocol::Field(location: :body, name: "startTime", required: true)]
    property start_time : Time
    # <p>The end time of the period.</p>
    @[Protocol::Field(location: :body, name: "endTime", required: true)]
    property end_time : Time
    # <p>The unit for the metric data request. Valid units depend on the metric data being
    # requested. For the valid units with each available metric, see the <code>metricName</code>
    # parameter.</p>
    @[Protocol::Field(location: :body, name: "unit", required: true)]
    property unit : String
    # <p>The statistic for the metric.</p>
    # <p>The following statistics are available:</p>
    # <ul>
    # <li>
    # <p>
    # <code>Minimum</code> - The lowest value observed during the specified period. Use this
    # value to determine low volumes of activity for your application.</p>
    # </li>
    # <li>
    # <p>
    # <code>Maximum</code> - The highest value observed during the specified period. Use
    # this value to determine high volumes of activity for your application.</p>
    # </li>
    # <li>
    # <p>
    # <code>Sum</code> - All values submitted for the matching metric added together. You
    # can use this statistic to determine the total volume of a metric.</p>
    # </li>
    # <li>
    # <p>
    # <code>Average</code> - The value of Sum / SampleCount during the specified period. By
    # comparing this statistic with the Minimum and Maximum values, you can determine the full
    # scope of a metric and how close the average use is to the Minimum and Maximum values. This
    # comparison helps you to know when to increase or decrease your resources.</p>
    # </li>
    # <li>
    # <p>
    # <code>SampleCount</code> - The count, or number, of data points used for the
    # statistical calculation.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "statistics", required: true)]
    property statistics : Array(String)
  end

  class GetLoadBalancerMetricDataResultStruct 
    include JSON1_1

    # <p>The name of the metric returned.</p>
    @[Protocol::Field(location: :body, name: "metricName", required: false)]
    property metric_name : String?
    # <p>An array of objects that describe the metric data returned.</p>
    @[Protocol::Field(location: :body, name: "metricData", required: false)]
    property metric_data : Array(MetricDatapointStruct)?
  end

  class GetLoadBalancersRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetLoadBalancers</code> request. If your
    # results are paginated, the response will return a next page token that you can specify as the
    # page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetLoadBalancersResultStruct 
    include JSON1_1

    # <p>An array of LoadBalancer objects describing your load balancers.</p>
    @[Protocol::Field(location: :body, name: "loadBalancers", required: false)]
    property load_balancers : Array(LoadBalancerStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetLoadBalancers</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetLoadBalancerTlsCertificatesRequest 
    include JSON1_1

    # <p>The name of the load balancer you associated with your SSL/TLS certificate.</p>
    @[Protocol::Field(location: :body, name: "loadBalancerName", required: true)]
    property load_balancer_name : String
  end

  class LoadBalancerTlsCertificateDomainValidationRecordStruct 
    include JSON1_1

    # <p>A fully qualified domain name in the certificate. For example,
    # <code>example.com</code>.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The type of validation record. For example, <code>CNAME</code> for domain
    # validation.</p>
    @[Protocol::Field(location: :body, name: "type", required: false)]
    property type : String?
    # <p>The value for that type.</p>
    @[Protocol::Field(location: :body, name: "value", required: false)]
    property value : String?
    # <p>The validation status. Valid values are listed below.</p>
    @[Protocol::Field(location: :body, name: "validationStatus", required: false)]
    property validation_status : String?
    # <p>The domain name against which your SSL/TLS certificate was validated.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: false)]
    property domain_name : String?
  end

  class LoadBalancerTlsCertificateDomainValidationOptionStruct 
    include JSON1_1

    # <p>The fully qualified domain name in the certificate request.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: false)]
    property domain_name : String?
    # <p>The status of the domain validation. Valid values are listed below.</p>
    @[Protocol::Field(location: :body, name: "validationStatus", required: false)]
    property validation_status : String?
  end

  class LoadBalancerTlsCertificateRenewalSummaryStruct 
    include JSON1_1

    # <p>The renewal status of the certificate.</p>
    # <p>The following renewal status are possible:</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>PendingAutoRenewal</code>
    # </b> - Lightsail is
    # attempting to automatically validate the domain names of the certificate. No further
    # action is required. </p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>PendingValidation</code>
    # </b> - Lightsail couldn't
    # automatically validate one or more domain names of the certificate. You must take action
    # to validate these domain names or the certificate won't be renewed. Check to make sure
    # your certificate's domain validation records exist in your domain's DNS, and that your
    # certificate remains in use.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Success</code>
    # </b> - All domain names in the
    # certificate are validated, and Lightsail renewed the certificate. No further action is
    # required. </p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Failed</code>
    # </b> - One or more domain names were
    # not validated before the certificate expired, and Lightsail did not renew the
    # certificate. You can request a new certificate using the <code>CreateCertificate</code>
    # action.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "renewalStatus", required: false)]
    property renewal_status : String?
    # <p>Contains information about the validation of each domain name in the certificate, as it
    # pertains to Lightsail's managed renewal. This is different from the initial validation that
    # occurs as a result of the RequestCertificate request.</p>
    @[Protocol::Field(location: :body, name: "domainValidationOptions", required: false)]
    property domain_validation_options : Array(LoadBalancerTlsCertificateDomainValidationOptionStruct)?
  end

  class LoadBalancerTlsCertificateStruct 
    include JSON1_1

    # <p>The name of the SSL/TLS certificate (e.g., <code>my-certificate</code>).</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the SSL/TLS certificate.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The support code. Include this code in your email to support when you have questions about
    # your Lightsail load balancer or SSL/TLS certificate. This code enables our support team to
    # look up your Lightsail information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>The time when you created your SSL/TLS certificate.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The AWS Region and Availability Zone where you created your certificate.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The resource type (e.g., <code>LoadBalancerTlsCertificate</code>).</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>Instance</code>
    # </b> - A Lightsail instance (a
    # virtual private server)</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>StaticIp</code>
    # </b> - A static IP address</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>KeyPair</code>
    # </b> - The key pair used to connect
    # to a Lightsail instance</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>InstanceSnapshot</code>
    # </b> - A Lightsail
    # instance snapshot</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Domain</code>
    # </b> - A DNS zone</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>PeeredVpc</code>
    # </b> - A peered VPC</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>LoadBalancer</code>
    # </b> - A Lightsail load
    # balancer</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>LoadBalancerTlsCertificate</code>
    # </b> - An SSL/TLS
    # certificate associated with a Lightsail load balancer</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>Disk</code>
    # </b> - A Lightsail block storage
    # disk</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>DiskSnapshot</code>
    # </b> - A block storage disk
    # snapshot</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>The load balancer name where your SSL/TLS certificate is attached.</p>
    @[Protocol::Field(location: :body, name: "loadBalancerName", required: false)]
    property load_balancer_name : String?
    # <p>When <code>true</code>, the SSL/TLS certificate is attached to the Lightsail load
    # balancer.</p>
    @[Protocol::Field(location: :body, name: "isAttached", required: false)]
    property is_attached : Bool?
    # <p>The validation status of the SSL/TLS certificate. Valid values are below.</p>
    @[Protocol::Field(location: :body, name: "status", required: false)]
    property status : String?
    # <p>The domain name for your SSL/TLS certificate.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: false)]
    property domain_name : String?
    # <p>An array of LoadBalancerTlsCertificateDomainValidationRecord objects describing the
    # records.</p>
    @[Protocol::Field(location: :body, name: "domainValidationRecords", required: false)]
    property domain_validation_records : Array(LoadBalancerTlsCertificateDomainValidationRecordStruct)?
    # <p>The validation failure reason, if any, of the certificate.</p>
    # 
    # <p>The following failure reasons are possible:</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>NO_AVAILABLE_CONTACTS</code>
    # </b> - This failure
    # applies to email validation, which is not available for Lightsail certificates.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>ADDITIONAL_VERIFICATION_REQUIRED</code>
    # </b> -
    # Lightsail requires additional information to process this certificate request. This can
    # happen as a fraud-protection measure, such as when the domain ranks within the Alexa top
    # 1000 websites. To provide the required information, use the <a href="https://console.aws.amazon.com/support/home">AWS Support Center</a> to contact
    # AWS Support.</p>
    # <note>
    # <p>You cannot request a certificate for Amazon-owned domain names such as those ending
    # in amazonaws.com, cloudfront.net, or elasticbeanstalk.com.</p>
    # </note>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>DOMAIN_NOT_ALLOWED</code>
    # </b> - One or more of the
    # domain names in the certificate request was reported as an unsafe domain by <a href="https://www.virustotal.com/gui/home/url">VirusTotal</a>. To correct the
    # problem, search for your domain name on the <a href="https://www.virustotal.com/gui/home/url">VirusTotal</a> website. If your domain
    # is reported as suspicious, see <a href="https://www.google.com/webmasters/hacked/?hl=en">Google Help for Hacked
    # Websites</a> to learn what you can do.</p>
    # <p>If you believe that the result is a false positive, notify the organization that is
    # reporting the domain. VirusTotal is an aggregate of several antivirus and URL scanners and
    # cannot remove your domain from a block list itself. After you correct the problem and the
    # VirusTotal registry has been updated, request a new certificate.</p>
    # <p>If you see this error and your domain is not included in the VirusTotal list, visit
    # the <a href="https://console.aws.amazon.com/support/home">AWS Support Center</a>
    # and create a case.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>INVALID_PUBLIC_DOMAIN</code>
    # </b> - One or more of
    # the domain names in the certificate request is not valid. Typically, this is because a
    # domain name in the request is not a valid top-level domain. Try to request a certificate
    # again, correcting any spelling errors or typos that were in the failed request, and ensure
    # that all domain names in the request are for valid top-level domains. For example, you
    # cannot request a certificate for <code>example.invalidpublicdomain</code> because
    # <code>invalidpublicdomain</code> is not a valid top-level domain.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>OTHER</code>
    # </b> - Typically, this failure occurs
    # when there is a typographical error in one or more of the domain names in the certificate
    # request. Try to request a certificate again, correcting any spelling errors or typos that
    # were in the failed request. </p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "failureReason", required: false)]
    property failure_reason : String?
    # <p>The time when the SSL/TLS certificate was issued.</p>
    @[Protocol::Field(location: :body, name: "issuedAt", required: false)]
    property issued_at : Time?
    # <p>The issuer of the certificate.</p>
    @[Protocol::Field(location: :body, name: "issuer", required: false)]
    property issuer : String?
    # <p>The algorithm used to generate the key pair (the public and private key).</p>
    @[Protocol::Field(location: :body, name: "keyAlgorithm", required: false)]
    property key_algorithm : String?
    # <p>The timestamp when the SSL/TLS certificate expires.</p>
    @[Protocol::Field(location: :body, name: "notAfter", required: false)]
    property not_after : Time?
    # <p>The timestamp when the SSL/TLS certificate is first valid.</p>
    @[Protocol::Field(location: :body, name: "notBefore", required: false)]
    property not_before : Time?
    # <p>An object that describes the status of the certificate renewal managed by
    # Lightsail.</p>
    @[Protocol::Field(location: :body, name: "renewalSummary", required: false)]
    property renewal_summary : LoadBalancerTlsCertificateRenewalSummaryStruct?
    # <p>The reason the certificate was revoked. This value is present only when the certificate
    # status is <code>REVOKED</code>.</p>
    @[Protocol::Field(location: :body, name: "revocationReason", required: false)]
    property revocation_reason : String?
    # <p>The timestamp when the certificate was revoked. This value is present only when the
    # certificate status is <code>REVOKED</code>.</p>
    @[Protocol::Field(location: :body, name: "revokedAt", required: false)]
    property revoked_at : Time?
    # <p>The serial number of the certificate.</p>
    @[Protocol::Field(location: :body, name: "serial", required: false)]
    property serial : String?
    # <p>The algorithm that was used to sign the certificate.</p>
    @[Protocol::Field(location: :body, name: "signatureAlgorithm", required: false)]
    property signature_algorithm : String?
    # <p>The name of the entity that is associated with the public key contained in the
    # certificate.</p>
    @[Protocol::Field(location: :body, name: "subject", required: false)]
    property subject : String?
    # <p>An array of strings that specify the alternate domains (e.g., <code>example2.com</code>)
    # and subdomains (e.g., <code>blog.example.com</code>) for the certificate.</p>
    @[Protocol::Field(location: :body, name: "subjectAlternativeNames", required: false)]
    property subject_alternative_names : Array(String)?
  end

  class GetLoadBalancerTlsCertificatesResultStruct 
    include JSON1_1

    # <p>An array of LoadBalancerTlsCertificate objects describing your SSL/TLS
    # certificates.</p>
    @[Protocol::Field(location: :body, name: "tlsCertificates", required: false)]
    property tls_certificates : Array(LoadBalancerTlsCertificateStruct)?
  end

  class GetOperationRequest 
    include JSON1_1

    # <p>A GUID used to identify the operation.</p>
    @[Protocol::Field(location: :body, name: "operationId", required: true)]
    property operation_id : String
  end

  class GetOperationResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class GetOperationsRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetOperations</code> request. If your
    # results are paginated, the response will return a next page token that you can specify as the
    # page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetOperationsResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetOperations</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetOperationsForResourceRequest 
    include JSON1_1

    # <p>The name of the resource for which you are requesting information.</p>
    @[Protocol::Field(location: :body, name: "resourceName", required: true)]
    property resource_name : String
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetOperationsForResource</code> request. If
    # your results are paginated, the response will return a next page token that you can specify as
    # the page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetOperationsForResourceResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
    # <p>(Deprecated) Returns the number of pages of results that remain.</p>
    # <note>
    # <p>In releases prior to June 12, 2017, this parameter returned <code>null</code> by the
    # API. It is now deprecated, and the API returns the <code>next page token</code> parameter
    # instead.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "nextPageCount", required: false)]
    property next_page_count : String?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetOperationsForResource</code>
    # request and specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetRegionsRequest 
    include JSON1_1

    # <p>A Boolean value indicating whether to also include Availability Zones in your get regions
    # request. Availability Zones are indicated with a letter: e.g., <code>us-east-2a</code>.</p>
    @[Protocol::Field(location: :body, name: "includeAvailabilityZones", required: false)]
    property include_availability_zones : Bool?
    # <p>A Boolean value indicating whether to also include Availability Zones for databases in
    # your get regions request. Availability Zones are indicated with a letter (e.g.,
    # <code>us-east-2a</code>).</p>
    @[Protocol::Field(location: :body, name: "includeRelationalDatabaseAvailabilityZones", required: false)]
    property include_relational_database_availability_zones : Bool?
  end

  class AvailabilityZoneStruct 
    include JSON1_1

    # <p>The name of the Availability Zone. The format is <code>us-east-2a</code>
    # (case-sensitive).</p>
    @[Protocol::Field(location: :body, name: "zoneName", required: false)]
    property zone_name : String?
    # <p>The state of the Availability Zone.</p>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
  end

  class RegionStruct 
    include JSON1_1

    # <p>The continent code (e.g., <code>NA</code>, meaning North America).</p>
    @[Protocol::Field(location: :body, name: "continentCode", required: false)]
    property continent_code : String?
    # <p>The description of the AWS Region (e.g., <code>This region is recommended to serve users
    # in the eastern United States and eastern Canada</code>).</p>
    @[Protocol::Field(location: :body, name: "description", required: false)]
    property description : String?
    # <p>The display name (e.g., <code>Ohio</code>).</p>
    @[Protocol::Field(location: :body, name: "displayName", required: false)]
    property display_name : String?
    # <p>The region name (e.g., <code>us-east-2</code>).</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Availability Zones. Follows the format <code>us-east-2a</code>
    # (case-sensitive).</p>
    @[Protocol::Field(location: :body, name: "availabilityZones", required: false)]
    property availability_zones : Array(AvailabilityZoneStruct)?
    # <p>The Availability Zones for databases. Follows the format <code>us-east-2a</code>
    # (case-sensitive).</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseAvailabilityZones", required: false)]
    property relational_database_availability_zones : Array(AvailabilityZoneStruct)?
  end

  class GetRegionsResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about your get regions request.</p>
    @[Protocol::Field(location: :body, name: "regions", required: false)]
    property regions : Array(RegionStruct)?
  end

  class GetRelationalDatabaseRequest 
    include JSON1_1

    # <p>The name of the database that you are looking up.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
  end

  class RelationalDatabaseHardwareStruct 
    include JSON1_1

    # <p>The number of vCPUs for the database.</p>
    @[Protocol::Field(location: :body, name: "cpuCount", required: false)]
    property cpu_count : Int32?
    # <p>The size of the disk for the database.</p>
    @[Protocol::Field(location: :body, name: "diskSizeInGb", required: false)]
    property disk_size_in_gb : Int32?
    # <p>The amount of RAM in GB for the database.</p>
    @[Protocol::Field(location: :body, name: "ramSizeInGb", required: false)]
    property ram_size_in_gb : Float32?
  end

  class PendingModifiedRelationalDatabaseValuesStruct 
    include JSON1_1

    # <p>The password for the master user of the database.</p>
    @[Protocol::Field(location: :body, name: "masterUserPassword", required: false)]
    property master_user_password : String?
    # <p>The database engine version.</p>
    @[Protocol::Field(location: :body, name: "engineVersion", required: false)]
    property engine_version : String?
    # <p>A Boolean value indicating whether automated backup retention is enabled.</p>
    @[Protocol::Field(location: :body, name: "backupRetentionEnabled", required: false)]
    property backup_retention_enabled : Bool?
  end

  class RelationalDatabaseEndpointStruct 
    include JSON1_1

    # <p>Specifies the port that the database is listening on.</p>
    @[Protocol::Field(location: :body, name: "port", required: false)]
    property port : Int32?
    # <p>Specifies the DNS address of the database.</p>
    @[Protocol::Field(location: :body, name: "address", required: false)]
    property address : String?
  end

  class PendingMaintenanceActionStruct 
    include JSON1_1

    # <p>The type of pending database maintenance action.</p>
    @[Protocol::Field(location: :body, name: "action", required: false)]
    property action : String?
    # <p>Additional detail about the pending database maintenance action.</p>
    @[Protocol::Field(location: :body, name: "description", required: false)]
    property description : String?
    # <p>The effective date of the pending database maintenance action.</p>
    @[Protocol::Field(location: :body, name: "currentApplyDate", required: false)]
    property current_apply_date : Time?
  end

  class RelationalDatabaseStruct 
    include JSON1_1

    # <p>The unique name of the database resource in Lightsail.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the database.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The support code for the database. Include this code in your email to support when you
    # have questions about a database in Lightsail. This code enables our support team to look up
    # your Lightsail information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>The timestamp when the database was created. Formatted in Unix time.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The Region name and Availability Zone where the database is located.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The Lightsail resource type for the database (for example,
    # <code>RelationalDatabase</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>The blueprint ID for the database. A blueprint describes the major engine version of a
    # database.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseBlueprintId", required: false)]
    property relational_database_blueprint_id : String?
    # <p>The bundle ID for the database. A bundle describes the performance specifications for your
    # database.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseBundleId", required: false)]
    property relational_database_bundle_id : String?
    # <p>The name of the master database created when the Lightsail database resource is
    # created.</p>
    @[Protocol::Field(location: :body, name: "masterDatabaseName", required: false)]
    property master_database_name : String?
    # <p>Describes the hardware of the database.</p>
    @[Protocol::Field(location: :body, name: "hardware", required: false)]
    property hardware : RelationalDatabaseHardwareStruct?
    # <p>Describes the current state of the database.</p>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
    # <p>Describes the secondary Availability Zone of a high availability database.</p>
    # <p>The secondary database is used for failover support of a high availability
    # database.</p>
    @[Protocol::Field(location: :body, name: "secondaryAvailabilityZone", required: false)]
    property secondary_availability_zone : String?
    # <p>A Boolean value indicating whether automated backup retention is enabled for the
    # database.</p>
    @[Protocol::Field(location: :body, name: "backupRetentionEnabled", required: false)]
    property backup_retention_enabled : Bool?
    # <p>Describes pending database value modifications.</p>
    @[Protocol::Field(location: :body, name: "pendingModifiedValues", required: false)]
    property pending_modified_values : PendingModifiedRelationalDatabaseValuesStruct?
    # <p>The database software (for example, <code>MySQL</code>).</p>
    @[Protocol::Field(location: :body, name: "engine", required: false)]
    property engine : String?
    # <p>The database engine version (for example, <code>5.7.23</code>).</p>
    @[Protocol::Field(location: :body, name: "engineVersion", required: false)]
    property engine_version : String?
    # <p>The latest point in time to which the database can be restored. Formatted in Unix
    # time.</p>
    @[Protocol::Field(location: :body, name: "latestRestorableTime", required: false)]
    property latest_restorable_time : Time?
    # <p>The master user name of the database.</p>
    @[Protocol::Field(location: :body, name: "masterUsername", required: false)]
    property master_username : String?
    # <p>The status of parameter updates for the database.</p>
    @[Protocol::Field(location: :body, name: "parameterApplyStatus", required: false)]
    property parameter_apply_status : String?
    # <p>The daily time range during which automated backups are created for the database (for
    # example, <code>16:00-16:30</code>).</p>
    @[Protocol::Field(location: :body, name: "preferredBackupWindow", required: false)]
    property preferred_backup_window : String?
    # <p>The weekly time range during which system maintenance can occur on the database.</p>
    # <p>In the format <code>ddd:hh24:mi-ddd:hh24:mi</code>. For example,
    # <code>Tue:17:00-Tue:17:30</code>.</p>
    @[Protocol::Field(location: :body, name: "preferredMaintenanceWindow", required: false)]
    property preferred_maintenance_window : String?
    # <p>A Boolean value indicating whether the database is publicly accessible.</p>
    @[Protocol::Field(location: :body, name: "publiclyAccessible", required: false)]
    property publicly_accessible : Bool?
    # <p>The master endpoint for the database.</p>
    @[Protocol::Field(location: :body, name: "masterEndpoint", required: false)]
    property master_endpoint : RelationalDatabaseEndpointStruct?
    # <p>Describes the pending maintenance actions for the database.</p>
    @[Protocol::Field(location: :body, name: "pendingMaintenanceActions", required: false)]
    property pending_maintenance_actions : Array(PendingMaintenanceActionStruct)?
    # <p>The certificate associated with the database.</p>
    @[Protocol::Field(location: :body, name: "caCertificateIdentifier", required: false)]
    property ca_certificate_identifier : String?
  end

  class GetRelationalDatabaseResultStruct 
    include JSON1_1

    # <p>An object describing the specified database.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabase", required: false)]
    property relational_database : RelationalDatabaseStruct?
  end

  class GetRelationalDatabaseBlueprintsRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetRelationalDatabaseBlueprints</code>
    # request. If your results are paginated, the response will return a next page token that you
    # can specify as the page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class RelationalDatabaseBlueprintStruct 
    include JSON1_1

    # <p>The ID for the database blueprint.</p>
    @[Protocol::Field(location: :body, name: "blueprintId", required: false)]
    property blueprint_id : String?
    # <p>The database software of the database blueprint (for example, <code>MySQL</code>).</p>
    @[Protocol::Field(location: :body, name: "engine", required: false)]
    property engine : String?
    # <p>The database engine version for the database blueprint (for example,
    # <code>5.7.23</code>).</p>
    @[Protocol::Field(location: :body, name: "engineVersion", required: false)]
    property engine_version : String?
    # <p>The description of the database engine for the database blueprint.</p>
    @[Protocol::Field(location: :body, name: "engineDescription", required: false)]
    property engine_description : String?
    # <p>The description of the database engine version for the database blueprint.</p>
    @[Protocol::Field(location: :body, name: "engineVersionDescription", required: false)]
    property engine_version_description : String?
    # <p>A Boolean value indicating whether the engine version is the default for the database
    # blueprint.</p>
    @[Protocol::Field(location: :body, name: "isEngineDefault", required: false)]
    property is_engine_default : Bool?
  end

  class GetRelationalDatabaseBlueprintsResultStruct 
    include JSON1_1

    # <p>An object describing the result of your get relational database blueprints request.</p>
    @[Protocol::Field(location: :body, name: "blueprints", required: false)]
    property blueprints : Array(RelationalDatabaseBlueprintStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another
    # <code>GetRelationalDatabaseBlueprints</code> request and specify the next page token using
    # the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetRelationalDatabaseBundlesRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetRelationalDatabaseBundles</code> request.
    # If your results are paginated, the response will return a next page token that you can specify
    # as the page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class RelationalDatabaseBundleStruct 
    include JSON1_1

    # <p>The ID for the database bundle.</p>
    @[Protocol::Field(location: :body, name: "bundleId", required: false)]
    property bundle_id : String?
    # <p>The name for the database bundle.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The cost of the database bundle in US currency.</p>
    @[Protocol::Field(location: :body, name: "price", required: false)]
    property price : Float32?
    # <p>The amount of RAM in GB (for example, <code>2.0</code>) for the database bundle.</p>
    @[Protocol::Field(location: :body, name: "ramSizeInGb", required: false)]
    property ram_size_in_gb : Float32?
    # <p>The size of the disk for the database bundle.</p>
    @[Protocol::Field(location: :body, name: "diskSizeInGb", required: false)]
    property disk_size_in_gb : Int32?
    # <p>The data transfer rate per month in GB for the database bundle.</p>
    @[Protocol::Field(location: :body, name: "transferPerMonthInGb", required: false)]
    property transfer_per_month_in_gb : Int32?
    # <p>The number of virtual CPUs (vCPUs) for the database bundle.</p>
    @[Protocol::Field(location: :body, name: "cpuCount", required: false)]
    property cpu_count : Int32?
    # <p>A Boolean value indicating whether the database bundle is encrypted.</p>
    @[Protocol::Field(location: :body, name: "isEncrypted", required: false)]
    property is_encrypted : Bool?
    # <p>A Boolean value indicating whether the database bundle is active.</p>
    @[Protocol::Field(location: :body, name: "isActive", required: false)]
    property is_active : Bool?
  end

  class GetRelationalDatabaseBundlesResultStruct 
    include JSON1_1

    # <p>An object describing the result of your get relational database bundles request.</p>
    @[Protocol::Field(location: :body, name: "bundles", required: false)]
    property bundles : Array(RelationalDatabaseBundleStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetRelationalDatabaseBundles</code>
    # request and specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetRelationalDatabaseEventsRequest 
    include JSON1_1

    # <p>The name of the database from which to get events.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
    # <p>The number of minutes in the past from which to retrieve events. For example, to get all
    # events from the past 2 hours, enter 120.</p>
    # <p>Default: <code>60</code>
    # </p>
    # <p>The minimum is 1 and the maximum is 14 days (20160 minutes).</p>
    @[Protocol::Field(location: :body, name: "durationInMinutes", required: false)]
    property duration_in_minutes : Int32?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetRelationalDatabaseEvents</code> request.
    # If your results are paginated, the response will return a next page token that you can specify
    # as the page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class RelationalDatabaseEventStruct 
    include JSON1_1

    # <p>The database that the database event relates to.</p>
    @[Protocol::Field(location: :body, name: "resource", required: false)]
    property resource : String?
    # <p>The timestamp when the database event was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The message of the database event.</p>
    @[Protocol::Field(location: :body, name: "message", required: false)]
    property message : String?
    # <p>The category that the database event belongs to.</p>
    @[Protocol::Field(location: :body, name: "eventCategories", required: false)]
    property event_categories : Array(String)?
  end

  class GetRelationalDatabaseEventsResultStruct 
    include JSON1_1

    # <p>An object describing the result of your get relational database events request.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseEvents", required: false)]
    property relational_database_events : Array(RelationalDatabaseEventStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetRelationalDatabaseEvents</code>
    # request and specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetRelationalDatabaseLogEventsRequest 
    include JSON1_1

    # <p>The name of your database for which to get log events.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
    # <p>The name of the log stream.</p>
    # <p>Use the <code>get relational database log streams</code> operation to get a list of
    # available log streams.</p>
    @[Protocol::Field(location: :body, name: "logStreamName", required: true)]
    property log_stream_name : String
    # <p>The start of the time interval from which to get log events.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Specified in the Unix time format.</p>
    # <p>For example, if you wish to use a start time of October 1, 2018, at 8 PM UTC, then you
    # input <code>1538424000</code> as the start time.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "startTime", required: false)]
    property start_time : Time?
    # <p>The end of the time interval from which to get log events.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Specified in the Unix time format.</p>
    # <p>For example, if you wish to use an end time of October 1, 2018, at 8 PM UTC, then you
    # input <code>1538424000</code> as the end time.</p>
    # 
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "endTime", required: false)]
    property end_time : Time?
    # <p>Parameter to specify if the log should start from head or tail. If <code>true</code> is
    # specified, the log event starts from the head of the log. If <code>false</code> is specified,
    # the log event starts from the tail of the log.</p>
    # <note>
    # <p>For PostgreSQL, the default value of <code>false</code> is the only option
    # available.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "startFromHead", required: false)]
    property start_from_head : Bool?
    # <p>The token to advance to the next or previous page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetRelationalDatabaseLogEvents</code>
    # request. If your results are paginated, the response will return a next forward token and/or
    # next backward token that you can specify as the page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class LogEventStruct 
    include JSON1_1

    # <p>The timestamp when the database log event was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The message of the database log event.</p>
    @[Protocol::Field(location: :body, name: "message", required: false)]
    property message : String?
  end

  class GetRelationalDatabaseLogEventsResultStruct 
    include JSON1_1

    # <p>An object describing the result of your get relational database log events request.</p>
    @[Protocol::Field(location: :body, name: "resourceLogEvents", required: false)]
    property resource_log_events : Array(LogEventStruct)?
    # <p>A token used for advancing to the previous page of results from your get relational
    # database log events request.</p>
    @[Protocol::Field(location: :body, name: "nextBackwardToken", required: false)]
    property next_backward_token : String?
    # <p>A token used for advancing to the next page of results from your get relational database
    # log events request.</p>
    @[Protocol::Field(location: :body, name: "nextForwardToken", required: false)]
    property next_forward_token : String?
  end

  class GetRelationalDatabaseLogStreamsRequest 
    include JSON1_1

    # <p>The name of your database for which to get log streams.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
  end

  class GetRelationalDatabaseLogStreamsResultStruct 
    include JSON1_1

    # <p>An object describing the result of your get relational database log streams
    # request.</p>
    @[Protocol::Field(location: :body, name: "logStreams", required: false)]
    property log_streams : Array(String)?
  end

  class GetRelationalDatabaseMasterUserPasswordRequest 
    include JSON1_1

    # <p>The name of your database for which to get the master user password.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
    # <p>The password version to return.</p>
    # <p>Specifying <code>CURRENT</code> or <code>PREVIOUS</code> returns the current or previous
    # passwords respectively. Specifying <code>PENDING</code> returns the newest version of the
    # password that will rotate to <code>CURRENT</code>. After the <code>PENDING</code> password
    # rotates to <code>CURRENT</code>, the <code>PENDING</code> password is no longer
    # available.</p>
    # <p>Default: <code>CURRENT</code>
    # </p>
    @[Protocol::Field(location: :body, name: "passwordVersion", required: false)]
    property password_version : String?
  end

  class GetRelationalDatabaseMasterUserPasswordResultStruct 
    include JSON1_1

    # <p>The master user password for the <code>password version</code> specified.</p>
    @[Protocol::Field(location: :body, name: "masterUserPassword", required: false)]
    property master_user_password : String?
    # <p>The timestamp when the specified version of the master user password was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
  end

  class GetRelationalDatabaseMetricDataRequest 
    include JSON1_1

    # <p>The name of your database from which to get metric data.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
    # <p>The metric for which you want to return information.</p>
    # <p>Valid relational database metric names are listed below, along with the most useful
    # <code>statistics</code> to include in your request, and the published <code>unit</code>
    # value. All relational database metric data is available in 1-minute (60 seconds)
    # granularity.</p>
    # <ul>
    # <li>
    # <p>
    # <b>
    # <code>CPUUtilization</code>
    # </b> - The percentage of CPU
    # utilization currently in use on the database.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistics are <code>Maximum</code> and
    # <code>Average</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Percent</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>DatabaseConnections</code>
    # </b> - The number of
    # database connections in use.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistics are <code>Maximum</code> and
    # <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>DiskQueueDepth</code>
    # </b> - The number of
    # outstanding IOs (read/write requests) that are waiting to access the disk.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Count</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>FreeStorageSpace</code>
    # </b> - The amount of
    # available storage space.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Bytes</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>NetworkReceiveThroughput</code>
    # </b> - The incoming
    # (Receive) network traffic on the database, including both customer database traffic and
    # AWS traffic used for monitoring and replication.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Average</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Bytes/Second</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>
    # <code>NetworkTransmitThroughput</code>
    # </b> - The outgoing
    # (Transmit) network traffic on the database, including both customer database traffic and
    # AWS traffic used for monitoring and replication.</p>
    # <p>
    # <code>Statistics</code>: The most useful statistic is <code>Average</code>.</p>
    # <p>
    # <code>Unit</code>: The published unit is <code>Bytes/Second</code>.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "metricName", required: true)]
    property metric_name : String
    # <p>The granularity, in seconds, of the returned data points.</p>
    # <p>All relational database metric data is available in 1-minute (60 seconds)
    # granularity.</p>
    @[Protocol::Field(location: :body, name: "period", required: true)]
    property period : Int32
    # <p>The start of the time interval from which to get metric data.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Specified in the Unix time format.</p>
    # <p>For example, if you wish to use a start time of October 1, 2018, at 8 PM UTC, then you
    # input <code>1538424000</code> as the start time.</p>
    # 
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "startTime", required: true)]
    property start_time : Time
    # <p>The end of the time interval from which to get metric data.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Specified in the Unix time format.</p>
    # <p>For example, if you wish to use an end time of October 1, 2018, at 8 PM UTC, then you
    # input <code>1538424000</code> as the end time.</p>
    # 
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "endTime", required: true)]
    property end_time : Time
    # <p>The unit for the metric data request. Valid units depend on the metric data being
    # requested. For the valid units with each available metric, see the <code>metricName</code>
    # parameter.</p>
    @[Protocol::Field(location: :body, name: "unit", required: true)]
    property unit : String
    # <p>The statistic for the metric.</p>
    # <p>The following statistics are available:</p>
    # <ul>
    # <li>
    # <p>
    # <code>Minimum</code> - The lowest value observed during the specified period. Use this
    # value to determine low volumes of activity for your application.</p>
    # </li>
    # <li>
    # <p>
    # <code>Maximum</code> - The highest value observed during the specified period. Use
    # this value to determine high volumes of activity for your application.</p>
    # </li>
    # <li>
    # <p>
    # <code>Sum</code> - All values submitted for the matching metric added together. You
    # can use this statistic to determine the total volume of a metric.</p>
    # </li>
    # <li>
    # <p>
    # <code>Average</code> - The value of Sum / SampleCount during the specified period. By
    # comparing this statistic with the Minimum and Maximum values, you can determine the full
    # scope of a metric and how close the average use is to the Minimum and Maximum values. This
    # comparison helps you to know when to increase or decrease your resources.</p>
    # </li>
    # <li>
    # <p>
    # <code>SampleCount</code> - The count, or number, of data points used for the
    # statistical calculation.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "statistics", required: true)]
    property statistics : Array(String)
  end

  class GetRelationalDatabaseMetricDataResultStruct 
    include JSON1_1

    # <p>The name of the metric returned.</p>
    @[Protocol::Field(location: :body, name: "metricName", required: false)]
    property metric_name : String?
    # <p>An array of objects that describe the metric data returned.</p>
    @[Protocol::Field(location: :body, name: "metricData", required: false)]
    property metric_data : Array(MetricDatapointStruct)?
  end

  class GetRelationalDatabaseParametersRequest 
    include JSON1_1

    # <p>The name of your database for which to get parameters.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetRelationalDatabaseParameters</code>
    # request. If your results are paginated, the response will return a next page token that you
    # can specify as the page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class RelationalDatabaseParameterStruct 
    include JSON1_1

    # <p>Specifies the valid range of values for the parameter.</p>
    @[Protocol::Field(location: :body, name: "allowedValues", required: false)]
    property allowed_values : String?
    # <p>Indicates when parameter updates are applied.</p>
    # <p>Can be <code>immediate</code> or <code>pending-reboot</code>.</p>
    @[Protocol::Field(location: :body, name: "applyMethod", required: false)]
    property apply_method : String?
    # <p>Specifies the engine-specific parameter type.</p>
    @[Protocol::Field(location: :body, name: "applyType", required: false)]
    property apply_type : String?
    # <p>Specifies the valid data type for the parameter.</p>
    @[Protocol::Field(location: :body, name: "dataType", required: false)]
    property data_type : String?
    # <p>Provides a description of the parameter.</p>
    @[Protocol::Field(location: :body, name: "description", required: false)]
    property description : String?
    # <p>A Boolean value indicating whether the parameter can be modified.</p>
    @[Protocol::Field(location: :body, name: "isModifiable", required: false)]
    property is_modifiable : Bool?
    # <p>Specifies the name of the parameter.</p>
    @[Protocol::Field(location: :body, name: "parameterName", required: false)]
    property parameter_name : String?
    # <p>Specifies the value of the parameter.</p>
    @[Protocol::Field(location: :body, name: "parameterValue", required: false)]
    property parameter_value : String?
  end

  class GetRelationalDatabaseParametersResultStruct 
    include JSON1_1

    # <p>An object describing the result of your get relational database parameters request.</p>
    @[Protocol::Field(location: :body, name: "parameters", required: false)]
    property parameters : Array(RelationalDatabaseParameterStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another
    # <code>GetRelationalDatabaseParameters</code> request and specify the next page token using
    # the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetRelationalDatabasesRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetRelationalDatabases</code> request. If
    # your results are paginated, the response will return a next page token that you can specify as
    # the page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetRelationalDatabasesResultStruct 
    include JSON1_1

    # <p>An object describing the result of your get relational databases request.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabases", required: false)]
    property relational_databases : Array(RelationalDatabaseStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetRelationalDatabases</code>
    # request and specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetRelationalDatabaseSnapshotRequest 
    include JSON1_1

    # <p>The name of the database snapshot for which to get information.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseSnapshotName", required: true)]
    property relational_database_snapshot_name : String
  end

  class RelationalDatabaseSnapshotStruct 
    include JSON1_1

    # <p>The name of the database snapshot.</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the database snapshot.</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The support code for the database snapshot. Include this code in your email to support
    # when you have questions about a database snapshot in Lightsail. This code enables our
    # support team to look up your Lightsail information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>The timestamp when the database snapshot was created.</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The Region name and Availability Zone where the database snapshot is located.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The Lightsail resource type.</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The tag keys and optional values for the resource. For more information about tags in
    # Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
    # Dev Guide</a>.</p>
    @[Protocol::Field(location: :body, name: "tags", required: false)]
    property tags : Array(TagStruct)?
    # <p>The software of the database snapshot (for example, <code>MySQL</code>)</p>
    @[Protocol::Field(location: :body, name: "engine", required: false)]
    property engine : String?
    # <p>The database engine version for the database snapshot (for example,
    # <code>5.7.23</code>).</p>
    @[Protocol::Field(location: :body, name: "engineVersion", required: false)]
    property engine_version : String?
    # <p>The size of the disk in GB (for example, <code>32</code>) for the database
    # snapshot.</p>
    @[Protocol::Field(location: :body, name: "sizeInGb", required: false)]
    property size_in_gb : Int32?
    # <p>The state of the database snapshot.</p>
    @[Protocol::Field(location: :body, name: "state", required: false)]
    property state : String?
    # <p>The name of the source database from which the database snapshot was created.</p>
    @[Protocol::Field(location: :body, name: "fromRelationalDatabaseName", required: false)]
    property from_relational_database_name : String?
    # <p>The Amazon Resource Name (ARN) of the database from which the database snapshot was
    # created.</p>
    @[Protocol::Field(location: :body, name: "fromRelationalDatabaseArn", required: false)]
    property from_relational_database_arn : String?
    # <p>The bundle ID of the database from which the database snapshot was created.</p>
    @[Protocol::Field(location: :body, name: "fromRelationalDatabaseBundleId", required: false)]
    property from_relational_database_bundle_id : String?
    # <p>The blueprint ID of the database from which the database snapshot was created. A blueprint
    # describes the major engine version of a database.</p>
    @[Protocol::Field(location: :body, name: "fromRelationalDatabaseBlueprintId", required: false)]
    property from_relational_database_blueprint_id : String?
  end

  class GetRelationalDatabaseSnapshotResultStruct 
    include JSON1_1

    # <p>An object describing the specified database snapshot.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseSnapshot", required: false)]
    property relational_database_snapshot : RelationalDatabaseSnapshotStruct?
  end

  class GetRelationalDatabaseSnapshotsRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetRelationalDatabaseSnapshots</code>
    # request. If your results are paginated, the response will return a next page token that you
    # can specify as the page token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetRelationalDatabaseSnapshotsResultStruct 
    include JSON1_1

    # <p>An object describing the result of your get relational database snapshots request.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseSnapshots", required: false)]
    property relational_database_snapshots : Array(RelationalDatabaseSnapshotStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another
    # <code>GetRelationalDatabaseSnapshots</code> request and specify the next page token using
    # the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class GetStaticIpRequest 
    include JSON1_1

    # <p>The name of the static IP in Lightsail.</p>
    @[Protocol::Field(location: :body, name: "staticIpName", required: true)]
    property static_ip_name : String
  end

  class StaticIpStruct 
    include JSON1_1

    # <p>The name of the static IP (e.g., <code>StaticIP-Ohio-EXAMPLE</code>).</p>
    @[Protocol::Field(location: :body, name: "name", required: false)]
    property name : String?
    # <p>The Amazon Resource Name (ARN) of the static IP (e.g.,
    # <code>arn:aws:lightsail:us-east-2:123456789101:StaticIp/9cbb4a9e-f8e3-4dfe-b57e-12345EXAMPLE</code>).</p>
    @[Protocol::Field(location: :body, name: "arn", required: false)]
    property arn : String?
    # <p>The support code. Include this code in your email to support when you have questions about
    # an instance or another resource in Lightsail. This code enables our support team to look up
    # your Lightsail information more easily.</p>
    @[Protocol::Field(location: :body, name: "supportCode", required: false)]
    property support_code : String?
    # <p>The timestamp when the static IP was created (e.g., <code>1479735304.222</code>).</p>
    @[Protocol::Field(location: :body, name: "createdAt", required: false)]
    property created_at : Time?
    # <p>The region and Availability Zone where the static IP was created.</p>
    @[Protocol::Field(location: :body, name: "location", required: false)]
    property location : ResourceLocationStruct?
    # <p>The resource type (usually <code>StaticIp</code>).</p>
    @[Protocol::Field(location: :body, name: "resourceType", required: false)]
    property resource_type : String?
    # <p>The static IP address.</p>
    @[Protocol::Field(location: :body, name: "ipAddress", required: false)]
    property ip_address : String?
    # <p>The instance where the static IP is attached (e.g.,
    # <code>Amazon_Linux-1GB-Ohio-1</code>).</p>
    @[Protocol::Field(location: :body, name: "attachedTo", required: false)]
    property attached_to : String?
    # <p>A Boolean value indicating whether the static IP is attached.</p>
    @[Protocol::Field(location: :body, name: "isAttached", required: false)]
    property is_attached : Bool?
  end

  class GetStaticIpResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about the requested static IP.</p>
    @[Protocol::Field(location: :body, name: "staticIp", required: false)]
    property static_ip : StaticIpStruct?
  end

  class GetStaticIpsRequest 
    include JSON1_1

    # <p>The token to advance to the next page of results from your request.</p>
    # <p>To get a page token, perform an initial <code>GetStaticIps</code> request. If your results
    # are paginated, the response will return a next page token that you can specify as the page
    # token in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "pageToken", required: false)]
    property page_token : String?
  end

  class GetStaticIpsResultStruct 
    include JSON1_1

    # <p>An array of key-value pairs containing information about your get static IPs
    # request.</p>
    @[Protocol::Field(location: :body, name: "staticIps", required: false)]
    property static_ips : Array(StaticIpStruct)?
    # <p>The token to advance to the next page of results from your request.</p>
    # <p>A next page token is not returned if there are no more results to display.</p>
    # <p>To get the next page of results, perform another <code>GetStaticIps</code> request and
    # specify the next page token using the <code>pageToken</code> parameter.</p>
    @[Protocol::Field(location: :body, name: "nextPageToken", required: false)]
    property next_page_token : String?
  end

  class ImportKeyPairRequest 
    include JSON1_1

    # <p>The name of the key pair for which you want to import the public key.</p>
    @[Protocol::Field(location: :body, name: "keyPairName", required: true)]
    property key_pair_name : String
    # <p>A base64-encoded public key of the <code>ssh-rsa</code> type.</p>
    @[Protocol::Field(location: :body, name: "publicKeyBase64", required: true)]
    property public_key_base64 : String
  end

  class ImportKeyPairResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class IsVpcPeeredRequest 
    include JSON1_1

  end

  class IsVpcPeeredResultStruct 
    include JSON1_1

    # <p>Returns <code>true</code> if the Lightsail VPC is peered; otherwise,
    # <code>false</code>.</p>
    @[Protocol::Field(location: :body, name: "isPeered", required: false)]
    property is_peered : Bool?
  end

  class OpenInstancePublicPortsRequest 
    include JSON1_1

    # <p>An object to describe the ports to open for the specified instance.</p>
    @[Protocol::Field(location: :body, name: "portInfo", required: true)]
    property port_info : PortInfoStruct
    # <p>The name of the instance for which to open ports.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
  end

  class OpenInstancePublicPortsResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class PeerVpcRequest 
    include JSON1_1

  end

  class PeerVpcResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class PutAlarmRequest 
    include JSON1_1

    # <p>The name for the alarm. Specify the name of an existing alarm to update, and overwrite the
    # previous configuration of the alarm.</p>
    @[Protocol::Field(location: :body, name: "alarmName", required: true)]
    property alarm_name : String
    # <p>The name of the metric to associate with the alarm.</p>
    # <p>You can configure up to two alarms per metric.</p>
    # <p>The following metrics are available for each resource type:</p>
    # <ul>
    # <li>
    # <p>
    # <b>Instances</b>: <code>BurstCapacityPercentage</code>,
    # <code>BurstCapacityTime</code>, <code>CPUUtilization</code>, <code>NetworkIn</code>,
    # <code>NetworkOut</code>, <code>StatusCheckFailed</code>,
    # <code>StatusCheckFailed_Instance</code>, and
    # <code>StatusCheckFailed_System</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>Load balancers</b>:
    # <code>ClientTLSNegotiationErrorCount</code>, <code>HealthyHostCount</code>,
    # <code>UnhealthyHostCount</code>, <code>HTTPCode_LB_4XX_Count</code>,
    # <code>HTTPCode_LB_5XX_Count</code>, <code>HTTPCode_Instance_2XX_Count</code>,
    # <code>HTTPCode_Instance_3XX_Count</code>, <code>HTTPCode_Instance_4XX_Count</code>,
    # <code>HTTPCode_Instance_5XX_Count</code>, <code>InstanceResponseTime</code>,
    # <code>RejectedConnectionCount</code>, and <code>RequestCount</code>.</p>
    # </li>
    # <li>
    # <p>
    # <b>Relational databases</b>: <code>CPUUtilization</code>,
    # <code>DatabaseConnections</code>, <code>DiskQueueDepth</code>,
    # <code>FreeStorageSpace</code>, <code>NetworkReceiveThroughput</code>, and
    # <code>NetworkTransmitThroughput</code>.</p>
    # </li>
    # </ul>
    # <p>For more information about these metrics, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-resource-health-metrics#available-metrics">Metrics available in Lightsail</a>.</p>
    @[Protocol::Field(location: :body, name: "metricName", required: true)]
    property metric_name : String
    # <p>The name of the Lightsail resource that will be monitored.</p>
    # <p>Instances, load balancers, and relational databases are the only Lightsail resources
    # that can currently be monitored by alarms.</p>
    @[Protocol::Field(location: :body, name: "monitoredResourceName", required: true)]
    property monitored_resource_name : String
    # <p>The arithmetic operation to use when comparing the specified statistic to the threshold.
    # The specified statistic value is used as the first operand.</p>
    @[Protocol::Field(location: :body, name: "comparisonOperator", required: true)]
    property comparison_operator : String
    # <p>The value against which the specified statistic is compared.</p>
    @[Protocol::Field(location: :body, name: "threshold", required: true)]
    property threshold : Float64
    # <p>The number of most recent periods over which data is compared to the specified threshold.
    # If you are setting an "M out of N" alarm, this value (<code>evaluationPeriods</code>) is the
    # N.</p>
    # <p>If you are setting an alarm that requires that a number of consecutive data points be
    # breaching to trigger the alarm, this value specifies the rolling period of time in which data
    # points are evaluated.</p>
    # <p>Each evaluation period is five minutes long. For example, specify an evaluation period of
    # 24 to evaluate a metric over a rolling period of two hours.</p>
    # <p>You can specify a minimum valuation period of 1 (5 minutes), and a maximum evaluation
    # period of 288 (24 hours).</p>
    @[Protocol::Field(location: :body, name: "evaluationPeriods", required: true)]
    property evaluation_periods : Int32
    # <p>The number of data points that must be not within the specified threshold to trigger the
    # alarm. If you are setting an "M out of N" alarm, this value (<code>datapointsToAlarm</code>)
    # is the M.</p>
    @[Protocol::Field(location: :body, name: "datapointsToAlarm", required: false)]
    property datapoints_to_alarm : Int32?
    # <p>Sets how this alarm will handle missing data points.</p>
    # <p>An alarm can treat missing data in the following ways:</p>
    # <ul>
    # <li>
    # <p>
    # <code>breaching</code> - Assume the missing data is not within the threshold. Missing
    # data counts towards the number of times the metric is not within the threshold.</p>
    # </li>
    # <li>
    # <p>
    # <code>notBreaching</code> - Assume the missing data is within the threshold. Missing
    # data does not count towards the number of times the metric is not within the
    # threshold.</p>
    # </li>
    # <li>
    # <p>
    # <code>ignore</code> - Ignore the missing data. Maintains the current alarm
    # state.</p>
    # </li>
    # <li>
    # <p>
    # <code>missing</code> - Missing data is treated as missing.</p>
    # </li>
    # </ul>
    # <p>If <code>treatMissingData</code> is not specified, the default behavior of
    # <code>missing</code> is used.</p>
    @[Protocol::Field(location: :body, name: "treatMissingData", required: false)]
    property treat_missing_data : String?
    # <p>The contact protocols to use for the alarm, such as <code>Email</code>, <code>SMS</code>
    # (text messaging), or both.</p>
    # <p>A notification is sent via the specified contact protocol if notifications are enabled for
    # the alarm, and when the alarm is triggered.</p>
    # <p>A notification is not sent if a contact protocol is not specified, if the specified
    # contact protocol is not configured in the AWS Region, or if notifications are not enabled
    # for the alarm using the <code>notificationEnabled</code> paramater.</p>
    # <p>Use the <code>CreateContactMethod</code> action to configure a contact protocol in an
    # AWS Region.</p>
    @[Protocol::Field(location: :body, name: "contactProtocols", required: false)]
    property contact_protocols : Array(String)?
    # <p>The alarm states that trigger a notification.</p>
    # <p>An alarm has the following possible states:</p>
    # <ul>
    # <li>
    # <p>
    # <code>ALARM</code> - The metric is outside of the defined threshold.</p>
    # </li>
    # <li>
    # <p>
    # <code>INSUFFICIENT_DATA</code> - The alarm has just started, the metric is not
    # available, or not enough data is available for the metric to determine the alarm
    # state.</p>
    # </li>
    # <li>
    # <p>
    # <code>OK</code> - The metric is within the defined threshold.</p>
    # </li>
    # </ul>
    # <p>When you specify a notification trigger, the <code>ALARM</code> state must be specified.
    # The <code>INSUFFICIENT_DATA</code> and <code>OK</code> states can be specified in addition to
    # the <code>ALARM</code> state.</p>
    # <ul>
    # <li>
    # <p>If you specify <code>OK</code> as an alarm trigger, a notification is sent when the
    # alarm switches from an <code>ALARM</code> or <code>INSUFFICIENT_DATA</code> alarm state to
    # an <code>OK</code> state. This can be thought of as an <i>all clear</i>
    # alarm notification.</p>
    # </li>
    # <li>
    # <p>If you specify <code>INSUFFICIENT_DATA</code> as the alarm trigger, a notification is
    # sent when the alarm switches from an <code>OK</code> or <code>ALARM</code> alarm state to
    # an <code>INSUFFICIENT_DATA</code> state.</p>
    # </li>
    # </ul>
    # <p>The notification trigger defaults to <code>ALARM</code> if you don't specify this
    # parameter.</p>
    @[Protocol::Field(location: :body, name: "notificationTriggers", required: false)]
    property notification_triggers : Array(String)?
    # <p>Indicates whether the alarm is enabled.</p>
    # <p>Notifications are enabled by default if you don't specify this parameter.</p>
    @[Protocol::Field(location: :body, name: "notificationEnabled", required: false)]
    property notification_enabled : Bool?
  end

  class PutAlarmResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class PutInstancePublicPortsRequest 
    include JSON1_1

    # <p>An array of objects to describe the ports to open for the specified instance.</p>
    @[Protocol::Field(location: :body, name: "portInfos", required: true)]
    property port_infos : Array(PortInfoStruct)
    # <p>The name of the instance for which to open ports.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
  end

  class PutInstancePublicPortsResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class RebootInstanceRequest 
    include JSON1_1

    # <p>The name of the instance to reboot.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
  end

  class RebootInstanceResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class RebootRelationalDatabaseRequest 
    include JSON1_1

    # <p>The name of your database to reboot.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
  end

  class RebootRelationalDatabaseResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class RegisterContainerImageRequest 
    include JSON1_1

    # <p>The name of the container service for which to register a container image.</p>
    @[Protocol::Field(location: :uri, name: "serviceName", required: true)]
    property service_name : String
    # <p>The label for the container image when it's registered to the container service.</p>
    # 
    # <p>Use a descriptive label that you can use to track the different versions of your
    # registered container images.</p>
    # 
    # <p>Use the <code>GetContainerImages</code> action to return the container images registered
    # to a Lightsail container service. The label is the <code><imagelabel></code> portion
    # of the following image name example:</p>
    # <ul>
    # <li>
    # <p>
    # <code>:container-service-1.<imagelabel>.1</code>
    # </p>
    # </li>
    # </ul>
    # 
    # <p>If the name of your container service is <code>mycontainerservice</code>, and the label
    # that you specify is <code>mystaticwebsite</code>, then the name of the registered container
    # image will be <code>:mycontainerservice.mystaticwebsite.1</code>.</p>
    # 
    # <p>The number at the end of these image name examples represents the version of the
    # registered container image. If you push and register another container image to the same
    # Lightsail container service, with the same label, then the version number for the new
    # registered container image will be <code>2</code>. If you push and register another container
    # image, the version number will be <code>3</code>, and so on.</p>
    @[Protocol::Field(location: :body, name: "label", required: true)]
    property label : String
    # <p>The digest of the container image to be registered.</p>
    @[Protocol::Field(location: :body, name: "digest", required: true)]
    property digest : String
  end

  class RegisterContainerImageResultStruct 
    include JSON1_1

    # 
    @[Protocol::Field(location: :body, name: "containerImage", required: false)]
    property container_image : ContainerImageStruct?
  end

  class ReleaseStaticIpRequest 
    include JSON1_1

    # <p>The name of the static IP to delete.</p>
    @[Protocol::Field(location: :body, name: "staticIpName", required: true)]
    property static_ip_name : String
  end

  class ReleaseStaticIpResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class ResetDistributionCacheRequest 
    include JSON1_1

    # <p>The name of the distribution for which to reset cache.</p>
    # <p>Use the <code>GetDistributions</code> action to get a list of distribution names that you
    # can specify.</p>
    @[Protocol::Field(location: :body, name: "distributionName", required: false)]
    property distribution_name : String?
  end

  class ResetDistributionCacheResultStruct 
    include JSON1_1

    # <p>The status of the reset cache request.</p>
    @[Protocol::Field(location: :body, name: "status", required: false)]
    property status : String?
    # <p>The timestamp of the reset cache request (e.g., <code>1479734909.17</code>) in Unix time
    # format.</p>
    @[Protocol::Field(location: :body, name: "createTime", required: false)]
    property create_time : Time?
    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class SendContactMethodVerificationRequest 
    include JSON1_1

    # <p>The protocol to verify, such as <code>Email</code> or <code>SMS</code> (text
    # messaging).</p>
    @[Protocol::Field(location: :body, name: "protocol", required: true)]
    property protocol : String
  end

  class SendContactMethodVerificationResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class StartInstanceRequest 
    include JSON1_1

    # <p>The name of the instance (a virtual private server) to start.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
  end

  class StartInstanceResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class StartRelationalDatabaseRequest 
    include JSON1_1

    # <p>The name of your database to start.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
  end

  class StartRelationalDatabaseResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class StopInstanceRequest 
    include JSON1_1

    # <p>The name of the instance (a virtual private server) to stop.</p>
    @[Protocol::Field(location: :body, name: "instanceName", required: true)]
    property instance_name : String
    # <p>When set to <code>True</code>, forces a Lightsail instance that is stuck in a
    # <code>stopping</code> state to stop.</p>
    # <important>
    # <p>Only use the <code>force</code> parameter if your instance is stuck in the
    # <code>stopping</code> state. In any other state, your instance should stop normally
    # without adding this parameter to your API request.</p>
    # </important>
    @[Protocol::Field(location: :body, name: "force", required: false)]
    property force : Bool?
  end

  class StopInstanceResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class StopRelationalDatabaseRequest 
    include JSON1_1

    # <p>The name of your database to stop.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
    # <p>The name of your new database snapshot to be created before stopping your database.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseSnapshotName", required: false)]
    property relational_database_snapshot_name : String?
  end

  class StopRelationalDatabaseResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class TagResourceRequest 
    include JSON1_1

    # <p>The name of the resource to which you are adding tags.</p>
    @[Protocol::Field(location: :body, name: "resourceName", required: true)]
    property resource_name : String
    # <p>The Amazon Resource Name (ARN) of the resource to which you want to add a tag.</p>
    @[Protocol::Field(location: :body, name: "resourceArn", required: false)]
    property resource_arn : String?
    # <p>The tag key and optional value.</p>
    @[Protocol::Field(location: :body, name: "tags", required: true)]
    property tags : Array(TagStruct)
  end

  class TagResourceResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class TestAlarmRequest 
    include JSON1_1

    # <p>The name of the alarm to test.</p>
    @[Protocol::Field(location: :body, name: "alarmName", required: true)]
    property alarm_name : String
    # <p>The alarm state to test.</p>
    # <p>An alarm has the following possible states that can be tested:</p>
    # <ul>
    # <li>
    # <p>
    # <code>ALARM</code> - The metric is outside of the defined threshold.</p>
    # </li>
    # <li>
    # <p>
    # <code>INSUFFICIENT_DATA</code> - The alarm has just started, the metric is not
    # available, or not enough data is available for the metric to determine the alarm
    # state.</p>
    # </li>
    # <li>
    # <p>
    # <code>OK</code> - The metric is within the defined threshold.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "state", required: true)]
    property state : String
  end

  class TestAlarmResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class UnpeerVpcRequest 
    include JSON1_1

  end

  class UnpeerVpcResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class UntagResourceRequest 
    include JSON1_1

    # <p>The name of the resource from which you are removing a tag.</p>
    @[Protocol::Field(location: :body, name: "resourceName", required: true)]
    property resource_name : String
    # <p>The Amazon Resource Name (ARN) of the resource from which you want to remove a tag.</p>
    @[Protocol::Field(location: :body, name: "resourceArn", required: false)]
    property resource_arn : String?
    # <p>The tag keys to delete from the specified resource.</p>
    @[Protocol::Field(location: :body, name: "tagKeys", required: true)]
    property tag_keys : Array(String)
  end

  class UntagResourceResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class UpdateContainerServiceRequest 
    include JSON1_1

    # <p>The name of the container service to update.</p>
    @[Protocol::Field(location: :uri, name: "serviceName", required: true)]
    property service_name : String
    # <p>The power for the container service.</p>
    # 
    # <p>The power specifies the amount of memory, vCPUs, and base monthly cost of each node of the
    # container service. The <code>power</code> and <code>scale</code> of a container service makes
    # up its configured capacity. To determine the monthly price of your container service, multiply
    # the base price of the <code>power</code> with the <code>scale</code> (the number of nodes) of
    # the service.</p>
    # 
    # <p>Use the <code>GetContainerServicePowers</code> action to view the specifications of each
    # power option.</p>
    @[Protocol::Field(location: :body, name: "power", required: false)]
    property power : String?
    # <p>The scale for the container service.</p>
    # 
    # <p>The scale specifies the allocated compute nodes of the container service. The
    # <code>power</code> and <code>scale</code> of a container service makes up its configured
    # capacity. To determine the monthly price of your container service, multiply the base price of
    # the <code>power</code> with the <code>scale</code> (the number of nodes) of the
    # service.</p>
    @[Protocol::Field(location: :body, name: "scale", required: false)]
    property scale : Int32?
    # <p>A Boolean value to indicate whether the container service is disabled.</p>
    @[Protocol::Field(location: :body, name: "isDisabled", required: false)]
    property is_disabled : Bool?
    # <p>The public domain names to use with the container service, such as
    # <code>example.com</code> and <code>www.example.com</code>.</p>
    # 
    # <p>You can specify up to four public domain names for a container service. The domain names
    # that you specify are used when you create a deployment with a container configured as the
    # public endpoint of your container service.</p>
    # 
    # <p>If you don't specify public domain names, then you can use the default domain of the
    # container service.</p>
    # 
    # <important>
    # <p>You must create and validate an SSL/TLS certificate before you can use public domain
    # names with your container service. Use the <code>CreateCertificate</code> action to create a
    # certificate for the public domain names you want to use with your container service.</p>
    # </important>
    # 
    # <p>You can specify public domain names using a string to array map as shown in the example
    # later on this page.</p>
    @[Protocol::Field(location: :body, name: "publicDomainNames", required: false)]
    property public_domain_names : Hash(String, Array(String))?
  end

  class UpdateContainerServiceResultStruct 
    include JSON1_1

    # <p>An object that describes a container service.</p>
    @[Protocol::Field(location: :body, name: "containerService", required: false)]
    property container_service : ContainerServiceStruct?
  end

  class UpdateDistributionRequest 
    include JSON1_1

    # <p>The name of the distribution to update.</p>
    # <p>Use the <code>GetDistributions</code> action to get a list of distribution names that you
    # can specify.</p>
    @[Protocol::Field(location: :body, name: "distributionName", required: true)]
    property distribution_name : String
    # <p>An object that describes the origin resource for the distribution, such as a Lightsail
    # instance or load balancer.</p>
    # <p>The distribution pulls, caches, and serves content from the origin.</p>
    @[Protocol::Field(location: :body, name: "origin", required: false)]
    property origin : InputOriginStruct?
    # <p>An object that describes the default cache behavior for the distribution.</p>
    @[Protocol::Field(location: :body, name: "defaultCacheBehavior", required: false)]
    property default_cache_behavior : CacheBehaviorStruct?
    # <p>An object that describes the cache behavior settings for the distribution.</p>
    # <note>
    # <p>The <code>cacheBehaviorSettings</code> specified in your
    # <code>UpdateDistributionRequest</code> will replace your distribution's existing
    # settings.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "cacheBehaviorSettings", required: false)]
    property cache_behavior_settings : CacheSettingsStruct?
    # <p>An array of objects that describe the per-path cache behavior for the distribution.</p>
    @[Protocol::Field(location: :body, name: "cacheBehaviors", required: false)]
    property cache_behaviors : Array(CacheBehaviorPerPathStruct)?
    # <p>Indicates whether to enable the distribution.</p>
    @[Protocol::Field(location: :body, name: "isEnabled", required: false)]
    property is_enabled : Bool?
  end

  class UpdateDistributionResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class UpdateDistributionBundleRequest 
    include JSON1_1

    # <p>The name of the distribution for which to update the bundle.</p>
    # <p>Use the <code>GetDistributions</code> action to get a list of distribution names that you
    # can specify.</p>
    @[Protocol::Field(location: :body, name: "distributionName", required: false)]
    property distribution_name : String?
    # <p>The bundle ID of the new bundle to apply to your distribution.</p>
    # <p>Use the <code>GetDistributionBundles</code> action to get a list of distribution bundle
    # IDs that you can specify.</p>
    @[Protocol::Field(location: :body, name: "bundleId", required: false)]
    property bundle_id : String?
  end

  class UpdateDistributionBundleResultStruct 
    include JSON1_1

    # 
    @[Protocol::Field(location: :body, name: "operation", required: false)]
    property operation : OperationStruct?
  end

  class UpdateDomainEntryRequest 
    include JSON1_1

    # <p>The name of the domain recordset to update.</p>
    @[Protocol::Field(location: :body, name: "domainName", required: true)]
    property domain_name : String
    # <p>An array of key-value pairs containing information about the domain entry.</p>
    @[Protocol::Field(location: :body, name: "domainEntry", required: true)]
    property domain_entry : DomainEntryStruct
  end

  class UpdateDomainEntryResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class UpdateLoadBalancerAttributeRequest 
    include JSON1_1

    # <p>The name of the load balancer that you want to modify (e.g.,
    # <code>my-load-balancer</code>.</p>
    @[Protocol::Field(location: :body, name: "loadBalancerName", required: true)]
    property load_balancer_name : String
    # <p>The name of the attribute you want to update. Valid values are below.</p>
    @[Protocol::Field(location: :body, name: "attributeName", required: true)]
    property attribute_name : String
    # <p>The value that you want to specify for the attribute name.</p>
    @[Protocol::Field(location: :body, name: "attributeValue", required: true)]
    property attribute_value : String
  end

  class UpdateLoadBalancerAttributeResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class UpdateRelationalDatabaseRequest 
    include JSON1_1

    # <p>The name of your database to update.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
    # <p>The password for the master user of your database. The password can include any printable
    # ASCII character except "/", """, or "@".</p>
    # <p>Constraints: Must contain 8 to 41 characters.</p>
    @[Protocol::Field(location: :body, name: "masterUserPassword", required: false)]
    property master_user_password : String?
    # <p>When <code>true</code>, the master user password is changed to a new strong password
    # generated by Lightsail.</p>
    # <p>Use the <code>get relational database master user password</code> operation to get the new
    # password.</p>
    @[Protocol::Field(location: :body, name: "rotateMasterUserPassword", required: false)]
    property rotate_master_user_password : Bool?
    # <p>The daily time range during which automated backups are created for your database if
    # automated backups are enabled.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must be in the <code>hh24:mi-hh24:mi</code> format.</p>
    # <p>Example: <code>16:00-16:30</code>
    # </p>
    # </li>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Must not conflict with the preferred maintenance window.</p>
    # </li>
    # <li>
    # <p>Must be at least 30 minutes.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "preferredBackupWindow", required: false)]
    property preferred_backup_window : String?
    # <p>The weekly time range during which system maintenance can occur on your database.</p>
    # <p>The default is a 30-minute window selected at random from an 8-hour block of time for each
    # AWS Region, occurring on a random day of the week.</p>
    # <p>Constraints:</p>
    # <ul>
    # <li>
    # <p>Must be in the <code>ddd:hh24:mi-ddd:hh24:mi</code> format.</p>
    # </li>
    # <li>
    # <p>Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.</p>
    # </li>
    # <li>
    # <p>Must be at least 30 minutes.</p>
    # </li>
    # <li>
    # <p>Specified in Coordinated Universal Time (UTC).</p>
    # </li>
    # <li>
    # <p>Example: <code>Tue:17:00-Tue:17:30</code>
    # </p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "preferredMaintenanceWindow", required: false)]
    property preferred_maintenance_window : String?
    # <p>When <code>true</code>, enables automated backup retention for your database.</p>
    # <p>Updates are applied during the next maintenance window because this can result in an
    # outage.</p>
    @[Protocol::Field(location: :body, name: "enableBackupRetention", required: false)]
    property enable_backup_retention : Bool?
    # <p>When <code>true</code>, disables automated backup retention for your database.</p>
    # <p>Disabling backup retention deletes all automated database backups. Before disabling this,
    # you may want to create a snapshot of your database using the <code>create relational database
    # snapshot</code> operation.</p>
    # <p>Updates are applied during the next maintenance window because this can result in an
    # outage.</p>
    @[Protocol::Field(location: :body, name: "disableBackupRetention", required: false)]
    property disable_backup_retention : Bool?
    # <p>Specifies the accessibility options for your database. A value of <code>true</code>
    # specifies a database that is available to resources outside of your Lightsail account. A
    # value of <code>false</code> specifies a database that is available only to your Lightsail
    # resources in the same region as your database.</p>
    @[Protocol::Field(location: :body, name: "publiclyAccessible", required: false)]
    property publicly_accessible : Bool?
    # <p>When <code>true</code>, applies changes immediately. When <code>false</code>, applies
    # changes during the preferred maintenance window. Some changes may cause an outage.</p>
    # <p>Default: <code>false</code>
    # </p>
    @[Protocol::Field(location: :body, name: "applyImmediately", required: false)]
    property apply_immediately : Bool?
    # <p>Indicates the certificate that needs to be associated with the database.</p>
    @[Protocol::Field(location: :body, name: "caCertificateIdentifier", required: false)]
    property ca_certificate_identifier : String?
  end

  class UpdateRelationalDatabaseResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end

  class UpdateRelationalDatabaseParametersRequest 
    include JSON1_1

    # <p>The name of your database for which to update parameters.</p>
    @[Protocol::Field(location: :body, name: "relationalDatabaseName", required: true)]
    property relational_database_name : String
    # <p>The database parameters to update.</p>
    @[Protocol::Field(location: :body, name: "parameters", required: true)]
    property parameters : Array(RelationalDatabaseParameterStruct)
  end

  class UpdateRelationalDatabaseParametersResultStruct 
    include JSON1_1

    # <p>An array of objects that describe the result of the action, such as the status of the
    # request, the timestamp of the request, and the resources affected by the request.</p>
    @[Protocol::Field(location: :body, name: "operations", required: false)]
    property operations : Array(OperationStruct)?
  end



end
