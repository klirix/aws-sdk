require "http"
require "../protocols/rest_xml"

module AWSSdk::AmazonS3
  extend self
  ENDPOINT_PREFIX = "s3"


      # <p>This operation aborts a multipart upload. After a multipart upload is aborted, no
  # additional parts can be uploaded using that upload ID. The storage consumed by any
  # previously uploaded parts will be freed. However, if any part uploads are currently in
  # progress, those part uploads might or might not succeed. As a result, it might be necessary
  # to abort a given multipart upload multiple times in order to completely free all storage
  # consumed by all parts. </p>
  # <p>To verify that all parts have been removed, so you don't get charged for the part
  # storage, you should call the <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a> operation and ensure that
  # the parts list is empty.</p>
  # <p>For information about permissions required to use the multipart upload API, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart Upload API and
  # Permissions</a>.</p>
  # <p>The following operations are related to <code>AbortMultipartUpload</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html">ListMultipartUploads</a>
  # </p>
  # </li>
  # </ul>
  def abort_multipart_upload(input : AbortMultipartUploadRequest) : AbortMultipartUploadOutput
    path = "/{Bucket}/{Key+}?x-id=AbortMultipartUpload"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    AbortMultipartUploadOutput.from_request(request)
  end



      # <p>Completes a multipart upload by assembling previously uploaded parts.</p>
  # <p>You first initiate the multipart upload and then upload all parts using the <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  # operation. After successfully uploading all relevant parts of an upload, you call this
  # operation to complete the upload. Upon receiving this request, Amazon S3 concatenates all
  # the parts in ascending order by part number to create a new object. In the Complete
  # Multipart Upload request, you must provide the parts list. You must ensure that the parts
  # list is complete. This operation concatenates the parts that you provide in the list. For
  # each part in the list, you must provide the part number and the <code>ETag</code> value,
  # returned after that part was uploaded.</p>
  # <p>Processing of a Complete Multipart Upload request could take several minutes to
  # complete. After Amazon S3 begins processing the request, it sends an HTTP response header that
  # specifies a 200 OK response. While processing is in progress, Amazon S3 periodically sends white
  # space characters to keep the connection from timing out. Because a request could fail after
  # the initial 200 OK response has been sent, it is important that you check the response body
  # to determine whether the request succeeded.</p>
  # <p>Note that if <code>CompleteMultipartUpload</code> fails, applications should be prepared
  # to retry the failed requests. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ErrorBestPractices.html">Amazon S3 Error Best Practices</a>.</p>
  # <p>For more information about multipart uploads, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html">Uploading Objects Using Multipart
  # Upload</a>.</p>
  # <p>For information about permissions required to use the multipart upload API, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart Upload API and
  # Permissions</a>.</p>
  #
  #
  # <p>
  # <code>CompleteMultipartUpload</code> has the following special errors:</p>
  # <ul>
  # <li>
  # <p>Error code: <code>EntityTooSmall</code>
  # </p>
  # <ul>
  # <li>
  # <p>Description: Your proposed upload is smaller than the minimum allowed object
  # size. Each part must be at least 5 MB in size, except the last part.</p>
  # </li>
  # <li>
  # <p>400 Bad Request</p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <p>Error code: <code>InvalidPart</code>
  # </p>
  # <ul>
  # <li>
  # <p>Description: One or more of the specified parts could not be found. The part
  # might not have been uploaded, or the specified entity tag might not have
  # matched the part's entity tag.</p>
  # </li>
  # <li>
  # <p>400 Bad Request</p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <p>Error code: <code>InvalidPartOrder</code>
  # </p>
  # <ul>
  # <li>
  # <p>Description: The list of parts was not in ascending order. The parts list
  # must be specified in order by part number.</p>
  # </li>
  # <li>
  # <p>400 Bad Request</p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <p>Error code: <code>NoSuchUpload</code>
  # </p>
  # <ul>
  # <li>
  # <p>Description: The specified multipart upload does not exist. The upload ID
  # might be invalid, or the multipart upload might have been aborted or
  # completed.</p>
  # </li>
  # <li>
  # <p>404 Not Found</p>
  # </li>
  # </ul>
  # </li>
  # </ul>
  #
  # <p>The following operations are related to <code>CompleteMultipartUpload</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html">ListMultipartUploads</a>
  # </p>
  # </li>
  # </ul>
  def complete_multipart_upload(input : CompleteMultipartUploadRequest) : CompleteMultipartUploadOutput
    path = "/{Bucket}/{Key+}"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    CompleteMultipartUploadOutput.from_request(request)
  end



      # <p>Creates a copy of an object that is already stored in Amazon S3.</p>
  # <note>
  # <p>You can store individual objects of up to 5 TB in Amazon S3. You create a copy of your
  # object up to 5 GB in size in a single atomic operation using this API. However, to copy
  # an object greater than 5 GB, you must use the multipart upload Upload Part - Copy API.
  # For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/CopyingObjctsUsingRESTMPUapi.html">Copy Object Using the REST Multipart Upload API</a>.</p>
  # </note>
  # <p>All copy requests must be authenticated. Additionally, you must have
  # <i>read</i> access to the source object and <i>write</i>
  # access to the destination bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html">REST Authentication</a>. Both the Region
  # that you want to copy the object from and the Region that you want to copy the object to
  # must be enabled for your account.</p>
  # <p>A copy request might return an error when Amazon S3 receives the copy request or while Amazon S3
  # is copying the files. If the error occurs before the copy operation starts, you receive a
  # standard Amazon S3 error. If the error occurs during the copy operation, the error response is
  # embedded in the <code>200 OK</code> response. This means that a <code>200 OK</code>
  # response can contain either a success or an error. Design your application to parse the
  # contents of the response and handle it appropriately.</p>
  # <p>If the copy is successful, you receive a response with information about the copied
  # object.</p>
  # <note>
  # <p>If the request is an HTTP 1.1 request, the response is chunk encoded. If it were not,
  # it would not contain the content-length, and you would need to read the entire
  # body.</p>
  # </note>
  # <p>The copy request charge is based on the storage class and Region that you specify for
  # the destination object. For pricing information, see <a href="https://aws.amazon.com/s3/pricing/">Amazon S3 pricing</a>.</p>
  # <important>
  # <p>Amazon S3 transfer acceleration does not support cross-Region copies. If you request a
  # cross-Region copy using a transfer acceleration endpoint, you get a 400 <code>Bad
  # Request</code> error. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html">Transfer Acceleration</a>.</p>
  # </important>
  # <p>
  # <b>Metadata</b>
  # </p>
  # <p>When copying an object, you can preserve all metadata (default) or specify new metadata.
  # However, the ACL is not preserved and is set to private for the user making the request. To
  # override the default ACL setting, specify a new ACL when generating a copy request. For
  # more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html">Using ACLs</a>. </p>
  # <p>To specify whether you want the object metadata copied from the source object or
  # replaced with metadata provided in the request, you can optionally add the
  # <code>x-amz-metadata-directive</code> header. When you grant permissions, you can use
  # the <code>s3:x-amz-metadata-directive</code> condition key to enforce certain metadata
  # behavior when objects are uploaded. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/amazon-s3-policy-keys.html">Specifying Conditions in a
  # Policy</a> in the <i>Amazon S3 Developer Guide</i>. For a complete list of
  # Amazon S3-specific condition keys, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/list_amazons3.html">Actions, Resources, and Condition Keys for
  # Amazon S3</a>.</p>
  # <p>
  # <b>
  # <code>x-amz-copy-source-if</code> Headers</b>
  # </p>
  # <p>To only copy an object under certain conditions, such as whether the <code>Etag</code>
  # matches or whether the object was modified before or after a specified date, use the
  # following request parameters:</p>
  # <ul>
  # <li>
  # <p>
  # <code>x-amz-copy-source-if-match</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>x-amz-copy-source-if-none-match</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>x-amz-copy-source-if-unmodified-since</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>x-amz-copy-source-if-modified-since</code>
  # </p>
  # </li>
  # </ul>
  # <p> If both the <code>x-amz-copy-source-if-match</code> and
  # <code>x-amz-copy-source-if-unmodified-since</code> headers are present in the request
  # and evaluate as follows, Amazon S3 returns <code>200 OK</code> and copies the data:</p>
  # <ul>
  # <li>
  # <p>
  # <code>x-amz-copy-source-if-match</code> condition evaluates to true</p>
  # </li>
  # <li>
  # <p>
  # <code>x-amz-copy-source-if-unmodified-since</code> condition evaluates to
  # false</p>
  # </li>
  # </ul>
  #
  # <p>If both the <code>x-amz-copy-source-if-none-match</code> and
  # <code>x-amz-copy-source-if-modified-since</code> headers are present in the request and
  # evaluate as follows, Amazon S3 returns the <code>412 Precondition Failed</code> response
  # code:</p>
  # <ul>
  # <li>
  # <p>
  # <code>x-amz-copy-source-if-none-match</code> condition evaluates to false</p>
  # </li>
  # <li>
  # <p>
  # <code>x-amz-copy-source-if-modified-since</code> condition evaluates to
  # true</p>
  # </li>
  # </ul>
  #
  # <note>
  # <p>All headers with the <code>x-amz-</code> prefix, including
  # <code>x-amz-copy-source</code>, must be signed.</p>
  # </note>
  # <p>
  # <b>Server-side encryption</b>
  # </p>
  # <p>When you perform a CopyObject operation, you can optionally use the appropriate encryption-related headers to encrypt the object using server-side encryption with AWS managed encryption keys (SSE-S3 or SSE-KMS) or a customer-provided encryption key. With server-side encryption, Amazon S3 encrypts your data as it writes it to disks in its data centers and decrypts the data when you access it. For more information about server-side encryption, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">Using
  # Server-Side Encryption</a>.</p>
  # <p>If a target object uses SSE-KMS, you can enable an S3 Bucket Key for the object. For more
  # information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html">Amazon S3 Bucket Keys</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p>
  # <b>Access Control List (ACL)-Specific Request
  # Headers</b>
  # </p>
  # <p>When copying an object, you can optionally use headers to grant ACL-based permissions.
  # By default, all objects are private. Only the owner has full access control. When adding a
  # new object, you can grant permissions to individual AWS accounts or to predefined groups
  # defined by Amazon S3. These permissions are then added to the ACL on the object. For more
  # information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access Control List (ACL) Overview</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-using-rest-api.html">Managing ACLs Using the REST
  # API</a>. </p>
  #
  # <p>
  # <b>Storage Class Options</b>
  # </p>
  # <p>You can use the <code>CopyObject</code> operation to change the storage class of an
  # object that is already stored in Amazon S3 using the <code>StorageClass</code> parameter. For
  # more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage
  # Classes</a> in the <i>Amazon S3 Service Developer Guide</i>.</p>
  # <p>
  # <b>Versioning</b>
  # </p>
  # <p>By default, <code>x-amz-copy-source</code> identifies the current version of an object
  # to copy. If the current version is a delete marker, Amazon S3 behaves as if the object was
  # deleted. To copy a different version, use the <code>versionId</code> subresource.</p>
  # <p>If you enable versioning on the target bucket, Amazon S3 generates a unique version ID for
  # the object being copied. This version ID is different from the version ID of the source
  # object. Amazon S3 returns the version ID of the copied object in the
  # <code>x-amz-version-id</code> response header in the response.</p>
  # <p>If you do not enable versioning or suspend it on the target bucket, the version ID that
  # Amazon S3 generates is always null.</p>
  # <p>If the source object's storage class is GLACIER, you must restore a copy of this object
  # before you can use it as a source object for the copy operation. For more information, see
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html">RestoreObject</a>.</p>
  # <p>The following operations are related to <code>CopyObject</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  # </p>
  # </li>
  # </ul>
  # <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/CopyingObjectsExamples.html">Copying
  # Objects</a>.</p>
  def copy_object(input : CopyObjectRequest) : CopyObjectOutput
    path = "/{Bucket}/{Key+}?x-id=CopyObject"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    CopyObjectOutput.from_request(request)
  end



      # <p>Creates a new S3 bucket. To create a bucket, you must register with Amazon S3 and have a
  # valid AWS Access Key ID to authenticate requests. Anonymous requests are never allowed to
  # create buckets. By creating the bucket, you become the bucket owner.</p>
  # <p>Not every string is an acceptable bucket name. For information about bucket naming
  # restrictions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html">Working with Amazon S3
  # buckets</a>. </p>
  # <p>If you want to create an Amazon S3 on Outposts bucket, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateBucket.html">Create Bucket</a>. </p>
  # <p>By default, the bucket is created in the US East (N. Virginia) Region. You can
  # optionally specify a Region in the request body. You might choose a Region to optimize
  # latency, minimize costs, or address regulatory requirements. For example, if you reside in
  # Europe, you will probably find it advantageous to create buckets in the Europe (Ireland)
  # Region. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html#access-bucket-intro">Accessing a
  # bucket</a>.</p>
  # <note>
  # <p>If you send your create bucket request to the <code>s3.amazonaws.com</code> endpoint,
  # the request goes to the us-east-1 Region. Accordingly, the signature calculations in
  # Signature Version 4 must use us-east-1 as the Region, even if the location constraint in
  # the request specifies another Region where the bucket is to be created. If you create a
  # bucket in a Region other than US East (N. Virginia), your application must be able to
  # handle 307 redirect. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/VirtualHosting.html">Virtual hosting of buckets</a>.</p>
  # </note>
  # <p>When creating a bucket using this operation, you can optionally specify the accounts or
  # groups that should be granted specific permissions on the bucket. There are two ways to
  # grant the appropriate permissions using the request headers.</p>
  # <ul>
  # <li>
  # <p>Specify a canned ACL using the <code>x-amz-acl</code> request header. Amazon S3
  # supports a set of predefined ACLs, known as <i>canned ACLs</i>. Each
  # canned ACL has a predefined set of grantees and permissions. For more information,
  # see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned ACL</a>.</p>
  # </li>
  # <li>
  # <p>Specify access permissions explicitly using the <code>x-amz-grant-read</code>,
  # <code>x-amz-grant-write</code>, <code>x-amz-grant-read-acp</code>,
  # <code>x-amz-grant-write-acp</code>, and <code>x-amz-grant-full-control</code>
  # headers. These headers map to the set of permissions Amazon S3 supports in an ACL. For
  # more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access control list
  # (ACL) overview</a>.</p>
  # <p>You specify each grantee as a type=value pair, where the type is one of the
  # following:</p>
  # <ul>
  # <li>
  # <p>
  # <code>id</code> – if the value specified is the canonical user ID of an AWS
  # account</p>
  # </li>
  # <li>
  # <p>
  # <code>uri</code> – if you are granting permissions to a predefined
  # group</p>
  # </li>
  # <li>
  # <p>
  # <code>emailAddress</code> – if the value specified is the email address of
  # an AWS account</p>
  # <note>
  # <p>Using email addresses to specify a grantee is only supported in the following AWS Regions: </p>
  # <ul>
  # <li>
  # <p>US East (N. Virginia)</p>
  # </li>
  # <li>
  # <p>US West (N. California)</p>
  # </li>
  # <li>
  # <p> US West (Oregon)</p>
  # </li>
  # <li>
  # <p> Asia Pacific (Singapore)</p>
  # </li>
  # <li>
  # <p>Asia Pacific (Sydney)</p>
  # </li>
  # <li>
  # <p>Asia Pacific (Tokyo)</p>
  # </li>
  # <li>
  # <p>Europe (Ireland)</p>
  # </li>
  # <li>
  # <p>South America (São Paulo)</p>
  # </li>
  # </ul>
  # <p>For a list of all the Amazon S3 supported Regions and endpoints, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions and Endpoints</a> in the AWS General Reference.</p>
  # </note>
  # </li>
  # </ul>
  # <p>For example, the following <code>x-amz-grant-read</code> header grants the AWS accounts identified by account IDs permissions to read object data and its metadata:</p>
  # <p>
  # <code>x-amz-grant-read: id="11112222333", id="444455556666" </code>
  # </p>
  # </li>
  # </ul>
  # <note>
  # <p>You can use either a canned ACL or specify access permissions explicitly. You cannot
  # do both.</p>
  # </note>
  #
  #
  # <p>The following operations are related to <code>CreateBucket</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html">DeleteBucket</a>
  # </p>
  # </li>
  # </ul>
  def create_bucket(input : CreateBucketRequest) : CreateBucketOutput
    path = "/{Bucket}"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    CreateBucketOutput.from_request(request)
  end



      # <p>This operation initiates a multipart upload and returns an upload ID. This upload ID is
  # used to associate all of the parts in the specific multipart upload. You specify this
  # upload ID in each of your subsequent upload part requests (see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>). You also include this
  # upload ID in the final request to either complete or abort the multipart upload
  # request.</p>
  #
  # <p>For more information about multipart uploads, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html">Multipart Upload Overview</a>.</p>
  #
  # <p>If you have configured a lifecycle rule to abort incomplete multipart uploads, the
  # upload must complete within the number of days specified in the bucket lifecycle
  # configuration. Otherwise, the incomplete multipart upload becomes eligible for an abort
  # operation and Amazon S3 aborts the multipart upload. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config">Aborting
  # Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a>.</p>
  #
  # <p>For information about the permissions required to use the multipart upload API, see
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart Upload API and
  # Permissions</a>.</p>
  #
  # <p>For request signing, multipart upload is just a series of regular requests. You initiate
  # a multipart upload, send one or more requests to upload parts, and then complete the
  # multipart upload process. You sign each request individually. There is nothing special
  # about signing multipart upload requests. For more information about signing, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating
  # Requests (AWS Signature Version 4)</a>.</p>
  #
  # <note>
  # <p> After you initiate a multipart upload and upload one or more parts, to stop being
  # charged for storing the uploaded parts, you must either complete or abort the multipart
  # upload. Amazon S3 frees up the space used to store the parts and stop charging you for
  # storing them only after you either complete or abort a multipart upload. </p>
  # </note>
  #
  # <p>You can optionally request server-side encryption. For server-side encryption, Amazon S3
  # encrypts your data as it writes it to disks in its data centers and decrypts it when you
  # access it. You can provide your own encryption key, or use AWS Key Management Service (AWS
  # KMS) customer master keys (CMKs) or Amazon S3-managed encryption keys. If you choose to provide
  # your own encryption key, the request headers you provide in <a href="AmazonS3/latest/API/API_UploadPart.html">UploadPart</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html">UploadPartCopy</a> requests must match the headers you used in the request to
  # initiate the upload by using <code>CreateMultipartUpload</code>. </p>
  # <p>To perform a multipart upload with encryption using an AWS KMS CMK, the requester must
  # have permission to the <code>kms:Encrypt</code>, <code>kms:Decrypt</code>,
  # <code>kms:ReEncrypt*</code>, <code>kms:GenerateDataKey*</code>, and
  # <code>kms:DescribeKey</code> actions on the key. These permissions are required because
  # Amazon S3 must decrypt and read data from the encrypted file parts before it completes the
  # multipart upload.</p>
  #
  # <p>If your AWS Identity and Access Management (IAM) user or role is in the same AWS account
  # as the AWS KMS CMK, then you must have these permissions on the key policy. If your IAM
  # user or role belongs to a different account than the key, then you must have the
  # permissions on both the key policy and your IAM user or role.</p>
  #
  #
  # <p> For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">Protecting
  # Data Using Server-Side Encryption</a>.</p>
  #
  # <dl>
  # <dt>Access Permissions</dt>
  # <dd>
  # <p>When copying an object, you can optionally specify the accounts or groups that
  # should be granted specific permissions on the new object. There are two ways to
  # grant the permissions using the request headers:</p>
  # <ul>
  # <li>
  # <p>Specify a canned ACL with the <code>x-amz-acl</code> request header. For
  # more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned ACL</a>.</p>
  # </li>
  # <li>
  # <p>Specify access permissions explicitly with the
  # <code>x-amz-grant-read</code>, <code>x-amz-grant-read-acp</code>,
  # <code>x-amz-grant-write-acp</code>, and
  # <code>x-amz-grant-full-control</code> headers. These parameters map to
  # the set of permissions that Amazon S3 supports in an ACL. For more information,
  # see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access Control List (ACL)
  # Overview</a>.</p>
  # </li>
  # </ul>
  # <p>You can use either a canned ACL or specify access permissions explicitly. You
  # cannot do both.</p>
  # </dd>
  # <dt>Server-Side- Encryption-Specific Request Headers</dt>
  # <dd>
  # <p>You can optionally tell Amazon S3 to encrypt data at rest using server-side
  # encryption. Server-side encryption is for data encryption at rest. Amazon S3 encrypts
  # your data as it writes it to disks in its data centers and decrypts it when you
  # access it. The option you use depends on whether you want to use AWS managed
  # encryption keys or provide your own encryption key. </p>
  # <ul>
  # <li>
  # <p>Use encryption keys managed by Amazon S3 or customer master keys (CMKs) stored
  # in AWS Key Management Service (AWS KMS) – If you want AWS to manage the keys
  # used to encrypt data, specify the following headers in the request.</p>
  # <ul>
  # <li>
  # <p>x-amz-server-side-encryption</p>
  # </li>
  # <li>
  # <p>x-amz-server-side-encryption-aws-kms-key-id</p>
  # </li>
  # <li>
  # <p>x-amz-server-side-encryption-context</p>
  # </li>
  # </ul>
  # <note>
  # <p>If you specify <code>x-amz-server-side-encryption:aws:kms</code>, but
  # don't provide <code>x-amz-server-side-encryption-aws-kms-key-id</code>,
  # Amazon S3 uses the AWS managed CMK in AWS KMS to protect the data.</p>
  # </note>
  # <important>
  # <p>All GET and PUT requests for an object protected by AWS KMS fail if
  # you don't make them with SSL or by using SigV4.</p>
  # </important>
  # <p>For more information about server-side encryption with CMKs stored in AWS
  # KMS (SSE-KMS), see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html">Protecting Data Using Server-Side Encryption with CMKs stored in AWS
  # KMS</a>.</p>
  # </li>
  # <li>
  # <p>Use customer-provided encryption keys – If you want to manage your own
  # encryption keys, provide all the following headers in the request.</p>
  # <ul>
  # <li>
  # <p>x-amz-server-side-encryption-customer-algorithm</p>
  # </li>
  # <li>
  # <p>x-amz-server-side-encryption-customer-key</p>
  # </li>
  # <li>
  # <p>x-amz-server-side-encryption-customer-key-MD5</p>
  # </li>
  # </ul>
  # <p>For more information about server-side encryption with CMKs stored in AWS
  # KMS (SSE-KMS), see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html">Protecting Data Using Server-Side Encryption with CMKs stored in AWS
  # KMS</a>.</p>
  # </li>
  # </ul>
  # </dd>
  # <dt>Access-Control-List (ACL)-Specific Request Headers</dt>
  # <dd>
  # <p>You also can use the following access control–related headers with this
  # operation. By default, all objects are private. Only the owner has full access
  # control. When adding a new object, you can grant permissions to individual AWS
  # accounts or to predefined groups defined by Amazon S3. These permissions are then added
  # to the access control list (ACL) on the object. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html">Using ACLs</a>. With this
  # operation, you can grant access permissions using one of the following two
  # methods:</p>
  # <ul>
  # <li>
  # <p>Specify a canned ACL (<code>x-amz-acl</code>) — Amazon S3 supports a set of
  # predefined ACLs, known as <i>canned ACLs</i>. Each canned ACL
  # has a predefined set of grantees and permissions. For more information, see
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned
  # ACL</a>.</p>
  # </li>
  # <li>
  # <p>Specify access permissions explicitly — To explicitly grant access
  # permissions to specific AWS accounts or groups, use the following headers.
  # Each header maps to specific permissions that Amazon S3 supports in an ACL. For
  # more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access
  # Control List (ACL) Overview</a>. In the header, you specify a list of
  # grantees who get the specific permission. To grant permissions explicitly,
  # use:</p>
  # <ul>
  # <li>
  # <p>x-amz-grant-read</p>
  # </li>
  # <li>
  # <p>x-amz-grant-write</p>
  # </li>
  # <li>
  # <p>x-amz-grant-read-acp</p>
  # </li>
  # <li>
  # <p>x-amz-grant-write-acp</p>
  # </li>
  # <li>
  # <p>x-amz-grant-full-control</p>
  # </li>
  # </ul>
  # <p>You specify each grantee as a type=value pair, where the type is one of
  # the following:</p>
  # <ul>
  # <li>
  # <p>
  # <code>id</code> – if the value specified is the canonical user ID
  # of an AWS account</p>
  # </li>
  # <li>
  # <p>
  # <code>uri</code> – if you are granting permissions to a predefined
  # group</p>
  # </li>
  # <li>
  # <p>
  # <code>emailAddress</code> – if the value specified is the email
  # address of an AWS account</p>
  # <note>
  # <p>Using email addresses to specify a grantee is only supported in the following AWS Regions: </p>
  # <ul>
  # <li>
  # <p>US East (N. Virginia)</p>
  # </li>
  # <li>
  # <p>US West (N. California)</p>
  # </li>
  # <li>
  # <p> US West (Oregon)</p>
  # </li>
  # <li>
  # <p> Asia Pacific (Singapore)</p>
  # </li>
  # <li>
  # <p>Asia Pacific (Sydney)</p>
  # </li>
  # <li>
  # <p>Asia Pacific (Tokyo)</p>
  # </li>
  # <li>
  # <p>Europe (Ireland)</p>
  # </li>
  # <li>
  # <p>South America (São Paulo)</p>
  # </li>
  # </ul>
  # <p>For a list of all the Amazon S3 supported Regions and endpoints, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions and Endpoints</a> in the AWS General Reference.</p>
  # </note>
  # </li>
  # </ul>
  # <p>For example, the following <code>x-amz-grant-read</code> header grants the AWS accounts identified by account IDs permissions to read object data and its metadata:</p>
  # <p>
  # <code>x-amz-grant-read: id="11112222333", id="444455556666" </code>
  # </p>
  # </li>
  # </ul>
  #
  # </dd>
  # </dl>
  #
  # <p>The following operations are related to <code>CreateMultipartUpload</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html">ListMultipartUploads</a>
  # </p>
  # </li>
  # </ul>
  def create_multipart_upload(input : CreateMultipartUploadRequest) : CreateMultipartUploadOutput
    path = "/{Bucket}/{Key+}?uploads"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    CreateMultipartUploadOutput.from_request(request)
  end



      # <p>Deletes the S3 bucket. All objects (including all object versions and delete markers) in
  # the bucket must be deleted before the bucket itself can be deleted.</p>
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket(input : DeleteBucketRequest) :   NoReturn
    path = "/{Bucket}"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>Deletes an analytics configuration for the bucket (specified by the analytics
  # configuration ID).</p>
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:PutAnalyticsConfiguration</code> action. The bucket owner has this permission
  # by default. The bucket owner can grant this permission to others. For more information
  # about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p>For information about the Amazon S3 analytics feature, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/analytics-storage-class.html">Amazon S3 Analytics – Storage Class
  # Analysis</a>. </p>
  #
  # <p>The following operations are related to
  # <code>DeleteBucketAnalyticsConfiguration</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAnalyticsConfiguration.html">GetBucketAnalyticsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketAnalyticsConfigurations.html">ListBucketAnalyticsConfigurations</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAnalyticsConfiguration.html">PutBucketAnalyticsConfiguration</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket_analytics_configuration(input : DeleteBucketAnalyticsConfigurationRequest) :   NoReturn
    path = "/{Bucket}?analytics"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>Deletes the <code>cors</code> configuration information set for the bucket.</p>
  # <p>To use this operation, you must have permission to perform the
  # <code>s3:PutBucketCORS</code> action. The bucket owner has this permission by default
  # and can grant this permission to others. </p>
  # <p>For information about <code>cors</code>, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html">Enabling
  # Cross-Origin Resource Sharing</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  #
  # <p class="title">
  # <b>Related Resources:</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketCors.html">PutBucketCors</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTOPTIONSobject.html">RESTOPTIONSobject</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket_cors(input : DeleteBucketCorsRequest) :   NoReturn
    path = "/{Bucket}?cors"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>This implementation of the DELETE operation removes default encryption from the bucket.
  # For information about the Amazon S3 default encryption feature, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html">Amazon S3 Default Bucket Encryption</a> in the
  # <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:PutEncryptionConfiguration</code> action. The bucket owner has this permission
  # by default. The bucket owner can grant this permission to others. For more information
  # about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to your Amazon S3
  # Resources</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketEncryption.html">PutBucketEncryption</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketEncryption.html">GetBucketEncryption</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket_encryption(input : DeleteBucketEncryptionRequest) :   NoReturn
    path = "/{Bucket}?encryption"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>Deletes the S3 Intelligent-Tiering configuration from the specified bucket.</p>
  # <p>The S3 Intelligent-Tiering storage class is designed to optimize storage costs by automatically moving data to the most cost-effective storage access tier, without additional operational overhead. S3 Intelligent-Tiering delivers automatic cost savings by moving data between access tiers, when access patterns change.</p>
  # <p>The S3 Intelligent-Tiering storage class is suitable for objects larger than 128 KB that you plan to store for at least 30 days. If the size of an object is less than 128 KB, it is not eligible for auto-tiering. Smaller objects can be stored, but they are always charged at the frequent access tier rates in the S3 Intelligent-Tiering storage class. </p>
  # <p>If you delete an object before the end of the 30-day minimum storage duration period, you are charged for 30 days. For more information, see  <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access">Storage class for automatically optimizing frequently and infrequently accessed objects</a>.</p>
  # <p>Operations related to
  # <code>DeleteBucketIntelligentTieringConfiguration</code> include: </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketIntelligentTieringConfiguration.html">GetBucketIntelligentTieringConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketIntelligentTieringConfiguration.html">PutBucketIntelligentTieringConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketIntelligentTieringConfigurations.html">ListBucketIntelligentTieringConfigurations</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket_intelligent_tiering_configuration(input : DeleteBucketIntelligentTieringConfigurationRequest) :   NoReturn
    path = "/{Bucket}?intelligent-tiering"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>Deletes an inventory configuration (identified by the inventory ID) from the
  # bucket.</p>
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:PutInventoryConfiguration</code> action. The bucket owner has this permission
  # by default. The bucket owner can grant this permission to others. For more information
  # about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  # <p>For information about the Amazon S3 inventory feature, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html">Amazon S3 Inventory</a>.</p>
  # <p>Operations related to <code>DeleteBucketInventoryConfiguration</code> include: </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketInventoryConfiguration.html">GetBucketInventoryConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketInventoryConfiguration.html">PutBucketInventoryConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketInventoryConfigurations.html">ListBucketInventoryConfigurations</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket_inventory_configuration(input : DeleteBucketInventoryConfigurationRequest) :   NoReturn
    path = "/{Bucket}?inventory"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>Deletes the lifecycle configuration from the specified bucket. Amazon S3 removes all the
  # lifecycle configuration rules in the lifecycle subresource associated with the bucket. Your
  # objects never expire, and Amazon S3 no longer automatically deletes any objects on the basis of
  # rules contained in the deleted lifecycle configuration.</p>
  # <p>To use this operation, you must have permission to perform the
  # <code>s3:PutLifecycleConfiguration</code> action. By default, the bucket owner has this
  # permission and the bucket owner can grant this permission to others.</p>
  #
  # <p>There is usually some time lag before lifecycle configuration deletion is fully
  # propagated to all the Amazon S3 systems.</p>
  #
  # <p>For more information about the object expiration, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#intro-lifecycle-rules-actions">Elements to
  # Describe Lifecycle Actions</a>.</p>
  # <p>Related actions include:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket_lifecycle(input : DeleteBucketLifecycleRequest) :   NoReturn
    path = "/{Bucket}?lifecycle"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>Deletes a metrics configuration for the Amazon CloudWatch request metrics (specified by the
  # metrics configuration ID) from the bucket. Note that this doesn't include the daily storage
  # metrics.</p>
  #
  # <p> To use this operation, you must have permissions to perform the
  # <code>s3:PutMetricsConfiguration</code> action. The bucket owner has this permission by
  # default. The bucket owner can grant this permission to others. For more information about
  # permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p>For information about CloudWatch request metrics for Amazon S3, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html">Monitoring Metrics with Amazon CloudWatch</a>. </p>
  # <p>The following operations are related to
  # <code>DeleteBucketMetricsConfiguration</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetricsConfiguration.html">GetBucketMetricsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html">PutBucketMetricsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketMetricsConfigurations.html">ListBucketMetricsConfigurations</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html">Monitoring Metrics with Amazon
  # CloudWatch</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket_metrics_configuration(input : DeleteBucketMetricsConfigurationRequest) :   NoReturn
    path = "/{Bucket}?metrics"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>Removes <code>OwnershipControls</code> for an Amazon S3 bucket. To use this operation, you
  # must have the <code>s3:PutBucketOwnershipControls</code> permission. For more information
  # about Amazon S3 permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  # Permissions in a Policy</a>.</p>
  # <p>For information about Amazon S3 Object Ownership, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/about-object-ownership.html">Using Object Ownership</a>. </p>
  # <p>The following operations are related to
  # <code>DeleteBucketOwnershipControls</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a>GetBucketOwnershipControls</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a>PutBucketOwnershipControls</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket_ownership_controls(input : DeleteBucketOwnershipControlsRequest) :   NoReturn
    path = "/{Bucket}?ownershipControls"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>This implementation of the DELETE operation uses the policy subresource to delete the
  # policy of a specified bucket. If you are using an identity other than the root user of the
  # AWS account that owns the bucket, the calling identity must have the
  # <code>DeleteBucketPolicy</code> permissions on the specified bucket and belong to the
  # bucket owner's account to use this operation. </p>
  #
  # <p>If you don't have <code>DeleteBucketPolicy</code> permissions, Amazon S3 returns a <code>403
  # Access Denied</code> error. If you have the correct permissions, but you're not using an
  # identity that belongs to the bucket owner's account, Amazon S3 returns a <code>405 Method Not
  # Allowed</code> error. </p>
  #
  #
  # <important>
  # <p>As a security precaution, the root user of the AWS account that owns a bucket can
  # always use this operation, even if the policy explicitly denies the root user the
  # ability to perform this action.</p>
  # </important>
  #
  # <p>For more information about bucket policies, see <a href=" https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using Bucket Policies and
  # UserPolicies</a>. </p>
  # <p>The following operations are related to <code>DeleteBucketPolicy</code>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket_policy(input : DeleteBucketPolicyRequest) :   NoReturn
    path = "/{Bucket}?policy"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p> Deletes the replication configuration from the bucket.</p>
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:PutReplicationConfiguration</code> action. The bucket owner has these
  # permissions by default and can grant it to others. For more information about permissions,
  # see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>. </p>
  # <note>
  # <p>It can take a while for the deletion of a replication configuration to fully
  # propagate.</p>
  # </note>
  #
  # <p> For information about replication configuration, see <a href=" https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html">Replication</a> in the <i>Amazon S3 Developer
  # Guide</i>. </p>
  #
  # <p>The following operations are related to <code>DeleteBucketReplication</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketReplication.html">PutBucketReplication</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketReplication.html">GetBucketReplication</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket_replication(input : DeleteBucketReplicationRequest) :   NoReturn
    path = "/{Bucket}?replication"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>Deletes the tags from the bucket.</p>
  #
  # <p>To use this operation, you must have permission to perform the
  # <code>s3:PutBucketTagging</code> action. By default, the bucket owner has this
  # permission and can grant this permission to others. </p>
  # <p>The following operations are related to <code>DeleteBucketTagging</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketTagging.html">GetBucketTagging</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketTagging.html">PutBucketTagging</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket_tagging(input : DeleteBucketTaggingRequest) :   NoReturn
    path = "/{Bucket}?tagging"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>This operation removes the website configuration for a bucket. Amazon S3 returns a <code>200
  # OK</code> response upon successfully deleting a website configuration on the specified
  # bucket. You will get a <code>200 OK</code> response if the website configuration you are
  # trying to delete does not exist on the bucket. Amazon S3 returns a <code>404</code> response if
  # the bucket specified in the request does not exist.</p>
  #
  # <p>This DELETE operation requires the <code>S3:DeleteBucketWebsite</code> permission. By
  # default, only the bucket owner can delete the website configuration attached to a bucket.
  # However, bucket owners can grant other users permission to delete the website configuration
  # by writing a bucket policy granting them the <code>S3:DeleteBucketWebsite</code>
  # permission. </p>
  #
  # <p>For more information about hosting websites, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html">Hosting Websites on Amazon S3</a>. </p>
  #
  # <p>The following operations are related to <code>DeleteBucketWebsite</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketWebsite.html">GetBucketWebsite</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketWebsite.html">PutBucketWebsite</a>
  # </p>
  # </li>
  # </ul>
  def delete_bucket_website(input : DeleteBucketWebsiteRequest) :   NoReturn
    path = "/{Bucket}?website"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>Removes the null version (if there is one) of an object and inserts a delete marker,
  # which becomes the latest version of the object. If there isn't a null version, Amazon S3 does
  # not remove any objects.</p>
  #
  # <p>To remove a specific version, you must be the bucket owner and you must use the version
  # Id subresource. Using this subresource permanently deletes the version. If the object
  # deleted is a delete marker, Amazon S3 sets the response header,
  # <code>x-amz-delete-marker</code>, to true. </p>
  #
  # <p>If the object you want to delete is in a bucket where the bucket versioning
  # configuration is MFA Delete enabled, you must include the <code>x-amz-mfa</code> request
  # header in the DELETE <code>versionId</code> request. Requests that include
  # <code>x-amz-mfa</code> must use HTTPS. </p>
  #
  # <p> For more information about MFA Delete, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMFADelete.html">Using MFA Delete</a>. To see sample requests that use versioning, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectDELETE.html#ExampleVersionObjectDelete">Sample Request</a>. </p>
  #
  # <p>You can delete objects by explicitly calling the DELETE Object API or configure its
  # lifecycle (<a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycle.html">PutBucketLifecycle</a>) to
  # enable Amazon S3 to remove them for you. If you want to block users or accounts from removing or
  # deleting objects from your bucket, you must deny them the <code>s3:DeleteObject</code>,
  # <code>s3:DeleteObjectVersion</code>, and <code>s3:PutLifeCycleConfiguration</code>
  # actions. </p>
  #
  # <p>The following operation is related to <code>DeleteObject</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  # </p>
  # </li>
  # </ul>
  def delete_object(input : DeleteObjectRequest) : DeleteObjectOutput
    path = "/{Bucket}/{Key+}?x-id=DeleteObject"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    DeleteObjectOutput.from_request(request)
  end



      # <p>This operation enables you to delete multiple objects from a bucket using a single HTTP
  # request. If you know the object keys that you want to delete, then this operation provides
  # a suitable alternative to sending individual delete requests, reducing per-request
  # overhead.</p>
  #
  # <p>The request contains a list of up to 1000 keys that you want to delete. In the XML, you
  # provide the object key names, and optionally, version IDs if you want to delete a specific
  # version of the object from a versioning-enabled bucket. For each key, Amazon S3 performs a
  # delete operation and returns the result of that delete, success, or failure, in the
  # response. Note that if the object specified in the request is not found, Amazon S3 returns the
  # result as deleted.</p>
  #
  # <p> The operation supports two modes for the response: verbose and quiet. By default, the
  # operation uses verbose mode in which the response includes the result of deletion of each
  # key in your request. In quiet mode the response includes only keys where the delete
  # operation encountered an error. For a successful deletion, the operation does not return
  # any information about the delete in the response body.</p>
  #
  # <p>When performing this operation on an MFA Delete enabled bucket, that attempts to delete
  # any versioned objects, you must include an MFA token. If you do not provide one, the entire
  # request will fail, even if there are non-versioned objects you are trying to delete. If you
  # provide an invalid token, whether there are versioned keys in the request or not, the
  # entire Multi-Object Delete request will fail. For information about MFA Delete, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html#MultiFactorAuthenticationDelete"> MFA
  # Delete</a>.</p>
  #
  # <p>Finally, the Content-MD5 header is required for all Multi-Object Delete requests. Amazon
  # S3 uses the header value to ensure that your request body has not been altered in
  # transit.</p>
  #
  # <p>The following operations are related to <code>DeleteObjects</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  # </p>
  # </li>
  # </ul>
  def delete_objects(input : DeleteObjectsRequest) : DeleteObjectsOutput
    path = "/{Bucket}?delete"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    DeleteObjectsOutput.from_request(request)
  end



      # <p>Removes the entire tag set from the specified object. For more information about
  # managing object tags, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-tagging.html"> Object
  # Tagging</a>.</p>
  #
  # <p>To use this operation, you must have permission to perform the
  # <code>s3:DeleteObjectTagging</code> action.</p>
  #
  # <p>To delete tags of a specific object version, add the <code>versionId</code> query
  # parameter in the request. You will need permission for the
  # <code>s3:DeleteObjectVersionTagging</code> action.</p>
  #
  # <p>The following operations are related to
  # <code>DeleteBucketMetricsConfiguration</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectTagging.html">PutObjectTagging</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html">GetObjectTagging</a>
  # </p>
  # </li>
  # </ul>
  def delete_object_tagging(input : DeleteObjectTaggingRequest) : DeleteObjectTaggingOutput
    path = "/{Bucket}/{Key+}?tagging"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    DeleteObjectTaggingOutput.from_request(request)
  end



      # <p>Removes the <code>PublicAccessBlock</code> configuration for an Amazon S3 bucket. To use this
  # operation, you must have the <code>s3:PutBucketPublicAccessBlock</code> permission. For
  # more information about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p>The following operations are related to <code>DeletePublicAccessBlock</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">Using Amazon S3 Block
  # Public Access</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html">GetPublicAccessBlock</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutPublicAccessBlock.html">PutPublicAccessBlock</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketPolicyStatus.html">GetBucketPolicyStatus</a>
  # </p>
  # </li>
  # </ul>
  def delete_public_access_block(input : DeletePublicAccessBlockRequest) :   NoReturn
    path = "/{Bucket}?publicAccessBlock"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("DELETE", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 204)

    nil
  end



      # <p>This implementation of the GET operation uses the <code>accelerate</code> subresource to
  # return the Transfer Acceleration state of a bucket, which is either <code>Enabled</code> or
  # <code>Suspended</code>. Amazon S3 Transfer Acceleration is a bucket-level feature that
  # enables you to perform faster data transfers to and from Amazon S3.</p>
  # <p>To use this operation, you must have permission to perform the
  # <code>s3:GetAccelerateConfiguration</code> action. The bucket owner has this permission
  # by default. The bucket owner can grant this permission to others. For more information
  # about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to your Amazon S3
  # Resources</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p>You set the Transfer Acceleration state of an existing bucket to <code>Enabled</code> or
  # <code>Suspended</code> by using the <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAccelerateConfiguration.html">PutBucketAccelerateConfiguration</a> operation. </p>
  # <p>A GET <code>accelerate</code> request does not return a state value for a bucket that
  # has no transfer acceleration state. A bucket has no Transfer Acceleration state if a state
  # has never been set on the bucket. </p>
  #
  # <p>For more information about transfer acceleration, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html">Transfer Acceleration</a> in the
  # Amazon Simple Storage Service Developer Guide.</p>
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAccelerateConfiguration.html">PutBucketAccelerateConfiguration</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_accelerate_configuration(input : GetBucketAccelerateConfigurationRequest) : GetBucketAccelerateConfigurationOutput
    path = "/{Bucket}?accelerate"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketAccelerateConfigurationOutput.from_request(request)
  end



      # <p>This implementation of the <code>GET</code> operation uses the <code>acl</code>
  # subresource to return the access control list (ACL) of a bucket. To use <code>GET</code> to
  # return the ACL of the bucket, you must have <code>READ_ACP</code> access to the bucket. If
  # <code>READ_ACP</code> permission is granted to the anonymous user, you can return the
  # ACL of the bucket without using an authorization header.</p>
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjects.html">ListObjects</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_acl(input : GetBucketAclRequest) : GetBucketAclOutput
    path = "/{Bucket}?acl"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketAclOutput.from_request(request)
  end



      # <p>This implementation of the GET operation returns an analytics configuration (identified
  # by the analytics configuration ID) from the bucket.</p>
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:GetAnalyticsConfiguration</code> action. The bucket owner has this permission
  # by default. The bucket owner can grant this permission to others. For more information
  # about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources"> Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a> in the <i>Amazon Simple Storage Service Developer Guide</i>. </p>
  # <p>For information about Amazon S3 analytics feature, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/analytics-storage-class.html">Amazon S3 Analytics – Storage Class
  # Analysis</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketAnalyticsConfiguration.html">DeleteBucketAnalyticsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketAnalyticsConfigurations.html">ListBucketAnalyticsConfigurations</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAnalyticsConfiguration.html">PutBucketAnalyticsConfiguration</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_analytics_configuration(input : GetBucketAnalyticsConfigurationRequest) : GetBucketAnalyticsConfigurationOutput
    path = "/{Bucket}?analytics&x-id=GetBucketAnalyticsConfiguration"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketAnalyticsConfigurationOutput.from_request(request)
  end



      # <p>Returns the cors configuration information set for the bucket.</p>
  #
  # <p> To use this operation, you must have permission to perform the s3:GetBucketCORS action.
  # By default, the bucket owner has this permission and can grant it to others.</p>
  #
  # <p> For more information about cors, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html"> Enabling
  # Cross-Origin Resource Sharing</a>.</p>
  #
  # <p>The following operations are related to <code>GetBucketCors</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketCors.html">PutBucketCors</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketCors.html">DeleteBucketCors</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_cors(input : GetBucketCorsRequest) : GetBucketCorsOutput
    path = "/{Bucket}?cors"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketCorsOutput.from_request(request)
  end



      # <p>Returns the default encryption configuration for an Amazon S3 bucket. For information about
  # the Amazon S3 default encryption feature, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html">Amazon S3 Default Bucket Encryption</a>.</p>
  #
  # <p> To use this operation, you must have permission to perform the
  # <code>s3:GetEncryptionConfiguration</code> action. The bucket owner has this permission
  # by default. The bucket owner can grant this permission to others. For more information
  # about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  # <p>The following operations are related to <code>GetBucketEncryption</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketEncryption.html">PutBucketEncryption</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketEncryption.html">DeleteBucketEncryption</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_encryption(input : GetBucketEncryptionRequest) : GetBucketEncryptionOutput
    path = "/{Bucket}?encryption"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketEncryptionOutput.from_request(request)
  end



      # <p>Gets the S3 Intelligent-Tiering configuration from the specified bucket.</p>
  # <p>The S3 Intelligent-Tiering storage class is designed to optimize storage costs by automatically moving data to the most cost-effective storage access tier, without additional operational overhead. S3 Intelligent-Tiering delivers automatic cost savings by moving data between access tiers, when access patterns change.</p>
  # <p>The S3 Intelligent-Tiering storage class is suitable for objects larger than 128 KB that you plan to store for at least 30 days. If the size of an object is less than 128 KB, it is not eligible for auto-tiering. Smaller objects can be stored, but they are always charged at the frequent access tier rates in the S3 Intelligent-Tiering storage class. </p>
  # <p>If you delete an object before the end of the 30-day minimum storage duration period, you are charged for 30 days. For more information, see  <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access">Storage class for automatically optimizing frequently and infrequently accessed objects</a>.</p>
  # <p>Operations related to
  # <code>GetBucketIntelligentTieringConfiguration</code> include: </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketIntelligentTieringConfiguration.html">DeleteBucketIntelligentTieringConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketIntelligentTieringConfiguration.html">PutBucketIntelligentTieringConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketIntelligentTieringConfigurations.html">ListBucketIntelligentTieringConfigurations</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_intelligent_tiering_configuration(input : GetBucketIntelligentTieringConfigurationRequest) : GetBucketIntelligentTieringConfigurationOutput
    path = "/{Bucket}?intelligent-tiering&x-id=GetBucketIntelligentTieringConfiguration"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketIntelligentTieringConfigurationOutput.from_request(request)
  end



      # <p>Returns an inventory configuration (identified by the inventory configuration ID) from
  # the bucket.</p>
  #
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:GetInventoryConfiguration</code> action. The bucket owner has this permission
  # by default and can grant this permission to others. For more information about permissions,
  # see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p>For information about the Amazon S3 inventory feature, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html">Amazon S3 Inventory</a>.</p>
  #
  # <p>The following operations are related to
  # <code>GetBucketInventoryConfiguration</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketInventoryConfiguration.html">DeleteBucketInventoryConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketInventoryConfigurations.html">ListBucketInventoryConfigurations</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketInventoryConfiguration.html">PutBucketInventoryConfiguration</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_inventory_configuration(input : GetBucketInventoryConfigurationRequest) : GetBucketInventoryConfigurationOutput
    path = "/{Bucket}?inventory&x-id=GetBucketInventoryConfiguration"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketInventoryConfigurationOutput.from_request(request)
  end



      # <note>
  # <p>Bucket lifecycle configuration now supports specifying a lifecycle rule using an
  # object key name prefix, one or more object tags, or a combination of both. Accordingly,
  # this section describes the latest API. The response describes the new filter element
  # that you can use to specify a filter to select a subset of objects to which the rule
  # applies. If you are using a previous version of the lifecycle configuration, it still
  # works. For the earlier API description, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycle.html">GetBucketLifecycle</a>.</p>
  # </note>
  # <p>Returns the lifecycle configuration information set on the bucket. For information about
  # lifecycle configuration, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html">Object
  # Lifecycle Management</a>.</p>
  #
  # <p>To use this operation, you must have permission to perform the
  # <code>s3:GetLifecycleConfiguration</code> action. The bucket owner has this permission,
  # by default. The bucket owner can grant this permission to others. For more information
  # about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p>
  # <code>GetBucketLifecycleConfiguration</code> has the following special error:</p>
  # <ul>
  # <li>
  # <p>Error code: <code>NoSuchLifecycleConfiguration</code>
  # </p>
  # <ul>
  # <li>
  # <p>Description: The lifecycle configuration does not exist.</p>
  # </li>
  # <li>
  # <p>HTTP Status Code: 404 Not Found</p>
  # </li>
  # <li>
  # <p>SOAP Fault Code Prefix: Client</p>
  # </li>
  # </ul>
  # </li>
  # </ul>
  # <p>The following operations are related to
  # <code>GetBucketLifecycleConfiguration</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycle.html">GetBucketLifecycle</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycle.html">PutBucketLifecycle</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketLifecycle.html">DeleteBucketLifecycle</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_lifecycle_configuration(input : GetBucketLifecycleConfigurationRequest) : GetBucketLifecycleConfigurationOutput
    path = "/{Bucket}?lifecycle"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketLifecycleConfigurationOutput.from_request(request)
  end



      # <p>Returns the Region the bucket resides in. You set the bucket's Region using the
  # <code>LocationConstraint</code> request parameter in a <code>CreateBucket</code>
  # request. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>.</p>
  #
  # <p> To use this implementation of the operation, you must be the bucket owner.</p>
  #
  # <p>The following operations are related to <code>GetBucketLocation</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_location(input : GetBucketLocationRequest) : GetBucketLocationOutput
    path = "/{Bucket}?location"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketLocationOutput.from_request(request)
  end



      # <p>Returns the logging status of a bucket and the permissions users have to view and modify
  # that status. To use GET, you must be the bucket owner.</p>
  #
  # <p>The following operations are related to <code>GetBucketLogging</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLogging.html">PutBucketLogging</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_logging(input : GetBucketLoggingRequest) : GetBucketLoggingOutput
    path = "/{Bucket}?logging"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketLoggingOutput.from_request(request)
  end



      # <p>Gets a metrics configuration (specified by the metrics configuration ID) from the
  # bucket. Note that this doesn't include the daily storage metrics.</p>
  #
  # <p> To use this operation, you must have permissions to perform the
  # <code>s3:GetMetricsConfiguration</code> action. The bucket owner has this permission by
  # default. The bucket owner can grant this permission to others. For more information about
  # permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p> For information about CloudWatch request metrics for Amazon S3, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html">Monitoring Metrics with Amazon
  # CloudWatch</a>.</p>
  #
  # <p>The following operations are related to
  # <code>GetBucketMetricsConfiguration</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html">PutBucketMetricsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetricsConfiguration.html">DeleteBucketMetricsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketMetricsConfigurations.html">ListBucketMetricsConfigurations</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html">Monitoring Metrics with Amazon
  # CloudWatch</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_metrics_configuration(input : GetBucketMetricsConfigurationRequest) : GetBucketMetricsConfigurationOutput
    path = "/{Bucket}?metrics&x-id=GetBucketMetricsConfiguration"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketMetricsConfigurationOutput.from_request(request)
  end



      # <p>Returns the notification configuration of a bucket.</p>
  # <p>If notifications are not enabled on the bucket, the operation returns an empty
  # <code>NotificationConfiguration</code> element.</p>
  #
  # <p>By default, you must be the bucket owner to read the notification configuration of a
  # bucket. However, the bucket owner can use a bucket policy to grant permission to other
  # users to read this configuration with the <code>s3:GetBucketNotification</code>
  # permission.</p>
  #
  # <p>For more information about setting and reading the notification configuration on a
  # bucket, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Setting Up Notification of
  # Bucket Events</a>. For more information about bucket policies, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using Bucket Policies</a>.</p>
  #
  # <p>The following operation is related to <code>GetBucketNotification</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketNotification.html">PutBucketNotification</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_notification_configuration(input : GetBucketNotificationConfigurationRequest) : NotificationConfiguration
    path = "/{Bucket}?notification"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    NotificationConfiguration.from_request(request)
  end



      # <p>Retrieves <code>OwnershipControls</code> for an Amazon S3 bucket. To use this operation, you
  # must have the <code>s3:GetBucketOwnershipControls</code> permission. For more information
  # about Amazon S3 permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  # Permissions in a Policy</a>. </p>
  # <p>For information about Amazon S3 Object Ownership, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/about-object-ownership.html">Using Object Ownership</a>. </p>
  # <p>The following operations are related to <code>GetBucketOwnershipControls</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a>PutBucketOwnershipControls</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a>DeleteBucketOwnershipControls</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_ownership_controls(input : GetBucketOwnershipControlsRequest) : GetBucketOwnershipControlsOutput
    path = "/{Bucket}?ownershipControls"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketOwnershipControlsOutput.from_request(request)
  end



      # <p>Returns the policy of a specified bucket. If you are using an identity other than the
  # root user of the AWS account that owns the bucket, the calling identity must have the
  # <code>GetBucketPolicy</code> permissions on the specified bucket and belong to the
  # bucket owner's account in order to use this operation.</p>
  #
  # <p>If you don't have <code>GetBucketPolicy</code> permissions, Amazon S3 returns a <code>403
  # Access Denied</code> error. If you have the correct permissions, but you're not using an
  # identity that belongs to the bucket owner's account, Amazon S3 returns a <code>405 Method Not
  # Allowed</code> error.</p>
  #
  # <important>
  # <p>As a security precaution, the root user of the AWS account that owns a bucket can
  # always use this operation, even if the policy explicitly denies the root user the
  # ability to perform this action.</p>
  # </important>
  #
  # <p>For more information about bucket policies, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using Bucket Policies and User
  # Policies</a>.</p>
  #
  # <p>The following operation is related to <code>GetBucketPolicy</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_policy(input : GetBucketPolicyRequest) : GetBucketPolicyOutput
    path = "/{Bucket}?policy"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketPolicyOutput.from_request(request)
  end



      # <p>Retrieves the policy status for an Amazon S3 bucket, indicating whether the bucket is public.
  # In order to use this operation, you must have the <code>s3:GetBucketPolicyStatus</code>
  # permission. For more information about Amazon S3 permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying Permissions in a
  # Policy</a>.</p>
  #
  # <p> For more information about when Amazon S3 considers a bucket public, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The Meaning of "Public"</a>. </p>
  #
  # <p>The following operations are related to <code>GetBucketPolicyStatus</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">Using Amazon S3 Block
  # Public Access</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html">GetPublicAccessBlock</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutPublicAccessBlock.html">PutPublicAccessBlock</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeletePublicAccessBlock.html">DeletePublicAccessBlock</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_policy_status(input : GetBucketPolicyStatusRequest) : GetBucketPolicyStatusOutput
    path = "/{Bucket}?policyStatus"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketPolicyStatusOutput.from_request(request)
  end



      # <p>Returns the replication configuration of a bucket.</p>
  # <note>
  # <p> It can take a while to propagate the put or delete a replication configuration to
  # all Amazon S3 systems. Therefore, a get request soon after put or delete can return a wrong
  # result. </p>
  # </note>
  # <p> For information about replication configuration, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html">Replication</a> in the
  # <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  #
  # <p>This operation requires permissions for the <code>s3:GetReplicationConfiguration</code>
  # action. For more information about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using Bucket Policies and User
  # Policies</a>.</p>
  #
  # <p>If you include the <code>Filter</code> element in a replication configuration, you must
  # also include the <code>DeleteMarkerReplication</code> and <code>Priority</code> elements.
  # The response also returns those elements.</p>
  #
  # <p>For information about <code>GetBucketReplication</code> errors, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ReplicationErrorCodeList">List of
  # replication-related error codes</a>
  # </p>
  #
  #
  # <p>The following operations are related to <code>GetBucketReplication</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketReplication.html">PutBucketReplication</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketReplication.html">DeleteBucketReplication</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_replication(input : GetBucketReplicationRequest) : GetBucketReplicationOutput
    path = "/{Bucket}?replication"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketReplicationOutput.from_request(request)
  end



      # <p>Returns the request payment configuration of a bucket. To use this version of the
  # operation, you must be the bucket owner. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html">Requester Pays Buckets</a>.</p>
  #
  # <p>The following operations are related to <code>GetBucketRequestPayment</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjects.html">ListObjects</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_request_payment(input : GetBucketRequestPaymentRequest) : GetBucketRequestPaymentOutput
    path = "/{Bucket}?requestPayment"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketRequestPaymentOutput.from_request(request)
  end



      # <p>Returns the tag set associated with the bucket.</p>
  # <p>To use this operation, you must have permission to perform the
  # <code>s3:GetBucketTagging</code> action. By default, the bucket owner has this
  # permission and can grant this permission to others.</p>
  #
  # <p>
  # <code>GetBucketTagging</code> has the following special error:</p>
  # <ul>
  # <li>
  # <p>Error code: <code>NoSuchTagSetError</code>
  # </p>
  # <ul>
  # <li>
  # <p>Description: There is no tag set associated with the bucket.</p>
  # </li>
  # </ul>
  # </li>
  # </ul>
  #
  # <p>The following operations are related to <code>GetBucketTagging</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketTagging.html">PutBucketTagging</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketTagging.html">DeleteBucketTagging</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_tagging(input : GetBucketTaggingRequest) : GetBucketTaggingOutput
    path = "/{Bucket}?tagging"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketTaggingOutput.from_request(request)
  end



      # <p>Returns the versioning state of a bucket.</p>
  # <p>To retrieve the versioning state of a bucket, you must be the bucket owner.</p>
  #
  # <p>This implementation also returns the MFA Delete status of the versioning state. If the
  # MFA Delete status is <code>enabled</code>, the bucket owner must use an authentication
  # device to change the versioning state of the bucket.</p>
  #
  # <p>The following operations are related to <code>GetBucketVersioning</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_versioning(input : GetBucketVersioningRequest) : GetBucketVersioningOutput
    path = "/{Bucket}?versioning"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketVersioningOutput.from_request(request)
  end



      # <p>Returns the website configuration for a bucket. To host website on Amazon S3, you can
  # configure a bucket as website by adding a website configuration. For more information about
  # hosting websites, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html">Hosting Websites on
  # Amazon S3</a>. </p>
  # <p>This GET operation requires the <code>S3:GetBucketWebsite</code> permission. By default,
  # only the bucket owner can read the bucket website configuration. However, bucket owners can
  # allow other users to read the website configuration by writing a bucket policy granting
  # them the <code>S3:GetBucketWebsite</code> permission.</p>
  # <p>The following operations are related to <code>DeleteBucketWebsite</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketWebsite.html">DeleteBucketWebsite</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketWebsite.html">PutBucketWebsite</a>
  # </p>
  # </li>
  # </ul>
  def get_bucket_website(input : GetBucketWebsiteRequest) : GetBucketWebsiteOutput
    path = "/{Bucket}?website"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetBucketWebsiteOutput.from_request(request)
  end



      # <p>Retrieves objects from Amazon S3. To use <code>GET</code>, you must have <code>READ</code>
  # access to the object. If you grant <code>READ</code> access to the anonymous user, you can
  # return the object without using an authorization header.</p>
  #
  # <p>An Amazon S3 bucket has no directory hierarchy such as you would find in a typical computer
  # file system. You can, however, create a logical hierarchy by using object key names that
  # imply a folder structure. For example, instead of naming an object <code>sample.jpg</code>,
  # you can name it <code>photos/2006/February/sample.jpg</code>.</p>
  #
  # <p>To get an object from such a logical hierarchy, specify the full key name for the object
  # in the <code>GET</code> operation. For a virtual hosted-style request example, if you have
  # the object <code>photos/2006/February/sample.jpg</code>, specify the resource as
  # <code>/photos/2006/February/sample.jpg</code>. For a path-style request example, if you
  # have the object <code>photos/2006/February/sample.jpg</code> in the bucket named
  # <code>examplebucket</code>, specify the resource as
  # <code>/examplebucket/photos/2006/February/sample.jpg</code>. For more information about
  # request types, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/VirtualHosting.html#VirtualHostingSpecifyBucket">HTTP Host Header Bucket Specification</a>.</p>
  #
  # <p>To distribute large files to many people, you can save bandwidth costs by using
  # BitTorrent. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3Torrent.html">Amazon S3
  # Torrent</a>. For more information about returning the ACL of an object, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAcl.html">GetObjectAcl</a>.</p>
  #
  # <p>If the object you are retrieving is stored in the S3 Glacier or
  # S3 Glacier Deep Archive storage class, or S3 Intelligent-Tiering Archive or
  # S3 Intelligent-Tiering Deep Archive tiers, before you can retrieve the object you must first restore a
  # copy using <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html">RestoreObject</a>. Otherwise, this operation returns an
  # <code>InvalidObjectStateError</code> error. For information about restoring archived
  # objects, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/restoring-objects.html">Restoring Archived
  # Objects</a>.</p>
  #
  # <p>Encryption request headers, like <code>x-amz-server-side-encryption</code>, should not
  # be sent for GET requests if your object uses server-side encryption with CMKs stored in AWS
  # KMS (SSE-KMS) or server-side encryption with Amazon S3–managed encryption keys (SSE-S3). If your
  # object does use these types of keys, you’ll get an HTTP 400 BadRequest error.</p>
  # <p>If you encrypt an object by using server-side encryption with customer-provided
  # encryption keys (SSE-C) when you store the object in Amazon S3, then when you GET the object,
  # you must use the following headers:</p>
  # <ul>
  # <li>
  # <p>x-amz-server-side-encryption-customer-algorithm</p>
  # </li>
  # <li>
  # <p>x-amz-server-side-encryption-customer-key</p>
  # </li>
  # <li>
  # <p>x-amz-server-side-encryption-customer-key-MD5</p>
  # </li>
  # </ul>
  # <p>For more information about SSE-C, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side Encryption (Using
  # Customer-Provided Encryption Keys)</a>.</p>
  #
  # <p>Assuming you have permission to read object tags (permission for the
  # <code>s3:GetObjectVersionTagging</code> action), the response also returns the
  # <code>x-amz-tagging-count</code> header that provides the count of number of tags
  # associated with the object. You can use <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html">GetObjectTagging</a> to retrieve
  # the tag set associated with an object.</p>
  #
  # <p>
  # <b>Permissions</b>
  # </p>
  # <p>You need the <code>s3:GetObject</code> permission for this operation. For more
  # information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying Permissions
  # in a Policy</a>. If the object you request does not exist, the error Amazon S3 returns
  # depends on whether you also have the <code>s3:ListBucket</code> permission.</p>
  # <ul>
  # <li>
  # <p>If you have the <code>s3:ListBucket</code> permission on the bucket, Amazon S3 will
  # return an HTTP status code 404 ("no such key") error.</p>
  # </li>
  # <li>
  # <p>If you don’t have the <code>s3:ListBucket</code> permission, Amazon S3 will return an
  # HTTP status code 403 ("access denied") error.</p>
  # </li>
  # </ul>
  #
  #
  # <p>
  # <b>Versioning</b>
  # </p>
  # <p>By default, the GET operation returns the current version of an object. To return a
  # different version, use the <code>versionId</code> subresource.</p>
  #
  # <note>
  # <p>If the current version of the object is a delete marker, Amazon S3 behaves as if the
  # object was deleted and includes <code>x-amz-delete-marker: true</code> in the
  # response.</p>
  # </note>
  #
  #
  # <p>For more information about versioning, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketVersioning.html">PutBucketVersioning</a>. </p>
  #
  # <p>
  # <b>Overriding Response Header Values</b>
  # </p>
  # <p>There are times when you want to override certain response header values in a GET
  # response. For example, you might override the Content-Disposition response header value in
  # your GET request.</p>
  #
  # <p>You can override values for a set of response headers using the following query
  # parameters. These response header values are sent only on a successful request, that is,
  # when status code 200 OK is returned. The set of headers you can override using these
  # parameters is a subset of the headers that Amazon S3 accepts when you create an object. The
  # response headers that you can override for the GET response are <code>Content-Type</code>,
  # <code>Content-Language</code>, <code>Expires</code>, <code>Cache-Control</code>,
  # <code>Content-Disposition</code>, and <code>Content-Encoding</code>. To override these
  # header values in the GET response, you use the following request parameters.</p>
  #
  # <note>
  # <p>You must sign the request, either using an Authorization header or a presigned URL,
  # when using these parameters. They cannot be used with an unsigned (anonymous)
  # request.</p>
  # </note>
  # <ul>
  # <li>
  # <p>
  # <code>response-content-type</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>response-content-language</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>response-expires</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>response-cache-control</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>response-content-disposition</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>response-content-encoding</code>
  # </p>
  # </li>
  # </ul>
  #
  # <p>
  # <b>Additional Considerations about Request Headers</b>
  # </p>
  #
  # <p>If both of the <code>If-Match</code> and <code>If-Unmodified-Since</code> headers are
  # present in the request as follows: <code>If-Match</code> condition evaluates to
  # <code>true</code>, and; <code>If-Unmodified-Since</code> condition evaluates to
  # <code>false</code>; then, S3 returns 200 OK and the data requested. </p>
  #
  # <p>If both of the <code>If-None-Match</code> and <code>If-Modified-Since</code> headers are
  # present in the request as follows:<code> If-None-Match</code> condition evaluates to
  # <code>false</code>, and; <code>If-Modified-Since</code> condition evaluates to
  # <code>true</code>; then, S3 returns 304 Not Modified response code.</p>
  #
  # <p>For more information about conditional requests, see <a href="https://tools.ietf.org/html/rfc7232">RFC 7232</a>.</p>
  #
  # <p>The following operations are related to <code>GetObject</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBuckets.html">ListBuckets</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAcl.html">GetObjectAcl</a>
  # </p>
  # </li>
  # </ul>
  def get_object(input : GetObjectRequest) : GetObjectOutput
    path = "/{Bucket}/{Key+}?x-id=GetObject"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetObjectOutput.from_request(request)
  end



      # <p>Returns the access control list (ACL) of an object. To use this operation, you must have
  # <code>READ_ACP</code> access to the object.</p>
  # <p>This action is not supported by Amazon S3 on Outposts.</p>
  # <p>
  # <b>Versioning</b>
  # </p>
  # <p>By default, GET returns ACL information about the current version of an object. To
  # return ACL information about a different version, use the versionId subresource.</p>
  #
  # <p>The following operations are related to <code>GetObjectAcl</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  # </p>
  # </li>
  # </ul>
  def get_object_acl(input : GetObjectAclRequest) : GetObjectAclOutput
    path = "/{Bucket}/{Key+}?acl"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetObjectAclOutput.from_request(request)
  end



      # <p>Gets an object's current Legal Hold status. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Locking Objects</a>.</p>
  # <p>This action is not supported by Amazon S3 on Outposts.</p>
  def get_object_legal_hold(input : GetObjectLegalHoldRequest) : GetObjectLegalHoldOutput
    path = "/{Bucket}/{Key+}?legal-hold"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetObjectLegalHoldOutput.from_request(request)
  end



      # <p>Gets the Object Lock configuration for a bucket. The rule specified in the Object Lock
  # configuration will be applied by default to every new object placed in the specified
  # bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Locking
  # Objects</a>.</p>
  def get_object_lock_configuration(input : GetObjectLockConfigurationRequest) : GetObjectLockConfigurationOutput
    path = "/{Bucket}?object-lock"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetObjectLockConfigurationOutput.from_request(request)
  end



      # <p>Retrieves an object's retention settings. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Locking Objects</a>.</p>
  # <p>This action is not supported by Amazon S3 on Outposts.</p>
  def get_object_retention(input : GetObjectRetentionRequest) : GetObjectRetentionOutput
    path = "/{Bucket}/{Key+}?retention"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetObjectRetentionOutput.from_request(request)
  end



      # <p>Returns the tag-set of an object. You send the GET request against the tagging
  # subresource associated with the object.</p>
  #
  # <p>To use this operation, you must have permission to perform the
  # <code>s3:GetObjectTagging</code> action. By default, the GET operation returns
  # information about current version of an object. For a versioned bucket, you can have
  # multiple versions of an object in your bucket. To retrieve tags of any other version, use
  # the versionId query parameter. You also need permission for the
  # <code>s3:GetObjectVersionTagging</code> action.</p>
  #
  # <p> By default, the bucket owner has this permission and can grant this permission to
  # others.</p>
  #
  # <p> For information about the Amazon S3 object tagging feature, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-tagging.html">Object Tagging</a>.</p>
  #
  # <p>The following operation is related to <code>GetObjectTagging</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectTagging.html">PutObjectTagging</a>
  # </p>
  # </li>
  # </ul>
  def get_object_tagging(input : GetObjectTaggingRequest) : GetObjectTaggingOutput
    path = "/{Bucket}/{Key+}?tagging"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetObjectTaggingOutput.from_request(request)
  end



      # <p>Returns torrent files from a bucket. BitTorrent can save you bandwidth when you're
  # distributing large files. For more information about BitTorrent, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3Torrent.html">Using BitTorrent with Amazon S3</a>.</p>
  # <note>
  # <p>You can get torrent only for objects that are less than 5 GB in size, and that are
  # not encrypted using server-side encryption with a customer-provided encryption
  # key.</p>
  # </note>
  # <p>To use GET, you must have READ access to the object.</p>
  # <p>This action is not supported by Amazon S3 on Outposts.</p>
  # <p>The following operation is related to <code>GetObjectTorrent</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  # </p>
  # </li>
  # </ul>
  def get_object_torrent(input : GetObjectTorrentRequest) : GetObjectTorrentOutput
    path = "/{Bucket}/{Key+}?torrent"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetObjectTorrentOutput.from_request(request)
  end



      # <p>Retrieves the <code>PublicAccessBlock</code> configuration for an Amazon S3 bucket. To use
  # this operation, you must have the <code>s3:GetBucketPublicAccessBlock</code> permission.
  # For more information about Amazon S3 permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying Permissions in a
  # Policy</a>.</p>
  #
  # <important>
  # <p>When Amazon S3 evaluates the <code>PublicAccessBlock</code> configuration for a bucket or
  # an object, it checks the <code>PublicAccessBlock</code> configuration for both the
  # bucket (or the bucket that contains the object) and the bucket owner's account. If the
  # <code>PublicAccessBlock</code> settings are different between the bucket and the
  # account, Amazon S3 uses the most restrictive combination of the bucket-level and
  # account-level settings.</p>
  # </important>
  #
  # <p>For more information about when Amazon S3 considers a bucket or an object public, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The Meaning of "Public"</a>.</p>
  #
  # <p>The following operations are related to <code>GetPublicAccessBlock</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">Using Amazon S3 Block
  # Public Access</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutPublicAccessBlock.html">PutPublicAccessBlock</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html">GetPublicAccessBlock</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeletePublicAccessBlock.html">DeletePublicAccessBlock</a>
  # </p>
  # </li>
  # </ul>
  def get_public_access_block(input : GetPublicAccessBlockRequest) : GetPublicAccessBlockOutput
    path = "/{Bucket}?publicAccessBlock"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    GetPublicAccessBlockOutput.from_request(request)
  end



      # <p>This operation is useful to determine if a bucket exists and you have permission to
  # access it. The operation returns a <code>200 OK</code> if the bucket exists and you have
  # permission to access it. Otherwise, the operation might return responses such as <code>404
  # Not Found</code> and <code>403 Forbidden</code>. </p>
  #
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:ListBucket</code> action. The bucket owner has this permission by default and
  # can grant this permission to others. For more information about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  def head_bucket(input : HeadBucketRequest) :   NoReturn
    path = "/{Bucket}"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("HEAD", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>The HEAD operation retrieves metadata from an object without returning the object
  # itself. This operation is useful if you're only interested in an object's metadata. To use
  # HEAD, you must have READ access to the object.</p>
  #
  # <p>A <code>HEAD</code> request has the same options as a <code>GET</code> operation on an
  # object. The response is identical to the <code>GET</code> response except that there is no
  # response body.</p>
  #
  # <p>If you encrypt an object by using server-side encryption with customer-provided
  # encryption keys (SSE-C) when you store the object in Amazon S3, then when you retrieve the
  # metadata from the object, you must use the following headers:</p>
  # <ul>
  # <li>
  # <p>x-amz-server-side-encryption-customer-algorithm</p>
  # </li>
  # <li>
  # <p>x-amz-server-side-encryption-customer-key</p>
  # </li>
  # <li>
  # <p>x-amz-server-side-encryption-customer-key-MD5</p>
  # </li>
  # </ul>
  # <p>For more information about SSE-C, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side Encryption (Using
  # Customer-Provided Encryption Keys)</a>.</p>
  # <note>
  # <p>Encryption request headers, like <code>x-amz-server-side-encryption</code>, should
  # not be sent for GET requests if your object uses server-side encryption with CMKs stored
  # in AWS KMS (SSE-KMS) or server-side encryption with Amazon S3–managed encryption keys
  # (SSE-S3). If your object does use these types of keys, you’ll get an HTTP 400 BadRequest
  # error.</p>
  # </note>
  #
  #
  #
  #
  #
  #
  #
  # <p>Request headers are limited to 8 KB in size. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTCommonRequestHeaders.html">Common Request
  # Headers</a>.</p>
  # <p>Consider the following when using request headers:</p>
  # <ul>
  # <li>
  # <p> Consideration 1 – If both of the <code>If-Match</code> and
  # <code>If-Unmodified-Since</code> headers are present in the request as
  # follows:</p>
  # <ul>
  # <li>
  # <p>
  # <code>If-Match</code> condition evaluates to <code>true</code>, and;</p>
  # </li>
  # <li>
  # <p>
  # <code>If-Unmodified-Since</code> condition evaluates to
  # <code>false</code>;</p>
  # </li>
  # </ul>
  # <p>Then Amazon S3 returns <code>200 OK</code> and the data requested.</p>
  # </li>
  # <li>
  # <p> Consideration 2 – If both of the <code>If-None-Match</code> and
  # <code>If-Modified-Since</code> headers are present in the request as
  # follows:</p>
  # <ul>
  # <li>
  # <p>
  # <code>If-None-Match</code> condition evaluates to <code>false</code>,
  # and;</p>
  # </li>
  # <li>
  # <p>
  # <code>If-Modified-Since</code> condition evaluates to
  # <code>true</code>;</p>
  # </li>
  # </ul>
  # <p>Then Amazon S3 returns the <code>304 Not Modified</code> response code.</p>
  # </li>
  # </ul>
  #
  # <p>For more information about conditional requests, see <a href="https://tools.ietf.org/html/rfc7232">RFC 7232</a>.</p>
  #
  # <p>
  # <b>Permissions</b>
  # </p>
  # <p>You need the <code>s3:GetObject</code> permission for this operation. For more
  # information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying Permissions
  # in a Policy</a>. If the object you request does not exist, the error Amazon S3 returns
  # depends on whether you also have the s3:ListBucket permission.</p>
  # <ul>
  # <li>
  # <p>If you have the <code>s3:ListBucket</code> permission on the bucket, Amazon S3 returns
  # an HTTP status code 404 ("no such key") error.</p>
  # </li>
  # <li>
  # <p>If you don’t have the <code>s3:ListBucket</code> permission, Amazon S3 returns an HTTP
  # status code 403 ("access denied") error.</p>
  # </li>
  # </ul>
  #
  # <p>The following operation is related to <code>HeadObject</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  # </p>
  # </li>
  # </ul>
  def head_object(input : HeadObjectRequest) : HeadObjectOutput
    path = "/{Bucket}/{Key+}"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("HEAD", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    HeadObjectOutput.from_request(request)
  end



      # <p>Lists the analytics configurations for the bucket. You can have up to 1,000 analytics
  # configurations per bucket.</p>
  #
  # <p>This operation supports list pagination and does not return more than 100 configurations
  # at a time. You should always check the <code>IsTruncated</code> element in the response. If
  # there are no more configurations to list, <code>IsTruncated</code> is set to false. If
  # there are more configurations to list, <code>IsTruncated</code> is set to true, and there
  # will be a value in <code>NextContinuationToken</code>. You use the
  # <code>NextContinuationToken</code> value to continue the pagination of the list by
  # passing the value in continuation-token in the request to <code>GET</code> the next
  # page.</p>
  #
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:GetAnalyticsConfiguration</code> action. The bucket owner has this permission
  # by default. The bucket owner can grant this permission to others. For more information
  # about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p>For information about Amazon S3 analytics feature, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/analytics-storage-class.html">Amazon S3 Analytics – Storage Class
  # Analysis</a>. </p>
  #
  # <p>The following operations are related to
  # <code>ListBucketAnalyticsConfigurations</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAnalyticsConfiguration.html">GetBucketAnalyticsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketAnalyticsConfiguration.html">DeleteBucketAnalyticsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAnalyticsConfiguration.html">PutBucketAnalyticsConfiguration</a>
  # </p>
  # </li>
  # </ul>
  def list_bucket_analytics_configurations(input : ListBucketAnalyticsConfigurationsRequest) : ListBucketAnalyticsConfigurationsOutput
    path = "/{Bucket}?analytics&x-id=ListBucketAnalyticsConfigurations"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    ListBucketAnalyticsConfigurationsOutput.from_request(request)
  end



      # <p>Lists the S3 Intelligent-Tiering configuration from the specified bucket.</p>
  # <p>The S3 Intelligent-Tiering storage class is designed to optimize storage costs by automatically moving data to the most cost-effective storage access tier, without additional operational overhead. S3 Intelligent-Tiering delivers automatic cost savings by moving data between access tiers, when access patterns change.</p>
  # <p>The S3 Intelligent-Tiering storage class is suitable for objects larger than 128 KB that you plan to store for at least 30 days. If the size of an object is less than 128 KB, it is not eligible for auto-tiering. Smaller objects can be stored, but they are always charged at the frequent access tier rates in the S3 Intelligent-Tiering storage class. </p>
  # <p>If you delete an object before the end of the 30-day minimum storage duration period, you are charged for 30 days. For more information, see  <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access">Storage class for automatically optimizing frequently and infrequently accessed objects</a>.</p>
  # <p>Operations related to
  # <code>ListBucketIntelligentTieringConfigurations</code> include: </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketIntelligentTieringConfiguration.html">DeleteBucketIntelligentTieringConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketIntelligentTieringConfiguration.html">PutBucketIntelligentTieringConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketIntelligentTieringConfiguration.html">GetBucketIntelligentTieringConfiguration</a>
  # </p>
  # </li>
  # </ul>
  def list_bucket_intelligent_tiering_configurations(input : ListBucketIntelligentTieringConfigurationsRequest) : ListBucketIntelligentTieringConfigurationsOutput
    path = "/{Bucket}?intelligent-tiering&x-id=ListBucketIntelligentTieringConfigurations"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    ListBucketIntelligentTieringConfigurationsOutput.from_request(request)
  end



      # <p>Returns a list of inventory configurations for the bucket. You can have up to 1,000
  # analytics configurations per bucket.</p>
  #
  # <p>This operation supports list pagination and does not return more than 100 configurations
  # at a time. Always check the <code>IsTruncated</code> element in the response. If there are
  # no more configurations to list, <code>IsTruncated</code> is set to false. If there are more
  # configurations to list, <code>IsTruncated</code> is set to true, and there is a value in
  # <code>NextContinuationToken</code>. You use the <code>NextContinuationToken</code> value
  # to continue the pagination of the list by passing the value in continuation-token in the
  # request to <code>GET</code> the next page.</p>
  #
  # <p> To use this operation, you must have permissions to perform the
  # <code>s3:GetInventoryConfiguration</code> action. The bucket owner has this permission
  # by default. The bucket owner can grant this permission to others. For more information
  # about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p>For information about the Amazon S3 inventory feature, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html">Amazon S3 Inventory</a>
  # </p>
  #
  # <p>The following operations are related to
  # <code>ListBucketInventoryConfigurations</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketInventoryConfiguration.html">GetBucketInventoryConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketInventoryConfiguration.html">DeleteBucketInventoryConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketInventoryConfiguration.html">PutBucketInventoryConfiguration</a>
  # </p>
  # </li>
  # </ul>
  def list_bucket_inventory_configurations(input : ListBucketInventoryConfigurationsRequest) : ListBucketInventoryConfigurationsOutput
    path = "/{Bucket}?inventory&x-id=ListBucketInventoryConfigurations"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    ListBucketInventoryConfigurationsOutput.from_request(request)
  end



      # <p>Lists the metrics configurations for the bucket. The metrics configurations are only for
  # the request metrics of the bucket and do not provide information on daily storage metrics.
  # You can have up to 1,000 configurations per bucket.</p>
  #
  # <p>This operation supports list pagination and does not return more than 100 configurations
  # at a time. Always check the <code>IsTruncated</code> element in the response. If there are
  # no more configurations to list, <code>IsTruncated</code> is set to false. If there are more
  # configurations to list, <code>IsTruncated</code> is set to true, and there is a value in
  # <code>NextContinuationToken</code>. You use the <code>NextContinuationToken</code> value
  # to continue the pagination of the list by passing the value in
  # <code>continuation-token</code> in the request to <code>GET</code> the next page.</p>
  #
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:GetMetricsConfiguration</code> action. The bucket owner has this permission by
  # default. The bucket owner can grant this permission to others. For more information about
  # permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p>For more information about metrics configurations and CloudWatch request metrics, see
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html">Monitoring Metrics with Amazon
  # CloudWatch</a>.</p>
  #
  # <p>The following operations are related to
  # <code>ListBucketMetricsConfigurations</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html">PutBucketMetricsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetricsConfiguration.html">GetBucketMetricsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetricsConfiguration.html">DeleteBucketMetricsConfiguration</a>
  # </p>
  # </li>
  # </ul>
  def list_bucket_metrics_configurations(input : ListBucketMetricsConfigurationsRequest) : ListBucketMetricsConfigurationsOutput
    path = "/{Bucket}?metrics&x-id=ListBucketMetricsConfigurations"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    ListBucketMetricsConfigurationsOutput.from_request(request)
  end



      # <p>Returns a list of all buckets owned by the authenticated sender of the request.</p>
  def list_buckets() : ListBucketsOutput
    path = "/"
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    ListBucketsOutput.from_request(request)
  end



      # <p>This operation lists in-progress multipart uploads. An in-progress multipart upload is a
  # multipart upload that has been initiated using the Initiate Multipart Upload request, but
  # has not yet been completed or aborted.</p>
  #
  # <p>This operation returns at most 1,000 multipart uploads in the response. 1,000 multipart
  # uploads is the maximum number of uploads a response can include, which is also the default
  # value. You can further limit the number of uploads in a response by specifying the
  # <code>max-uploads</code> parameter in the response. If additional multipart uploads
  # satisfy the list criteria, the response will contain an <code>IsTruncated</code> element
  # with the value true. To list the additional multipart uploads, use the
  # <code>key-marker</code> and <code>upload-id-marker</code> request parameters.</p>
  #
  # <p>In the response, the uploads are sorted by key. If your application has initiated more
  # than one multipart upload using the same object key, then uploads in the response are first
  # sorted by key. Additionally, uploads are sorted in ascending order within each key by the
  # upload initiation time.</p>
  #
  # <p>For more information on multipart uploads, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html">Uploading Objects Using Multipart
  # Upload</a>.</p>
  #
  # <p>For information on permissions required to use the multipart upload API, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart Upload API and
  # Permissions</a>.</p>
  #
  # <p>The following operations are related to <code>ListMultipartUploads</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  # </p>
  # </li>
  # </ul>
  def list_multipart_uploads(input : ListMultipartUploadsRequest) : ListMultipartUploadsOutput
    path = "/{Bucket}?uploads"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    ListMultipartUploadsOutput.from_request(request)
  end



      # <p>Returns some or all (up to 1,000) of the objects in a bucket. You can use the request
  # parameters as selection criteria to return a subset of the objects in a bucket. A 200 OK
  # response can contain valid or invalid XML. Be sure to design your application to parse the
  # contents of the response and handle it appropriately.</p>
  # <important>
  # <p>This API has been revised. We recommend that you use the newer version, <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html">ListObjectsV2</a>, when developing applications. For backward compatibility,
  # Amazon S3 continues to support <code>ListObjects</code>.</p>
  # </important>
  #
  #
  # <p>The following operations are related to <code>ListObjects</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html">ListObjectsV2</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBuckets.html">ListBuckets</a>
  # </p>
  # </li>
  # </ul>
  def list_objects(input : ListObjectsRequest) : ListObjectsOutput
    path = "/{Bucket}"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    ListObjectsOutput.from_request(request)
  end



      # <p>Returns some or all (up to 1,000) of the objects in a bucket. You can use the request
  # parameters as selection criteria to return a subset of the objects in a bucket. A <code>200
  # OK</code> response can contain valid or invalid XML. Make sure to design your
  # application to parse the contents of the response and handle it appropriately.</p>
  #
  # <p>To use this operation, you must have READ access to the bucket.</p>
  #
  # <p>To use this operation in an AWS Identity and Access Management (IAM) policy, you must
  # have permissions to perform the <code>s3:ListBucket</code> action. The bucket owner has
  # this permission by default and can grant this permission to others. For more information
  # about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  # <important>
  # <p>This section describes the latest revision of the API. We recommend that you use this
  # revised API for application development. For backward compatibility, Amazon S3 continues to
  # support the prior version of this API, <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjects.html">ListObjects</a>.</p>
  # </important>
  #
  # <p>To get a list of your buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBuckets.html">ListBuckets</a>.</p>
  #
  # <p>The following operations are related to <code>ListObjectsV2</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  # </p>
  # </li>
  # </ul>
  def list_objects_v2(input : ListObjectsV2Request) : ListObjectsV2Output
    path = "/{Bucket}?list-type=2"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    ListObjectsV2Output.from_request(request)
  end



      # <p>Returns metadata about all versions of the objects in a bucket. You can also use request
  # parameters as selection criteria to return metadata about a subset of all the object
  # versions. </p>
  # <note>
  # <p> A 200 OK response can contain valid or invalid XML. Make sure to design your
  # application to parse the contents of the response and handle it appropriately.</p>
  # </note>
  # <p>To use this operation, you must have READ access to the bucket.</p>
  # <p>This action is not supported by Amazon S3 on Outposts.</p>
  # <p>The following operations are related to
  # <code>ListObjectVersions</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html">ListObjectsV2</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  # </p>
  # </li>
  # </ul>
  def list_object_versions(input : ListObjectVersionsRequest) : ListObjectVersionsOutput
    path = "/{Bucket}?versions"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    ListObjectVersionsOutput.from_request(request)
  end



      # <p>Lists the parts that have been uploaded for a specific multipart upload. This operation
  # must include the upload ID, which you obtain by sending the initiate multipart upload
  # request (see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>).
  # This request returns a maximum of 1,000 uploaded parts. The default number of parts
  # returned is 1,000 parts. You can restrict the number of parts returned by specifying the
  # <code>max-parts</code> request parameter. If your multipart upload consists of more than
  # 1,000 parts, the response returns an <code>IsTruncated</code> field with the value of true,
  # and a <code>NextPartNumberMarker</code> element. In subsequent <code>ListParts</code>
  # requests you can include the part-number-marker query string parameter and set its value to
  # the <code>NextPartNumberMarker</code> field value from the previous response.</p>
  #
  # <p>For more information on multipart uploads, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html">Uploading Objects Using Multipart
  # Upload</a>.</p>
  #
  # <p>For information on permissions required to use the multipart upload API, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart Upload API and
  # Permissions</a>.</p>
  #
  # <p>The following operations are related to <code>ListParts</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html">ListMultipartUploads</a>
  # </p>
  # </li>
  # </ul>
  def list_parts(input : ListPartsRequest) : ListPartsOutput
    path = "/{Bucket}/{Key+}?x-id=ListParts"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("GET", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    ListPartsOutput.from_request(request)
  end



      # <p>Sets the accelerate configuration of an existing bucket. Amazon S3 Transfer Acceleration is a
  # bucket-level feature that enables you to perform faster data transfers to Amazon S3.</p>
  #
  # <p> To use this operation, you must have permission to perform the
  # s3:PutAccelerateConfiguration action. The bucket owner has this permission by default. The
  # bucket owner can grant this permission to others. For more information about permissions,
  # see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p> The Transfer Acceleration state of a bucket can be set to one of the following two
  # values:</p>
  # <ul>
  # <li>
  # <p> Enabled – Enables accelerated data transfers to the bucket.</p>
  # </li>
  # <li>
  # <p> Suspended – Disables accelerated data transfers to the bucket.</p>
  # </li>
  # </ul>
  #
  #
  # <p>The <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAccelerateConfiguration.html">GetBucketAccelerateConfiguration</a> operation returns the transfer acceleration
  # state of a bucket.</p>
  #
  # <p>After setting the Transfer Acceleration state of a bucket to Enabled, it might take up
  # to thirty minutes before the data transfer rates to the bucket increase.</p>
  #
  # <p> The name of the bucket used for Transfer Acceleration must be DNS-compliant and must
  # not contain periods (".").</p>
  #
  # <p> For more information about transfer acceleration, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html">Transfer Acceleration</a>.</p>
  #
  # <p>The following operations are related to
  # <code>PutBucketAccelerateConfiguration</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAccelerateConfiguration.html">GetBucketAccelerateConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_accelerate_configuration(input : PutBucketAccelerateConfigurationRequest) :   NoReturn
    path = "/{Bucket}?accelerate"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Sets the permissions on an existing bucket using access control lists (ACL). For more
  # information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html">Using ACLs</a>. To set
  # the ACL of a bucket, you must have <code>WRITE_ACP</code> permission.</p>
  #
  # <p>You can use one of the following two ways to set a bucket's permissions:</p>
  # <ul>
  # <li>
  # <p>Specify the ACL in the request body</p>
  # </li>
  # <li>
  # <p>Specify permissions using request headers</p>
  # </li>
  # </ul>
  #
  # <note>
  # <p>You cannot specify access permission using both the body and the request
  # headers.</p>
  # </note>
  #
  # <p>Depending on your application needs, you may choose to set the ACL on a bucket using
  # either the request body or the headers. For example, if you have an existing application
  # that updates a bucket ACL using the request body, then you can continue to use that
  # approach.</p>
  #
  #
  # <p>
  # <b>Access Permissions</b>
  # </p>
  # <p>You can set access permissions using one of the following methods:</p>
  # <ul>
  # <li>
  # <p>Specify a canned ACL with the <code>x-amz-acl</code> request header. Amazon S3 supports
  # a set of predefined ACLs, known as <i>canned ACLs</i>. Each canned ACL
  # has a predefined set of grantees and permissions. Specify the canned ACL name as the
  # value of <code>x-amz-acl</code>. If you use this header, you cannot use other access
  # control-specific headers in your request. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned ACL</a>.</p>
  # </li>
  # <li>
  # <p>Specify access permissions explicitly with the <code>x-amz-grant-read</code>,
  # <code>x-amz-grant-read-acp</code>, <code>x-amz-grant-write-acp</code>, and
  # <code>x-amz-grant-full-control</code> headers. When using these headers, you
  # specify explicit access permissions and grantees (AWS accounts or Amazon S3 groups) who
  # will receive the permission. If you use these ACL-specific headers, you cannot use
  # the <code>x-amz-acl</code> header to set a canned ACL. These parameters map to the
  # set of permissions that Amazon S3 supports in an ACL. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access Control List (ACL)
  # Overview</a>.</p>
  # <p>You specify each grantee as a type=value pair, where the type is one of the
  # following:</p>
  # <ul>
  # <li>
  # <p>
  # <code>id</code> – if the value specified is the canonical user ID of an AWS
  # account</p>
  # </li>
  # <li>
  # <p>
  # <code>uri</code> – if you are granting permissions to a predefined
  # group</p>
  # </li>
  # <li>
  # <p>
  # <code>emailAddress</code> – if the value specified is the email address of
  # an AWS account</p>
  # <note>
  # <p>Using email addresses to specify a grantee is only supported in the following AWS Regions: </p>
  # <ul>
  # <li>
  # <p>US East (N. Virginia)</p>
  # </li>
  # <li>
  # <p>US West (N. California)</p>
  # </li>
  # <li>
  # <p> US West (Oregon)</p>
  # </li>
  # <li>
  # <p> Asia Pacific (Singapore)</p>
  # </li>
  # <li>
  # <p>Asia Pacific (Sydney)</p>
  # </li>
  # <li>
  # <p>Asia Pacific (Tokyo)</p>
  # </li>
  # <li>
  # <p>Europe (Ireland)</p>
  # </li>
  # <li>
  # <p>South America (São Paulo)</p>
  # </li>
  # </ul>
  # <p>For a list of all the Amazon S3 supported Regions and endpoints, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions and Endpoints</a> in the AWS General Reference.</p>
  # </note>
  # </li>
  # </ul>
  # <p>For example, the following <code>x-amz-grant-write</code> header grants create,
  # overwrite, and delete objects permission to LogDelivery group predefined by Amazon S3 and
  # two AWS accounts identified by their email addresses.</p>
  # <p>
  # <code>x-amz-grant-write: uri="http://acs.amazonaws.com/groups/s3/LogDelivery",
  # id="111122223333", id="555566667777" </code>
  # </p>
  #
  # </li>
  # </ul>
  # <p>You can use either a canned ACL or specify access permissions explicitly. You cannot do
  # both.</p>
  # <p>
  # <b>Grantee Values</b>
  # </p>
  # <p>You can specify the person (grantee) to whom you're assigning access rights (using
  # request elements) in the following ways:</p>
  # <ul>
  # <li>
  # <p>By the person's ID:</p>
  # <p>
  # <code><Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  # xsi:type="CanonicalUser"><ID><>ID<></ID><DisplayName><>GranteesEmail<></DisplayName>
  # </Grantee></code>
  # </p>
  # <p>DisplayName is optional and ignored in the request</p>
  # </li>
  # <li>
  # <p>By URI:</p>
  # <p>
  # <code><Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  # xsi:type="Group"><URI><>http://acs.amazonaws.com/groups/global/AuthenticatedUsers<></URI></Grantee></code>
  # </p>
  # </li>
  # <li>
  # <p>By Email address:</p>
  # <p>
  # <code><Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  # xsi:type="AmazonCustomerByEmail"><EmailAddress><>Grantees@email.com<></EmailAddress>lt;/Grantee></code>
  # </p>
  # <p>The grantee is resolved to the CanonicalUser and, in a response to a GET Object
  # acl request, appears as the CanonicalUser. </p>
  # <note>
  # <p>Using email addresses to specify a grantee is only supported in the following AWS Regions: </p>
  # <ul>
  # <li>
  # <p>US East (N. Virginia)</p>
  # </li>
  # <li>
  # <p>US West (N. California)</p>
  # </li>
  # <li>
  # <p> US West (Oregon)</p>
  # </li>
  # <li>
  # <p> Asia Pacific (Singapore)</p>
  # </li>
  # <li>
  # <p>Asia Pacific (Sydney)</p>
  # </li>
  # <li>
  # <p>Asia Pacific (Tokyo)</p>
  # </li>
  # <li>
  # <p>Europe (Ireland)</p>
  # </li>
  # <li>
  # <p>South America (São Paulo)</p>
  # </li>
  # </ul>
  # <p>For a list of all the Amazon S3 supported Regions and endpoints, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions and Endpoints</a> in the AWS General Reference.</p>
  # </note>
  # </li>
  # </ul>
  #
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html">DeleteBucket</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAcl.html">GetObjectAcl</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_acl(input : PutBucketAclRequest) :   NoReturn
    path = "/{Bucket}?acl"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Sets an analytics configuration for the bucket (specified by the analytics configuration
  # ID). You can have up to 1,000 analytics configurations per bucket.</p>
  #
  # <p>You can choose to have storage class analysis export analysis reports sent to a
  # comma-separated values (CSV) flat file. See the <code>DataExport</code> request element.
  # Reports are updated daily and are based on the object filters that you configure. When
  # selecting data export, you specify a destination bucket and an optional destination prefix
  # where the file is written. You can export the data to a destination bucket in a different
  # account. However, the destination bucket must be in the same Region as the bucket that you
  # are making the PUT analytics configuration to. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/analytics-storage-class.html">Amazon S3 Analytics – Storage Class
  # Analysis</a>. </p>
  #
  # <important>
  # <p>You must create a bucket policy on the destination bucket where the exported file is
  # written to grant permissions to Amazon S3 to write objects to the bucket. For an example
  # policy, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html#example-bucket-policies-use-case-9">Granting Permissions for Amazon S3 Inventory and Storage Class Analysis</a>.</p>
  # </important>
  #
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:PutAnalyticsConfiguration</code> action. The bucket owner has this permission
  # by default. The bucket owner can grant this permission to others. For more information
  # about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  #
  # <p class="title">
  # <b>Special Errors</b>
  # </p>
  # <ul>
  # <li>
  # <ul>
  # <li>
  # <p>
  # <i>HTTP Error: HTTP 400 Bad Request</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Code: InvalidArgument</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Cause: Invalid argument.</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <ul>
  # <li>
  # <p>
  # <i>HTTP Error: HTTP 400 Bad Request</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Code: TooManyConfigurations</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Cause: You are attempting to create a new configuration but have
  # already reached the 1,000-configuration limit.</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <ul>
  # <li>
  # <p>
  # <i>HTTP Error: HTTP 403 Forbidden</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Code: AccessDenied</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Cause: You are not the owner of the specified bucket, or you do
  # not have the s3:PutAnalyticsConfiguration bucket permission to set the
  # configuration on the bucket.</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # </ul>
  #
  #
  #
  #
  #
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAnalyticsConfiguration.html">GetBucketAnalyticsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketAnalyticsConfiguration.html">DeleteBucketAnalyticsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketAnalyticsConfigurations.html">ListBucketAnalyticsConfigurations</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_analytics_configuration(input : PutBucketAnalyticsConfigurationRequest) :   NoReturn
    path = "/{Bucket}?analytics"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Sets the <code>cors</code> configuration for your bucket. If the configuration exists,
  # Amazon S3 replaces it.</p>
  # <p>To use this operation, you must be allowed to perform the <code>s3:PutBucketCORS</code>
  # action. By default, the bucket owner has this permission and can grant it to others.</p>
  # <p>You set this configuration on a bucket so that the bucket can service cross-origin
  # requests. For example, you might want to enable a request whose origin is
  # <code>http://www.example.com</code> to access your Amazon S3 bucket at
  # <code>my.example.bucket.com</code> by using the browser's <code>XMLHttpRequest</code>
  # capability.</p>
  # <p>To enable cross-origin resource sharing (CORS) on a bucket, you add the
  # <code>cors</code> subresource to the bucket. The <code>cors</code> subresource is an XML
  # document in which you configure rules that identify origins and the HTTP methods that can
  # be executed on your bucket. The document is limited to 64 KB in size. </p>
  # <p>When Amazon S3 receives a cross-origin request (or a pre-flight OPTIONS request) against a
  # bucket, it evaluates the <code>cors</code> configuration on the bucket and uses the first
  # <code>CORSRule</code> rule that matches the incoming browser request to enable a
  # cross-origin request. For a rule to match, the following conditions must be met:</p>
  # <ul>
  # <li>
  # <p>The request's <code>Origin</code> header must match <code>AllowedOrigin</code>
  # elements.</p>
  # </li>
  # <li>
  # <p>The request method (for example, GET, PUT, HEAD, and so on) or the
  # <code>Access-Control-Request-Method</code> header in case of a pre-flight
  # <code>OPTIONS</code> request must be one of the <code>AllowedMethod</code>
  # elements. </p>
  # </li>
  # <li>
  # <p>Every header specified in the <code>Access-Control-Request-Headers</code> request
  # header of a pre-flight request must match an <code>AllowedHeader</code> element.
  # </p>
  # </li>
  # </ul>
  # <p> For more information about CORS, go to <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html">Enabling
  # Cross-Origin Resource Sharing</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketCors.html">GetBucketCors</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketCors.html">DeleteBucketCors</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTOPTIONSobject.html">RESTOPTIONSobject</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_cors(input : PutBucketCorsRequest) :   NoReturn
    path = "/{Bucket}?cors"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>This operation uses the <code>encryption</code> subresource to configure default
  # encryption and Amazon S3 Bucket Key for an existing bucket.</p>
  # <p>Default encryption for a bucket can use server-side encryption with Amazon S3-managed keys
  # (SSE-S3) or AWS KMS customer master keys (SSE-KMS). If you specify default encryption
  # using SSE-KMS, you can also configure Amazon S3 Bucket Key. For information about default
  # encryption, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html">Amazon S3 default bucket encryption</a>
  # in the <i>Amazon Simple Storage Service Developer Guide</i>. For more information about S3 Bucket Keys,
  # see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html">Amazon S3 Bucket Keys</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <important>
  # <p>This operation requires AWS Signature Version 4. For more information, see <a href="sig-v4-authenticating-requests.html"> Authenticating Requests (AWS Signature
  # Version 4)</a>. </p>
  # </important>
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:PutEncryptionConfiguration</code> action. The bucket owner has this permission
  # by default. The bucket owner can grant this permission to others. For more information
  # about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a> in the Amazon Simple Storage Service Developer Guide. </p>
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketEncryption.html">GetBucketEncryption</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketEncryption.html">DeleteBucketEncryption</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_encryption(input : PutBucketEncryptionRequest) :   NoReturn
    path = "/{Bucket}?encryption"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Puts a S3 Intelligent-Tiering configuration to the specified bucket.</p>
  # <p>The S3 Intelligent-Tiering storage class is designed to optimize storage costs by automatically moving data to the most cost-effective storage access tier, without additional operational overhead. S3 Intelligent-Tiering delivers automatic cost savings by moving data between access tiers, when access patterns change.</p>
  # <p>The S3 Intelligent-Tiering storage class is suitable for objects larger than 128 KB that you plan to store for at least 30 days. If the size of an object is less than 128 KB, it is not eligible for auto-tiering. Smaller objects can be stored, but they are always charged at the frequent access tier rates in the S3 Intelligent-Tiering storage class. </p>
  # <p>If you delete an object before the end of the 30-day minimum storage duration period, you are charged for 30 days. For more information, see  <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access">Storage class for automatically optimizing frequently and infrequently accessed objects</a>.</p>
  # <p>Operations related to
  # <code>PutBucketIntelligentTieringConfiguration</code> include: </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketIntelligentTieringConfiguration.html">DeleteBucketIntelligentTieringConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketIntelligentTieringConfiguration.html">GetBucketIntelligentTieringConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketIntelligentTieringConfigurations.html">ListBucketIntelligentTieringConfigurations</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_intelligent_tiering_configuration(input : PutBucketIntelligentTieringConfigurationRequest) :   NoReturn
    path = "/{Bucket}?intelligent-tiering"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>This implementation of the <code>PUT</code> operation adds an inventory configuration
  # (identified by the inventory ID) to the bucket. You can have up to 1,000 inventory
  # configurations per bucket. </p>
  # <p>Amazon S3 inventory generates inventories of the objects in the bucket on a daily or weekly
  # basis, and the results are published to a flat file. The bucket that is inventoried is
  # called the <i>source</i> bucket, and the bucket where the inventory flat file
  # is stored is called the <i>destination</i> bucket. The
  # <i>destination</i> bucket must be in the same AWS Region as the
  # <i>source</i> bucket. </p>
  # <p>When you configure an inventory for a <i>source</i> bucket, you specify
  # the <i>destination</i> bucket where you want the inventory to be stored, and
  # whether to generate the inventory daily or weekly. You can also configure what object
  # metadata to include and whether to inventory all object versions or only current versions.
  # For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html">Amazon S3
  # Inventory</a> in the Amazon Simple Storage Service Developer Guide.</p>
  # <important>
  # <p>You must create a bucket policy on the <i>destination</i> bucket to
  # grant permissions to Amazon S3 to write objects to the bucket in the defined location. For an
  # example policy, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html#example-bucket-policies-use-case-9">
  # Granting Permissions for Amazon S3 Inventory and Storage Class Analysis</a>.</p>
  # </important>
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:PutInventoryConfiguration</code> action. The bucket owner has this permission
  # by default and can grant this permission to others. For more information about permissions,
  # see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a> in the Amazon Simple Storage Service Developer Guide.</p>
  #
  # <p class="title">
  # <b>Special Errors</b>
  # </p>
  # <ul>
  # <li>
  # <p class="title">
  # <b>HTTP 400 Bad Request Error</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <i>Code:</i> InvalidArgument</p>
  # </li>
  # <li>
  # <p>
  # <i>Cause:</i> Invalid Argument</p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <p class="title">
  # <b>HTTP 400 Bad Request Error</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <i>Code:</i> TooManyConfigurations</p>
  # </li>
  # <li>
  # <p>
  # <i>Cause:</i> You are attempting to create a new configuration
  # but have already reached the 1,000-configuration limit. </p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <p class="title">
  # <b>HTTP 403 Forbidden Error</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <i>Code:</i> AccessDenied</p>
  # </li>
  # <li>
  # <p>
  # <i>Cause:</i> You are not the owner of the specified bucket,
  # or you do not have the <code>s3:PutInventoryConfiguration</code> bucket
  # permission to set the configuration on the bucket. </p>
  # </li>
  # </ul>
  # </li>
  # </ul>
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketInventoryConfiguration.html">GetBucketInventoryConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketInventoryConfiguration.html">DeleteBucketInventoryConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketInventoryConfigurations.html">ListBucketInventoryConfigurations</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_inventory_configuration(input : PutBucketInventoryConfigurationRequest) :   NoReturn
    path = "/{Bucket}?inventory"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Creates a new lifecycle configuration for the bucket or replaces an existing lifecycle
  # configuration. For information about lifecycle configuration, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <note>
  # <p>Bucket lifecycle configuration now supports specifying a lifecycle rule using an
  # object key name prefix, one or more object tags, or a combination of both. Accordingly,
  # this section describes the latest API. The previous version of the API supported
  # filtering based only on an object key name prefix, which is supported for backward
  # compatibility. For the related API description, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycle.html">PutBucketLifecycle</a>.</p>
  # </note>
  #
  #
  #
  # <p>
  # <b>Rules</b>
  # </p>
  # <p>You specify the lifecycle configuration in your request body. The lifecycle
  # configuration is specified as XML consisting of one or more rules. Each rule consists of
  # the following:</p>
  #
  # <ul>
  # <li>
  # <p>Filter identifying a subset of objects to which the rule applies. The filter can
  # be based on a key name prefix, object tags, or a combination of both.</p>
  # </li>
  # <li>
  # <p>Status whether the rule is in effect.</p>
  # </li>
  # <li>
  # <p>One or more lifecycle transition and expiration actions that you want Amazon S3 to
  # perform on the objects identified by the filter. If the state of your bucket is
  # versioning-enabled or versioning-suspended, you can have many versions of the same
  # object (one current version and zero or more noncurrent versions). Amazon S3 provides
  # predefined actions that you can specify for current and noncurrent object
  # versions.</p>
  # </li>
  # </ul>
  #
  # <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html">Object
  # Lifecycle Management</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html">Lifecycle Configuration Elements</a>.</p>
  #
  #
  # <p>
  # <b>Permissions</b>
  # </p>
  #
  #
  # <p>By default, all Amazon S3 resources are private, including buckets, objects, and related
  # subresources (for example, lifecycle configuration and website configuration). Only the
  # resource owner (that is, the AWS account that created it) can access the resource. The
  # resource owner can optionally grant access permissions to others by writing an access
  # policy. For this operation, a user must get the s3:PutLifecycleConfiguration
  # permission.</p>
  #
  # <p>You can also explicitly deny permissions. Explicit deny also supersedes any other
  # permissions. If you want to block users or accounts from removing or deleting objects from
  # your bucket, you must deny them permissions for the following actions:</p>
  #
  # <ul>
  # <li>
  # <p>s3:DeleteObject</p>
  # </li>
  # <li>
  # <p>s3:DeleteObjectVersion</p>
  # </li>
  # <li>
  # <p>s3:PutLifecycleConfiguration</p>
  # </li>
  # </ul>
  #
  #
  # <p>For more information about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p>The following are related to <code>PutBucketLifecycleConfiguration</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/lifecycle-configuration-examples.html">Examples of
  # Lifecycle Configuration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketLifecycle.html">DeleteBucketLifecycle</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_lifecycle_configuration(input : PutBucketLifecycleConfigurationRequest) :   NoReturn
    path = "/{Bucket}?lifecycle"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Set the logging parameters for a bucket and to specify permissions for who can view and
  # modify the logging parameters. All logs are saved to buckets in the same AWS Region as the
  # source bucket. To set the logging status of a bucket, you must be the bucket owner.</p>
  #
  # <p>The bucket owner is automatically granted FULL_CONTROL to all logs. You use the
  # <code>Grantee</code> request element to grant access to other people. The
  # <code>Permissions</code> request element specifies the kind of access the grantee has to
  # the logs.</p>
  #
  # <p>
  # <b>Grantee Values</b>
  # </p>
  # <p>You can specify the person (grantee) to whom you're assigning access rights (using
  # request elements) in the following ways:</p>
  #
  # <ul>
  # <li>
  # <p>By the person's ID:</p>
  # <p>
  # <code><Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  # xsi:type="CanonicalUser"><ID><>ID<></ID><DisplayName><>GranteesEmail<></DisplayName>
  # </Grantee></code>
  # </p>
  # <p>DisplayName is optional and ignored in the request.</p>
  # </li>
  # <li>
  # <p>By Email address:</p>
  # <p>
  # <code> <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  # xsi:type="AmazonCustomerByEmail"><EmailAddress><>Grantees@email.com<></EmailAddress></Grantee></code>
  # </p>
  # <p>The grantee is resolved to the CanonicalUser and, in a response to a GET Object
  # acl request, appears as the CanonicalUser.</p>
  # </li>
  # <li>
  # <p>By URI:</p>
  # <p>
  # <code><Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  # xsi:type="Group"><URI><>http://acs.amazonaws.com/groups/global/AuthenticatedUsers<></URI></Grantee></code>
  # </p>
  # </li>
  # </ul>
  #
  #
  # <p>To enable logging, you use LoggingEnabled and its children request elements. To disable
  # logging, you use an empty BucketLoggingStatus request element:</p>
  #
  # <p>
  # <code><BucketLoggingStatus xmlns="http://doc.s3.amazonaws.com/2006-03-01"
  # /></code>
  # </p>
  #
  # <p>For more information about server access logging, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerLogs.html">Server Access Logging</a>. </p>
  #
  # <p>For more information about creating a bucket, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>. For more
  # information about returning the logging status of a bucket, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLogging.html">GetBucketLogging</a>.</p>
  #
  # <p>The following operations are related to <code>PutBucketLogging</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html">DeleteBucket</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLogging.html">GetBucketLogging</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_logging(input : PutBucketLoggingRequest) :   NoReturn
    path = "/{Bucket}?logging"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Sets a metrics configuration (specified by the metrics configuration ID) for the bucket.
  # You can have up to 1,000 metrics configurations per bucket. If you're updating an existing
  # metrics configuration, note that this is a full replacement of the existing metrics
  # configuration. If you don't include the elements you want to keep, they are erased.</p>
  #
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:PutMetricsConfiguration</code> action. The bucket owner has this permission by
  # default. The bucket owner can grant this permission to others. For more information about
  # permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p>For information about CloudWatch request metrics for Amazon S3, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html">Monitoring Metrics with Amazon
  # CloudWatch</a>.</p>
  #
  # <p>The following operations are related to
  # <code>PutBucketMetricsConfiguration</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetricsConfiguration.html">DeleteBucketMetricsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html">PutBucketMetricsConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketMetricsConfigurations.html">ListBucketMetricsConfigurations</a>
  # </p>
  # </li>
  # </ul>
  #
  #
  #
  #
  #
  #
  # <p>
  # <code>GetBucketLifecycle</code> has the following special error:</p>
  # <ul>
  # <li>
  # <p>Error code: <code>TooManyConfigurations</code>
  # </p>
  # <ul>
  # <li>
  # <p>Description: You are attempting to create a new configuration but have
  # already reached the 1,000-configuration limit.</p>
  # </li>
  # <li>
  # <p>HTTP Status Code: HTTP 400 Bad Request</p>
  # </li>
  # </ul>
  # </li>
  # </ul>
  def put_bucket_metrics_configuration(input : PutBucketMetricsConfigurationRequest) :   NoReturn
    path = "/{Bucket}?metrics"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Enables notifications of specified events for a bucket. For more information about event
  # notifications, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event
  # Notifications</a>.</p>
  #
  # <p>Using this API, you can replace an existing notification configuration. The
  # configuration is an XML file that defines the event types that you want Amazon S3 to publish and
  # the destination where you want Amazon S3 to publish an event notification when it detects an
  # event of the specified type.</p>
  #
  # <p>By default, your bucket has no event notifications configured. That is, the notification
  # configuration will be an empty <code>NotificationConfiguration</code>.</p>
  #
  # <p>
  # <code><NotificationConfiguration></code>
  # </p>
  # <p>
  # <code></NotificationConfiguration></code>
  # </p>
  # <p>This operation replaces the existing notification configuration with the configuration
  # you include in the request body.</p>
  #
  # <p>After Amazon S3 receives this request, it first verifies that any Amazon Simple Notification
  # Service (Amazon SNS) or Amazon Simple Queue Service (Amazon SQS) destination exists, and
  # that the bucket owner has permission to publish to it by sending a test notification. In
  # the case of AWS Lambda destinations, Amazon S3 verifies that the Lambda function permissions
  # grant Amazon S3 permission to invoke the function from the Amazon S3 bucket. For more information,
  # see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Notifications for Amazon S3
  # Events</a>.</p>
  #
  # <p>You can disable notifications by adding the empty NotificationConfiguration
  # element.</p>
  #
  # <p>By default, only the bucket owner can configure notifications on a bucket. However,
  # bucket owners can use a bucket policy to grant permission to other users to set this
  # configuration with <code>s3:PutBucketNotification</code> permission.</p>
  #
  # <note>
  # <p>The PUT notification is an atomic operation. For example, suppose your notification
  # configuration includes SNS topic, SQS queue, and Lambda function configurations. When
  # you send a PUT request with this configuration, Amazon S3 sends test messages to your SNS
  # topic. If the message fails, the entire PUT operation will fail, and Amazon S3 will not add
  # the configuration to your bucket.</p>
  # </note>
  #
  # <p>
  # <b>Responses</b>
  # </p>
  # <p>If the configuration in the request body includes only one
  # <code>TopicConfiguration</code> specifying only the
  # <code>s3:ReducedRedundancyLostObject</code> event type, the response will also include
  # the <code>x-amz-sns-test-message-id</code> header containing the message ID of the test
  # notification sent to the topic.</p>
  #
  # <p>The following operation is related to
  # <code>PutBucketNotificationConfiguration</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketNotificationConfiguration.html">GetBucketNotificationConfiguration</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_notification_configuration(input : PutBucketNotificationConfigurationRequest) :   NoReturn
    path = "/{Bucket}?notification"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Creates or modifies <code>OwnershipControls</code> for an Amazon S3 bucket. To use this
  # operation, you must have the <code>s3:PutBucketOwnershipControls</code> permission. For
  # more information about Amazon S3 permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying Permissions in a Policy</a>. </p>
  # <p>For information about Amazon S3 Object Ownership, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/about-object-ownership.html">Using Object Ownership</a>. </p>
  # <p>The following operations are related to <code>PutBucketOwnershipControls</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a>GetBucketOwnershipControls</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a>DeleteBucketOwnershipControls</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_ownership_controls(input : PutBucketOwnershipControlsRequest) :   NoReturn
    path = "/{Bucket}?ownershipControls"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Applies an Amazon S3 bucket policy to an Amazon S3 bucket. If you are using an identity other than
  # the root user of the AWS account that owns the bucket, the calling identity must have the
  # <code>PutBucketPolicy</code> permissions on the specified bucket and belong to the
  # bucket owner's account in order to use this operation.</p>
  #
  # <p>If you don't have <code>PutBucketPolicy</code> permissions, Amazon S3 returns a <code>403
  # Access Denied</code> error. If you have the correct permissions, but you're not using an
  # identity that belongs to the bucket owner's account, Amazon S3 returns a <code>405 Method Not
  # Allowed</code> error.</p>
  #
  # <important>
  # <p> As a security precaution, the root user of the AWS account that owns a bucket can
  # always use this operation, even if the policy explicitly denies the root user the
  # ability to perform this action. </p>
  # </important>
  #
  #
  # <p>For more information about bucket policies, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using Bucket Policies and User
  # Policies</a>.</p>
  #
  # <p>The following operations are related to <code>PutBucketPolicy</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html">DeleteBucket</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_policy(input : PutBucketPolicyRequest) :   NoReturn
    path = "/{Bucket}?policy"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p> Creates a replication configuration or replaces an existing one. For more information,
  # see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html">Replication</a> in the <i>Amazon S3 Developer Guide</i>. </p>
  # <note>
  # <p>To perform this operation, the user or role performing the operation must have the
  # <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html">iam:PassRole</a> permission.</p>
  # </note>
  # <p>Specify the replication configuration in the request body. In the replication
  # configuration, you provide the name of the destination bucket or buckets where you want
  # Amazon S3 to replicate objects, the IAM role that Amazon S3 can assume to replicate objects on your
  # behalf, and other relevant information.</p>
  #
  #
  # <p>A replication configuration must include at least one rule, and can contain a maximum of
  # 1,000. Each rule identifies a subset of objects to replicate by filtering the objects in
  # the source bucket. To choose additional subsets of objects to replicate, add a rule for
  # each subset.</p>
  #
  # <p>To specify a subset of the objects in the source bucket to apply a replication rule to,
  # add the Filter element as a child of the Rule element. You can filter objects based on an
  # object key prefix, one or more object tags, or both. When you add the Filter element in the
  # configuration, you must also add the following elements:
  # <code>DeleteMarkerReplication</code>, <code>Status</code>, and
  # <code>Priority</code>.</p>
  # <note>
  # <p>If you are using an earlier version of the replication configuration, Amazon S3 handles
  # replication of delete markers differently. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-backward-compat-considerations">Backward Compatibility</a>.</p>
  # </note>
  # <p>For information about enabling versioning on a bucket, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html">Using Versioning</a>.</p>
  #
  # <p>By default, a resource owner, in this case the AWS account that created the bucket, can
  # perform this operation. The resource owner can also grant others permissions to perform the
  # operation. For more information about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying Permissions in a Policy</a>
  # and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your
  # Amazon S3 Resources</a>.</p>
  #
  # <p>
  # <b>Handling Replication of Encrypted Objects</b>
  # </p>
  # <p>By default, Amazon S3 doesn't replicate objects that are stored at rest using server-side
  # encryption with CMKs stored in AWS KMS. To replicate AWS KMS-encrypted objects, add the
  # following: <code>SourceSelectionCriteria</code>, <code>SseKmsEncryptedObjects</code>,
  # <code>Status</code>, <code>EncryptionConfiguration</code>, and
  # <code>ReplicaKmsKeyID</code>. For information about replication configuration, see
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-config-for-kms-objects.html">Replicating Objects
  # Created with SSE Using CMKs stored in AWS KMS</a>.</p>
  #
  # <p>For information on <code>PutBucketReplication</code> errors, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ReplicationErrorCodeList">List of
  # replication-related error codes</a>
  # </p>
  #
  #
  # <p>The following operations are related to <code>PutBucketReplication</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketReplication.html">GetBucketReplication</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketReplication.html">DeleteBucketReplication</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_replication(input : PutBucketReplicationRequest) :   NoReturn
    path = "/{Bucket}?replication"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Sets the request payment configuration for a bucket. By default, the bucket owner pays
  # for downloads from the bucket. This configuration parameter enables the bucket owner (only)
  # to specify that the person requesting the download will be charged for the download. For
  # more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html">Requester Pays
  # Buckets</a>.</p>
  #
  # <p>The following operations are related to <code>PutBucketRequestPayment</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketRequestPayment.html">GetBucketRequestPayment</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_request_payment(input : PutBucketRequestPaymentRequest) :   NoReturn
    path = "/{Bucket}?requestPayment"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Sets the tags for a bucket.</p>
  # <p>Use tags to organize your AWS bill to reflect your own cost structure. To do this, sign
  # up to get your AWS account bill with tag key values included. Then, to see the cost of
  # combined resources, organize your billing information according to resources with the same
  # tag key values. For example, you can tag several resources with a specific application
  # name, and then organize your billing information to see the total cost of that application
  # across several services. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Cost Allocation
  # and Tagging</a>.</p>
  #
  # <note>
  # <p>Within a bucket, if you add a tag that has the same key as an existing tag, the new
  # value overwrites the old value. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/CostAllocTagging.html">Using Cost Allocation in Amazon S3 Bucket
  # Tags</a>.</p>
  # </note>
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:PutBucketTagging</code> action. The bucket owner has this permission by default
  # and can grant this permission to others. For more information about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a>.</p>
  #
  # <p>
  # <code>PutBucketTagging</code> has the following special errors:</p>
  # <ul>
  # <li>
  # <p>Error code: <code>InvalidTagError</code>
  # </p>
  # <ul>
  # <li>
  # <p>Description: The tag provided was not a valid tag. This error can occur if
  # the tag did not pass input validation. For information about tag restrictions,
  # see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">User-Defined Tag Restrictions</a> and <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/aws-tag-restrictions.html">AWS-Generated Cost Allocation Tag Restrictions</a>.</p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <p>Error code: <code>MalformedXMLError</code>
  # </p>
  # <ul>
  # <li>
  # <p>Description: The XML provided does not match the schema.</p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <p>Error code: <code>OperationAbortedError </code>
  # </p>
  # <ul>
  # <li>
  # <p>Description: A conflicting conditional operation is currently in progress
  # against this resource. Please try again.</p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <p>Error code: <code>InternalError</code>
  # </p>
  # <ul>
  # <li>
  # <p>Description: The service was unable to apply the provided tag to the
  # bucket.</p>
  # </li>
  # </ul>
  # </li>
  # </ul>
  #
  #
  # <p>The following operations are related to <code>PutBucketTagging</code>:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketTagging.html">GetBucketTagging</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketTagging.html">DeleteBucketTagging</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_tagging(input : PutBucketTaggingRequest) :   NoReturn
    path = "/{Bucket}?tagging"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Sets the versioning state of an existing bucket. To set the versioning state, you must
  # be the bucket owner.</p>
  # <p>You can set the versioning state with one of the following values:</p>
  #
  # <p>
  # <b>Enabled</b>—Enables versioning for the objects in the
  # bucket. All objects added to the bucket receive a unique version ID.</p>
  #
  # <p>
  # <b>Suspended</b>—Disables versioning for the objects in the
  # bucket. All objects added to the bucket receive the version ID null.</p>
  #
  # <p>If the versioning state has never been set on a bucket, it has no versioning state; a
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html">GetBucketVersioning</a> request does not return a versioning state value.</p>
  #
  # <p>If the bucket owner enables MFA Delete in the bucket versioning configuration, the
  # bucket owner must include the <code>x-amz-mfa request</code> header and the
  # <code>Status</code> and the <code>MfaDelete</code> request elements in a request to set
  # the versioning state of the bucket.</p>
  #
  # <important>
  # <p>If you have an object expiration lifecycle policy in your non-versioned bucket and
  # you want to maintain the same permanent delete behavior when you enable versioning, you
  # must add a noncurrent expiration policy. The noncurrent expiration lifecycle policy will
  # manage the deletes of the noncurrent object versions in the version-enabled bucket. (A
  # version-enabled bucket maintains one current and zero or more noncurrent object
  # versions.) For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html#lifecycle-and-other-bucket-config">Lifecycle and Versioning</a>.</p>
  # </important>
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html">DeleteBucket</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html">GetBucketVersioning</a>
  # </p>
  # </li>
  # </ul>
  def put_bucket_versioning(input : PutBucketVersioningRequest) :   NoReturn
    path = "/{Bucket}?versioning"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Sets the configuration of the website that is specified in the <code>website</code>
  # subresource. To configure a bucket as a website, you can add this subresource on the bucket
  # with website configuration information such as the file name of the index document and any
  # redirect rules. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html">Hosting Websites on Amazon S3</a>.</p>
  #
  # <p>This PUT operation requires the <code>S3:PutBucketWebsite</code> permission. By default,
  # only the bucket owner can configure the website attached to a bucket; however, bucket
  # owners can allow other users to set the website configuration by writing a bucket policy
  # that grants them the <code>S3:PutBucketWebsite</code> permission.</p>
  #
  # <p>To redirect all website requests sent to the bucket's website endpoint, you add a
  # website configuration with the following elements. Because all requests are sent to another
  # website, you don't need to provide index document name for the bucket.</p>
  # <ul>
  # <li>
  # <p>
  # <code>WebsiteConfiguration</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>RedirectAllRequestsTo</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>HostName</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>Protocol</code>
  # </p>
  # </li>
  # </ul>
  #
  # <p>If you want granular control over redirects, you can use the following elements to add
  # routing rules that describe conditions for redirecting requests and information about the
  # redirect destination. In this case, the website configuration must provide an index
  # document for the bucket, because some requests might not be redirected. </p>
  # <ul>
  # <li>
  # <p>
  # <code>WebsiteConfiguration</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>IndexDocument</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>Suffix</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>ErrorDocument</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>Key</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>RoutingRules</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>RoutingRule</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>Condition</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>HttpErrorCodeReturnedEquals</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>KeyPrefixEquals</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>Redirect</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>Protocol</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>HostName</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>ReplaceKeyPrefixWith</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>ReplaceKeyWith</code>
  # </p>
  # </li>
  # <li>
  # <p>
  # <code>HttpRedirectCode</code>
  # </p>
  # </li>
  # </ul>
  #
  # <p>Amazon S3 has a limitation of 50 routing rules per website configuration. If you require more
  # than 50 routing rules, you can use object redirect. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html">Configuring an
  # Object Redirect</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  def put_bucket_website(input : PutBucketWebsiteRequest) :   NoReturn
    path = "/{Bucket}?website"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Adds an object to a bucket. You must have WRITE permissions on a bucket to add an object
  # to it.</p>
  #
  #
  # <p>Amazon S3 never adds partial objects; if you receive a success response, Amazon S3 added the
  # entire object to the bucket.</p>
  #
  # <p>Amazon S3 is a distributed system. If it receives multiple write requests for the same object
  # simultaneously, it overwrites all but the last object written. Amazon S3 does not provide object
  # locking; if you need this, make sure to build it into your application layer or use
  # versioning instead.</p>
  #
  # <p>To ensure that data is not corrupted traversing the network, use the
  # <code>Content-MD5</code> header. When you use this header, Amazon S3 checks the object
  # against the provided MD5 value and, if they do not match, returns an error. Additionally,
  # you can calculate the MD5 while putting an object to Amazon S3 and compare the returned ETag to
  # the calculated MD5 value.</p>
  # <note>
  # <p> The <code>Content-MD5</code> header is required for any request to upload an object
  # with a retention period configured using Amazon S3 Object Lock. For more information about
  # Amazon S3 Object Lock, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock-overview.html">Amazon S3 Object Lock Overview</a>
  # in the <i>Amazon Simple Storage Service Developer Guide</i>. </p>
  # </note>
  #
  #
  # <p>
  # <b>Server-side Encryption</b>
  # </p>
  # <p>You can optionally request server-side encryption. With server-side encryption, Amazon S3 encrypts your data as it writes it to disks in its data centers and decrypts the data
  # when you access it. You have the option to provide your own encryption key or use AWS
  # managed encryption keys (SSE-S3 or SSE-KMS). For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html">Using Server-Side
  # Encryption</a>.</p>
  # <p>If you request server-side encryption using AWS Key Management Service (SSE-KMS), you can enable an S3 Bucket Key at the object-level. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html">Amazon S3 Bucket Keys</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p>
  # <b>Access Control List (ACL)-Specific Request
  # Headers</b>
  # </p>
  # <p>You can use headers to grant ACL- based permissions. By default, all objects are
  # private. Only the owner has full access control. When adding a new object, you can grant
  # permissions to individual AWS accounts or to predefined groups defined by Amazon S3. These
  # permissions are then added to the ACL on the object. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access Control List
  # (ACL) Overview</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-using-rest-api.html">Managing ACLs Using the REST
  # API</a>. </p>
  #
  # <p>
  # <b>Storage Class Options</b>
  # </p>
  # <p>By default, Amazon S3 uses the STANDARD Storage Class to store newly created objects. The
  # STANDARD storage class provides high durability and high availability. Depending on
  # performance needs, you can specify a different Storage Class. Amazon S3 on Outposts only uses
  # the OUTPOSTS Storage Class. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage Classes</a> in the <i>Amazon S3
  # Service Developer Guide</i>.</p>
  #
  #
  # <p>
  # <b>Versioning</b>
  # </p>
  # <p>If you enable versioning for a bucket, Amazon S3 automatically generates a unique version ID
  # for the object being stored. Amazon S3 returns this ID in the response. When you enable
  # versioning for a bucket, if Amazon S3 receives multiple write requests for the same object
  # simultaneously, it stores all of the objects.</p>
  # <p>For more information about versioning, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/AddingObjectstoVersioningEnabledBuckets.html">Adding Objects to
  # Versioning Enabled Buckets</a>. For information about returning the versioning state
  # of a bucket, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html">GetBucketVersioning</a>. </p>
  #
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html">CopyObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  # </p>
  # </li>
  # </ul>
  def put_object(input : PutObjectRequest) : PutObjectOutput
    path = "/{Bucket}/{Key+}?x-id=PutObject"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    PutObjectOutput.from_request(request)
  end



      # <p>Uses the <code>acl</code> subresource to set the access control list (ACL) permissions
  # for a new or existing object in an S3 bucket. You must have <code>WRITE_ACP</code>
  # permission to set the ACL of an object. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#permissions">What
  # permissions can I grant?</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p>This action is not supported by Amazon S3 on Outposts.</p>
  # <p>Depending on your application needs, you can choose to set
  # the ACL on an object using either the request body or the headers. For example, if you have
  # an existing application that updates a bucket ACL using the request body, you can continue
  # to use that approach. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access Control List (ACL) Overview</a> in the <i>Amazon S3 Developer
  # Guide</i>.</p>
  #
  #
  #
  # <p>
  # <b>Access Permissions</b>
  # </p>
  # <p>You can set access permissions using one of the following methods:</p>
  # <ul>
  # <li>
  # <p>Specify a canned ACL with the <code>x-amz-acl</code> request header. Amazon S3 supports
  # a set of predefined ACLs, known as canned ACLs. Each canned ACL has a predefined set
  # of grantees and permissions. Specify the canned ACL name as the value of
  # <code>x-amz-ac</code>l. If you use this header, you cannot use other access
  # control-specific headers in your request. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned ACL</a>.</p>
  # </li>
  # <li>
  # <p>Specify access permissions explicitly with the <code>x-amz-grant-read</code>,
  # <code>x-amz-grant-read-acp</code>, <code>x-amz-grant-write-acp</code>, and
  # <code>x-amz-grant-full-control</code> headers. When using these headers, you
  # specify explicit access permissions and grantees (AWS accounts or Amazon S3 groups) who
  # will receive the permission. If you use these ACL-specific headers, you cannot use
  # <code>x-amz-acl</code> header to set a canned ACL. These parameters map to the set
  # of permissions that Amazon S3 supports in an ACL. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access Control List (ACL)
  # Overview</a>.</p>
  #
  # <p>You specify each grantee as a type=value pair, where the type is one of the
  # following:</p>
  # <ul>
  # <li>
  # <p>
  # <code>id</code> – if the value specified is the canonical user ID of an AWS
  # account</p>
  # </li>
  # <li>
  # <p>
  # <code>uri</code> – if you are granting permissions to a predefined
  # group</p>
  # </li>
  # <li>
  # <p>
  # <code>emailAddress</code> – if the value specified is the email address of
  # an AWS account</p>
  # <note>
  # <p>Using email addresses to specify a grantee is only supported in the following AWS Regions: </p>
  # <ul>
  # <li>
  # <p>US East (N. Virginia)</p>
  # </li>
  # <li>
  # <p>US West (N. California)</p>
  # </li>
  # <li>
  # <p> US West (Oregon)</p>
  # </li>
  # <li>
  # <p> Asia Pacific (Singapore)</p>
  # </li>
  # <li>
  # <p>Asia Pacific (Sydney)</p>
  # </li>
  # <li>
  # <p>Asia Pacific (Tokyo)</p>
  # </li>
  # <li>
  # <p>Europe (Ireland)</p>
  # </li>
  # <li>
  # <p>South America (São Paulo)</p>
  # </li>
  # </ul>
  # <p>For a list of all the Amazon S3 supported Regions and endpoints, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions and Endpoints</a> in the AWS General Reference.</p>
  # </note>
  # </li>
  # </ul>
  # <p>For example, the following <code>x-amz-grant-read</code> header grants list
  # objects permission to the two AWS accounts identified by their email
  # addresses.</p>
  # <p>
  # <code>x-amz-grant-read: emailAddress="xyz@amazon.com",
  # emailAddress="abc@amazon.com" </code>
  # </p>
  #
  # </li>
  # </ul>
  # <p>You can use either a canned ACL or specify access permissions explicitly. You cannot do
  # both.</p>
  # <p>
  # <b>Grantee Values</b>
  # </p>
  # <p>You can specify the person (grantee) to whom you're assigning access rights (using
  # request elements) in the following ways:</p>
  # <ul>
  # <li>
  # <p>By the person's ID:</p>
  # <p>
  # <code><Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  # xsi:type="CanonicalUser"><ID><>ID<></ID><DisplayName><>GranteesEmail<></DisplayName>
  # </Grantee></code>
  # </p>
  # <p>DisplayName is optional and ignored in the request.</p>
  # </li>
  # <li>
  # <p>By URI:</p>
  # <p>
  # <code><Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  # xsi:type="Group"><URI><>http://acs.amazonaws.com/groups/global/AuthenticatedUsers<></URI></Grantee></code>
  # </p>
  # </li>
  # <li>
  # <p>By Email address:</p>
  # <p>
  # <code><Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  # xsi:type="AmazonCustomerByEmail"><EmailAddress><>Grantees@email.com<></EmailAddress>lt;/Grantee></code>
  # </p>
  # <p>The grantee is resolved to the CanonicalUser and, in a response to a GET Object
  # acl request, appears as the CanonicalUser.</p>
  # <note>
  # <p>Using email addresses to specify a grantee is only supported in the following AWS Regions: </p>
  # <ul>
  # <li>
  # <p>US East (N. Virginia)</p>
  # </li>
  # <li>
  # <p>US West (N. California)</p>
  # </li>
  # <li>
  # <p> US West (Oregon)</p>
  # </li>
  # <li>
  # <p> Asia Pacific (Singapore)</p>
  # </li>
  # <li>
  # <p>Asia Pacific (Sydney)</p>
  # </li>
  # <li>
  # <p>Asia Pacific (Tokyo)</p>
  # </li>
  # <li>
  # <p>Europe (Ireland)</p>
  # </li>
  # <li>
  # <p>South America (São Paulo)</p>
  # </li>
  # </ul>
  # <p>For a list of all the Amazon S3 supported Regions and endpoints, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions and Endpoints</a> in the AWS General Reference.</p>
  # </note>
  # </li>
  # </ul>
  # <p>
  # <b>Versioning</b>
  # </p>
  # <p>The ACL of an object is set at the object version level. By default, PUT sets the ACL of
  # the current version of an object. To set the ACL of a different version, use the
  # <code>versionId</code> subresource.</p>
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html">CopyObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  # </p>
  # </li>
  # </ul>
  def put_object_acl(input : PutObjectAclRequest) : PutObjectAclOutput
    path = "/{Bucket}/{Key+}?acl"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    PutObjectAclOutput.from_request(request)
  end



      # <p>Applies a Legal Hold configuration to the specified object.</p>
  # <p>This action is not supported by Amazon S3 on Outposts.</p>
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Locking Objects</a>
  # </p>
  # </li>
  # </ul>
  def put_object_legal_hold(input : PutObjectLegalHoldRequest) : PutObjectLegalHoldOutput
    path = "/{Bucket}/{Key+}?legal-hold"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    PutObjectLegalHoldOutput.from_request(request)
  end



      # <p>Places an Object Lock configuration on the specified bucket. The rule specified in the
  # Object Lock configuration will be applied by default to every new object placed in the
  # specified bucket.</p>
  # <note>
  # <p>
  # <code>DefaultRetention</code> requires either Days or Years. You can't specify both
  # at the same time.</p>
  # </note>
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Locking
  # Objects</a>
  # </p>
  # </li>
  # </ul>
  def put_object_lock_configuration(input : PutObjectLockConfigurationRequest) : PutObjectLockConfigurationOutput
    path = "/{Bucket}?object-lock"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    PutObjectLockConfigurationOutput.from_request(request)
  end



      # <p>Places an Object Retention configuration on an object.</p>
  # <p>This action is not supported by Amazon S3 on Outposts.</p>
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Locking Objects</a>
  # </p>
  # </li>
  # </ul>
  def put_object_retention(input : PutObjectRetentionRequest) : PutObjectRetentionOutput
    path = "/{Bucket}/{Key+}?retention"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    PutObjectRetentionOutput.from_request(request)
  end



      # <p>Sets the supplied tag-set to an object that already exists in a bucket.</p>
  # <p>A tag is a key-value pair. You can associate tags with an object by sending a PUT
  # request against the tagging subresource that is associated with the object. You can
  # retrieve tags by sending a GET request. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html">GetObjectTagging</a>.</p>
  #
  # <p>For tagging-related restrictions related to characters and encodings, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">Tag
  # Restrictions</a>. Note that Amazon S3 limits the maximum number of tags to 10 tags per
  # object.</p>
  #
  # <p>To use this operation, you must have permission to perform the
  # <code>s3:PutObjectTagging</code> action. By default, the bucket owner has this
  # permission and can grant this permission to others.</p>
  #
  # <p>To put tags of any other version, use the <code>versionId</code> query parameter. You
  # also need permission for the <code>s3:PutObjectVersionTagging</code> action.</p>
  #
  # <p>For information about the Amazon S3 object tagging feature, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-tagging.html">Object Tagging</a>.</p>
  #
  #
  # <p class="title">
  # <b>Special Errors</b>
  # </p>
  # <ul>
  # <li>
  # <ul>
  # <li>
  # <p>
  # <i>Code: InvalidTagError </i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Cause: The tag provided was not a valid tag. This error can occur
  # if the tag did not pass input validation. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-tagging.html">Object Tagging</a>.</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <ul>
  # <li>
  # <p>
  # <i>Code: MalformedXMLError </i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Cause: The XML provided does not match the schema.</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <ul>
  # <li>
  # <p>
  # <i>Code: OperationAbortedError </i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Cause: A conflicting conditional operation is currently in
  # progress against this resource. Please try again.</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <ul>
  # <li>
  # <p>
  # <i>Code: InternalError</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Cause: The service was unable to apply the provided tag to the
  # object.</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # </ul>
  #
  #
  #
  #
  #
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html">GetObjectTagging</a>
  # </p>
  # </li>
  # </ul>
  def put_object_tagging(input : PutObjectTaggingRequest) : PutObjectTaggingOutput
    path = "/{Bucket}/{Key+}?tagging"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    PutObjectTaggingOutput.from_request(request)
  end



      # <p>Creates or modifies the <code>PublicAccessBlock</code> configuration for an Amazon S3 bucket.
  # To use this operation, you must have the <code>s3:PutBucketPublicAccessBlock</code>
  # permission. For more information about Amazon S3 permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying Permissions in a
  # Policy</a>.</p>
  #
  # <important>
  # <p>When Amazon S3 evaluates the <code>PublicAccessBlock</code> configuration for a bucket or
  # an object, it checks the <code>PublicAccessBlock</code> configuration for both the
  # bucket (or the bucket that contains the object) and the bucket owner's account. If the
  # <code>PublicAccessBlock</code> configurations are different between the bucket and
  # the account, Amazon S3 uses the most restrictive combination of the bucket-level and
  # account-level settings.</p>
  # </important>
  #
  #
  # <p>For more information about when Amazon S3 considers a bucket or an object public, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The Meaning of "Public"</a>.</p>
  #
  #
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html">GetPublicAccessBlock</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeletePublicAccessBlock.html">DeletePublicAccessBlock</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketPolicyStatus.html">GetBucketPolicyStatus</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">Using Amazon S3 Block
  # Public Access</a>
  # </p>
  # </li>
  # </ul>
  def put_public_access_block(input : PutPublicAccessBlockRequest) :   NoReturn
    path = "/{Bucket}?publicAccessBlock"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    nil
  end



      # <p>Restores an archived copy of an object back into Amazon S3</p>
  # <p>This action is not supported by Amazon S3 on Outposts.</p>
  # <p>This action performs the following types of requests: </p>
  # <ul>
  # <li>
  # <p>
  # <code>select</code> - Perform a select query on an archived object</p>
  # </li>
  # <li>
  # <p>
  # <code>restore an archive</code> - Restore an archived object</p>
  # </li>
  # </ul>
  # <p>To use this operation, you must have permissions to perform the
  # <code>s3:RestoreObject</code> action. The bucket owner has this permission by default
  # and can grant this permission to others. For more information about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions Related to Bucket Subresource Operations</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing Access Permissions to Your Amazon S3
  # Resources</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p>
  # <b>Querying Archives with Select Requests</b>
  # </p>
  # <p>You use a select type of request to perform SQL queries on archived objects. The
  # archived objects that are being queried by the select request must be formatted as
  # uncompressed comma-separated values (CSV) files. You can run queries and custom analytics
  # on your archived data without having to restore your data to a hotter Amazon S3 tier. For an
  # overview about select requests, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/querying-glacier-archives.html">Querying Archived Objects</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p>When making a select request, do the following:</p>
  # <ul>
  # <li>
  # <p>Define an output location for the select query's output. This must be an Amazon S3
  # bucket in the same AWS Region as the bucket that contains the archive object that is
  # being queried. The AWS account that initiates the job must have permissions to write
  # to the S3 bucket. You can specify the storage class and encryption for the output
  # objects stored in the bucket. For more information about output, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/querying-glacier-archives.html">Querying Archived Objects</a>
  # in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p>For more information about the <code>S3</code> structure in the request body, see
  # the following:</p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html">Managing Access with
  # ACLs</a> in the <i>Amazon Simple Storage Service Developer Guide</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">Protecting Data Using
  # Server-Side Encryption</a> in the
  # <i>Amazon Simple Storage Service Developer Guide</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <p>Define the SQL expression for the <code>SELECT</code> type of restoration for your
  # query in the request body's <code>SelectParameters</code> structure. You can use
  # expressions like the following examples.</p>
  # <ul>
  # <li>
  # <p>The following expression returns all records from the specified
  # object.</p>
  # <p>
  # <code>SELECT * FROM Object</code>
  # </p>
  # </li>
  # <li>
  # <p>Assuming that you are not using any headers for data stored in the object,
  # you can specify columns with positional headers.</p>
  # <p>
  # <code>SELECT s._1, s._2 FROM Object s WHERE s._3 > 100</code>
  # </p>
  # </li>
  # <li>
  # <p>If you have headers and you set the <code>fileHeaderInfo</code> in the
  # <code>CSV</code> structure in the request body to <code>USE</code>, you can
  # specify headers in the query. (If you set the <code>fileHeaderInfo</code> field
  # to <code>IGNORE</code>, the first row is skipped for the query.) You cannot mix
  # ordinal positions with header column names. </p>
  # <p>
  # <code>SELECT s.Id, s.FirstName, s.SSN FROM S3Object s</code>
  # </p>
  # </li>
  # </ul>
  # </li>
  # </ul>
  # <p>For more information about using SQL with S3 Glacier Select restore, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-glacier-select-sql-reference.html">SQL Reference for Amazon S3 Select and
  # S3 Glacier Select</a> in the <i>Amazon Simple Storage Service Developer Guide</i>. </p>
  # <p>When making a select request, you can also do the following:</p>
  # <ul>
  # <li>
  # <p>To expedite your queries, specify the <code>Expedited</code> tier. For more
  # information about tiers, see "Restoring Archives," later in this topic.</p>
  # </li>
  # <li>
  # <p>Specify details about the data serialization format of both the input object that
  # is being queried and the serialization of the CSV-encoded query results.</p>
  # </li>
  # </ul>
  # <p>The following are additional important facts about the select feature:</p>
  # <ul>
  # <li>
  # <p>The output results are new Amazon S3 objects. Unlike archive retrievals, they are
  # stored until explicitly deleted-manually or through a lifecycle policy.</p>
  # </li>
  # <li>
  # <p>You can issue more than one select request on the same Amazon S3 object. Amazon S3 doesn't
  # deduplicate requests, so avoid issuing duplicate requests.</p>
  # </li>
  # <li>
  # <p> Amazon S3 accepts a select request even if the object has already been restored. A
  # select request doesn’t return error response <code>409</code>.</p>
  # </li>
  # </ul>
  # <p>
  # <b>Restoring objects</b>
  # </p>
  # <p>Objects that you archive to the S3 Glacier or
  # S3 Glacier Deep Archive storage class, and S3 Intelligent-Tiering Archive or
  # S3 Intelligent-Tiering Deep Archive tiers are not accessible in real time. For objects in
  # Archive Access or Deep Archive Access tiers you must first initiate a restore request, and
  # then wait until the object is moved into the Frequent Access tier. For objects in
  # S3 Glacier or S3 Glacier Deep Archive storage classes you must
  # first initiate a restore request, and then wait until a temporary copy of the object is
  # available. To access an archived object, you must restore the object for the duration
  # (number of days) that you specify.</p>
  # <p>To restore a specific object version, you can provide a version ID. If you don't provide
  # a version ID, Amazon S3 restores the current version.</p>
  # <p>When restoring an archived object (or using a select request), you can specify one of
  # the following data access tier options in the <code>Tier</code> element of the request
  # body: </p>
  # <ul>
  # <li>
  # <p>
  # <b>
  # <code>Expedited</code>
  # </b> - Expedited retrievals
  # allow you to quickly access your data stored in the S3 Glacier
  # storage class or S3 Intelligent-Tiering Archive tier when occasional urgent requests for a
  # subset of archives are required. For all but the largest archived objects (250 MB+),
  # data accessed using Expedited retrievals is typically made available within 1–5
  # minutes. Provisioned capacity ensures that retrieval capacity for Expedited
  # retrievals is available when you need it. Expedited retrievals and provisioned
  # capacity are not available for objects stored in the S3 Glacier Deep Archive
  # storage class or S3 Intelligent-Tiering Deep Archive tier.</p>
  # </li>
  # <li>
  # <p>
  # <b>
  # <code>Standard</code>
  # </b> - Standard retrievals allow
  # you to access any of your archived objects within several hours. This is the default
  # option for retrieval requests that do not specify the retrieval option. Standard
  # retrievals typically finish within 3–5 hours for objects stored in the
  # S3 Glacier storage class or S3 Intelligent-Tiering Archive tier. They
  # typically finish within 12 hours for objects stored in the
  # S3 Glacier Deep Archive storage class or S3 Intelligent-Tiering Deep Archive tier.
  # Standard retrievals are free for objects stored in S3 Intelligent-Tiering.</p>
  # </li>
  # <li>
  # <p>
  # <b>
  # <code>Bulk</code>
  # </b> - Bulk retrievals are the
  # lowest-cost retrieval option in S3 Glacier, enabling you to retrieve large amounts,
  # even petabytes, of data inexpensively. Bulk retrievals typically finish within 5–12
  # hours for objects stored in the S3 Glacier storage class or
  # S3 Intelligent-Tiering Archive tier. They typically finish within 48 hours for objects stored
  # in the S3 Glacier Deep Archive storage class or S3 Intelligent-Tiering Deep Archive tier.
  # Bulk retrievals are free for objects stored in S3 Intelligent-Tiering.</p>
  # </li>
  # </ul>
  # <p>For more information about archive retrieval options and provisioned capacity for
  # <code>Expedited</code> data access, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/restoring-objects.html">Restoring Archived Objects</a> in the <i>Amazon Simple Storage Service Developer Guide</i>. </p>
  # <p>You can use Amazon S3 restore speed upgrade to change the restore speed to a faster speed
  # while it is in progress. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/restoring-objects.html#restoring-objects-upgrade-tier.title.html">
  # Upgrading the speed of an in-progress restore</a> in the
  # <i>Amazon Simple Storage Service Developer Guide</i>. </p>
  # <p>To get the status of object restoration, you can send a <code>HEAD</code> request.
  # Operations return the <code>x-amz-restore</code> header, which provides information about
  # the restoration status, in the response. You can use Amazon S3 event notifications to notify you
  # when a restore is initiated or completed. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Amazon S3 Event Notifications</a> in
  # the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p>After restoring an archived object, you can update the restoration period by reissuing
  # the request with a new period. Amazon S3 updates the restoration period relative to the current
  # time and charges only for the request-there are no data transfer charges. You cannot
  # update the restoration period when Amazon S3 is actively processing your current restore request
  # for the object.</p>
  # <p>If your bucket has a lifecycle configuration with a rule that includes an expiration
  # action, the object expiration overrides the life span that you specify in a restore
  # request. For example, if you restore an object copy for 10 days, but the object is
  # scheduled to expire in 3 days, Amazon S3 deletes the object in 3 days. For more information
  # about lifecycle configuration, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html">Object Lifecycle Management</a> in
  # <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p>
  # <b>Responses</b>
  # </p>
  # <p>A successful operation returns either the <code>200 OK</code> or <code>202
  # Accepted</code> status code. </p>
  # <ul>
  # <li>
  # <p>If the object is not previously restored, then Amazon S3 returns <code>202
  # Accepted</code> in the response. </p>
  # </li>
  # <li>
  # <p>If the object is previously restored, Amazon S3 returns <code>200 OK</code> in the
  # response. </p>
  # </li>
  # </ul>
  # <p class="title">
  # <b>Special Errors</b>
  # </p>
  # <ul>
  # <li>
  # <ul>
  # <li>
  # <p>
  # <i>Code: RestoreAlreadyInProgress</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Cause: Object restore is already in progress. (This error does not
  # apply to SELECT type requests.)</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>HTTP Status Code: 409 Conflict</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>SOAP Fault Code Prefix: Client</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <ul>
  # <li>
  # <p>
  # <i>Code: GlacierExpeditedRetrievalNotAvailable</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Cause: expedited retrievals are currently not available. Try again
  # later. (Returned if there is insufficient capacity to process the Expedited
  # request. This error applies only to Expedited retrievals and not to
  # S3 Standard or Bulk retrievals.)</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>HTTP Status Code: 503</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>SOAP Fault Code Prefix: N/A</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # </ul>
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketNotificationConfiguration.html">GetBucketNotificationConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-glacier-select-sql-reference.html">SQL Reference for
  # Amazon S3 Select and S3 Glacier Select </a> in the
  # <i>Amazon Simple Storage Service Developer Guide</i>
  # </p>
  # </li>
  # </ul>
  def restore_object(input : RestoreObjectRequest) : RestoreObjectOutput
    path = "/{Bucket}/{Key+}?restore"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    RestoreObjectOutput.from_request(request)
  end



      # <p>This operation filters the contents of an Amazon S3 object based on a simple structured query
  # language (SQL) statement. In the request, along with the SQL expression, you must also
  # specify a data serialization format (JSON, CSV, or Apache Parquet) of the object. Amazon S3 uses
  # this format to parse object data into records, and returns only records that match the
  # specified SQL expression. You must also specify the data serialization format for the
  # response.</p>
  # <p>This action is not supported by Amazon S3 on Outposts.</p>
  # <p>For more information about Amazon S3 Select,
  # see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/selecting-content-from-objects.html">Selecting Content from
  # Objects</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p>For more information about using SQL with Amazon S3 Select, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-glacier-select-sql-reference.html"> SQL Reference for Amazon S3 Select
  # and S3 Glacier Select</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p></p>
  # <p>
  # <b>Permissions</b>
  # </p>
  # <p>You must have <code>s3:GetObject</code> permission for this operation. Amazon S3 Select does
  # not support anonymous access. For more information about permissions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying Permissions in a Policy</a>
  # in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p></p>
  # <p>
  # <i>Object Data Formats</i>
  # </p>
  # <p>You can use Amazon S3 Select to query objects that have the following format
  # properties:</p>
  # <ul>
  # <li>
  # <p>
  # <i>CSV, JSON, and Parquet</i> - Objects must be in CSV, JSON, or
  # Parquet format.</p>
  # </li>
  # <li>
  # <p>
  # <i>UTF-8</i> - UTF-8 is the only encoding type Amazon S3 Select
  # supports.</p>
  # </li>
  # <li>
  # <p>
  # <i>GZIP or BZIP2</i> - CSV and JSON files can be compressed using
  # GZIP or BZIP2. GZIP and BZIP2 are the only compression formats that Amazon S3 Select
  # supports for CSV and JSON files. Amazon S3 Select supports columnar compression for
  # Parquet using GZIP or Snappy. Amazon S3 Select does not support whole-object compression
  # for Parquet objects.</p>
  # </li>
  # <li>
  # <p>
  # <i>Server-side encryption</i> - Amazon S3 Select supports querying
  # objects that are protected with server-side encryption.</p>
  # <p>For objects that are encrypted with customer-provided encryption keys (SSE-C), you
  # must use HTTPS, and you must use the headers that are documented in the <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>. For more information about SSE-C, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side Encryption
  # (Using Customer-Provided Encryption Keys)</a> in the
  # <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # <p>For objects that are encrypted with Amazon S3 managed encryption keys (SSE-S3) and
  # customer master keys (CMKs) stored in AWS Key Management Service (SSE-KMS),
  # server-side encryption is handled transparently, so you don't need to specify
  # anything. For more information about server-side encryption, including SSE-S3 and
  # SSE-KMS, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">Protecting Data Using
  # Server-Side Encryption</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # </li>
  # </ul>
  #
  # <p>
  # <b>Working with the Response Body</b>
  # </p>
  # <p>Given the response size is unknown, Amazon S3 Select streams the response as a series of
  # messages and includes a <code>Transfer-Encoding</code> header with <code>chunked</code> as
  # its value in the response. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTSelectObjectAppendix.html">Appendix: SelectObjectContent
  # Response</a>
  # .</p>
  #
  # <p></p>
  # <p>
  # <b>GetObject Support</b>
  # </p>
  # <p>The <code>SelectObjectContent</code> operation does not support the following
  # <code>GetObject</code> functionality. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>.</p>
  # <ul>
  # <li>
  # <p>
  # <code>Range</code>: Although you can specify a scan range for an Amazon S3 Select request
  # (see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_SelectObjectContent.html#AmazonS3-SelectObjectContent-request-ScanRange">SelectObjectContentRequest - ScanRange</a> in the request parameters),
  # you cannot specify the range of bytes of an object to return. </p>
  # </li>
  # <li>
  # <p>GLACIER, DEEP_ARCHIVE and REDUCED_REDUNDANCY storage classes: You cannot specify
  # the GLACIER, DEEP_ARCHIVE, or <code>REDUCED_REDUNDANCY</code> storage classes. For
  # more information, about storage classes see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#storage-class-intro">Storage Classes</a>
  # in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # </li>
  # </ul>
  # <p></p>
  # <p>
  # <b>Special Errors</b>
  # </p>
  #
  # <p>For a list of special errors for this operation, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#SelectObjectContentErrorCodeList">List of
  # SELECT Object Content Error Codes</a>
  # </p>
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>
  # </p>
  # </li>
  # </ul>
  def select_object_content(input : SelectObjectContentRequest) : SelectObjectContentOutput
    path = "/{Bucket}/{Key+}?select&select-type=2"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("POST", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    SelectObjectContentOutput.from_request(request)
  end



      # <p>Uploads a part in a multipart upload.</p>
  # <note>
  # <p>In this operation, you provide part data in your request. However, you have an option
  # to specify your existing Amazon S3 object as a data source for the part you are uploading. To
  # upload a part from an existing object, you use the <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html">UploadPartCopy</a> operation.
  # </p>
  # </note>
  #
  # <p>You must initiate a multipart upload (see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>)
  # before you can upload any part. In response to your initiate request, Amazon S3 returns an
  # upload ID, a unique identifier, that you must include in your upload part request.</p>
  # <p>Part numbers can be any number from 1 to 10,000, inclusive. A part number uniquely
  # identifies a part and also defines its position within the object being created. If you
  # upload a new part using the same part number that was used with a previous part, the
  # previously uploaded part is overwritten. Each part must be at least 5 MB in size, except
  # the last part. There is no size limit on the last part of your multipart upload.</p>
  # <p>To ensure that data is not corrupted when traversing the network, specify the
  # <code>Content-MD5</code> header in the upload part request. Amazon S3 checks the part data
  # against the provided MD5 value. If they do not match, Amazon S3 returns an error. </p>
  #
  # <p>If the upload request is signed with Signature Version 4, then AWS S3 uses the
  # <code>x-amz-content-sha256</code> header as a checksum instead of
  # <code>Content-MD5</code>. For more information see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-auth-using-authorization-header.html">Authenticating Requests: Using the Authorization Header (AWS Signature Version
  # 4)</a>. </p>
  #
  #
  #
  # <p>
  # <b>Note:</b> After you initiate multipart upload and upload
  # one or more parts, you must either complete or abort multipart upload in order to stop
  # getting charged for storage of the uploaded parts. Only after you either complete or abort
  # multipart upload, Amazon S3 frees up the parts storage and stops charging you for the parts
  # storage.</p>
  #
  # <p>For more information on multipart uploads, go to <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html">Multipart Upload Overview</a> in the
  # <i>Amazon Simple Storage Service Developer Guide </i>.</p>
  # <p>For information on the permissions required to use the multipart upload API, go to
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart Upload API and
  # Permissions</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  #
  # <p>You can optionally request server-side encryption where Amazon S3 encrypts your data as it
  # writes it to disks in its data centers and decrypts it for you when you access it. You have
  # the option of providing your own encryption key, or you can use the AWS managed encryption
  # keys. If you choose to provide your own encryption key, the request headers you provide in
  # the request must match the headers you used in the request to initiate the upload by using
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>. For more information, go to <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html">Using Server-Side Encryption</a> in
  # the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  #
  # <p>Server-side encryption is supported by the S3 Multipart Upload actions. Unless you are
  # using a customer-provided encryption key, you don't need to specify the encryption
  # parameters in each UploadPart request. Instead, you only need to specify the server-side
  # encryption parameters in the initial Initiate Multipart request. For more information, see
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>.</p>
  #
  # <p>If you requested server-side encryption using a customer-provided encryption key in your
  # initiate multipart upload request, you must provide identical encryption information in
  # each part upload using the following headers.</p>
  #
  #
  # <ul>
  # <li>
  # <p>x-amz-server-side-encryption-customer-algorithm</p>
  # </li>
  # <li>
  # <p>x-amz-server-side-encryption-customer-key</p>
  # </li>
  # <li>
  # <p>x-amz-server-side-encryption-customer-key-MD5</p>
  # </li>
  # </ul>
  #
  # <p class="title">
  # <b>Special Errors</b>
  # </p>
  # <ul>
  # <li>
  # <ul>
  # <li>
  # <p>
  # <i>Code: NoSuchUpload</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Cause: The specified multipart upload does not exist. The upload
  # ID might be invalid, or the multipart upload might have been aborted or
  # completed.</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i> HTTP Status Code: 404 Not Found </i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>SOAP Fault Code Prefix: Client</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # </ul>
  #
  #
  #
  #
  #
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html">ListMultipartUploads</a>
  # </p>
  # </li>
  # </ul>
  def upload_part(input : UploadPartRequest) : UploadPartOutput
    path = "/{Bucket}/{Key+}?x-id=UploadPart"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    UploadPartOutput.from_request(request)
  end



      # <p>Uploads a part by copying data from an existing object as data source. You specify the
  # data source by adding the request header <code>x-amz-copy-source</code> in your request and
  # a byte range by adding the request header <code>x-amz-copy-source-range</code> in your
  # request. </p>
  # <p>The minimum allowable part size for a multipart upload is 5 MB. For more information
  # about multipart upload limits, go to <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/qfacts.html">Quick
  # Facts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>. </p>
  # <note>
  # <p>Instead of using an existing object as part data, you might use the <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  # operation and provide data in your request.</p>
  # </note>
  #
  # <p>You must initiate a multipart upload before you can upload any part. In response to your
  # initiate request. Amazon S3 returns a unique identifier, the upload ID, that you must include in
  # your upload part request.</p>
  # <p>For more information about using the <code>UploadPartCopy</code> operation, see the
  # following:</p>
  #
  # <ul>
  # <li>
  # <p>For conceptual information about multipart uploads, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html">Uploading Objects Using Multipart
  # Upload</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # </li>
  # <li>
  # <p>For information about permissions required to use the multipart upload API, see
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart Upload API and
  # Permissions</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # </li>
  # <li>
  # <p>For information about copying objects using a single atomic operation vs. the
  # multipart upload, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectOperations.html">Operations on
  # Objects</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
  # </li>
  # <li>
  # <p>For information about using server-side encryption with customer-provided
  # encryption keys with the UploadPartCopy operation, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html">CopyObject</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>.</p>
  # </li>
  # </ul>
  # <p>Note the following additional considerations about the request headers
  # <code>x-amz-copy-source-if-match</code>, <code>x-amz-copy-source-if-none-match</code>,
  # <code>x-amz-copy-source-if-unmodified-since</code>, and
  # <code>x-amz-copy-source-if-modified-since</code>:</p>
  # <p> </p>
  # <ul>
  # <li>
  # <p>
  # <b>Consideration 1</b> - If both of the
  # <code>x-amz-copy-source-if-match</code> and
  # <code>x-amz-copy-source-if-unmodified-since</code> headers are present in the
  # request as follows:</p>
  # <p>
  # <code>x-amz-copy-source-if-match</code> condition evaluates to <code>true</code>,
  # and;</p>
  # <p>
  # <code>x-amz-copy-source-if-unmodified-since</code> condition evaluates to
  # <code>false</code>;</p>
  # <p>Amazon S3 returns <code>200 OK</code> and copies the data.
  # </p>
  #
  # </li>
  # <li>
  # <p>
  # <b>Consideration 2</b> - If both of the
  # <code>x-amz-copy-source-if-none-match</code> and
  # <code>x-amz-copy-source-if-modified-since</code> headers are present in the
  # request as follows:</p>
  # <p>
  # <code>x-amz-copy-source-if-none-match</code> condition evaluates to
  # <code>false</code>, and;</p>
  # <p>
  # <code>x-amz-copy-source-if-modified-since</code> condition evaluates to
  # <code>true</code>;</p>
  # <p>Amazon S3 returns <code>412 Precondition Failed</code> response code.
  # </p>
  # </li>
  # </ul>
  # <p>
  # <b>Versioning</b>
  # </p>
  # <p>If your bucket has versioning enabled, you could have multiple versions of the same
  # object. By default, <code>x-amz-copy-source</code> identifies the current version of the
  # object to copy. If the current version is a delete marker and you don't specify a versionId
  # in the <code>x-amz-copy-source</code>, Amazon S3 returns a 404 error, because the object does
  # not exist. If you specify versionId in the <code>x-amz-copy-source</code> and the versionId
  # is a delete marker, Amazon S3 returns an HTTP 400 error, because you are not allowed to specify
  # a delete marker as a version for the <code>x-amz-copy-source</code>. </p>
  # <p>You can optionally specify a specific version of the source object to copy by adding the
  # <code>versionId</code> subresource as shown in the following example:</p>
  # <p>
  # <code>x-amz-copy-source: /bucket/object?versionId=version id</code>
  # </p>
  #
  # <p class="title">
  # <b>Special Errors</b>
  # </p>
  # <ul>
  # <li>
  # <ul>
  # <li>
  # <p>
  # <i>Code: NoSuchUpload</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Cause: The specified multipart upload does not exist. The upload
  # ID might be invalid, or the multipart upload might have been aborted or
  # completed.</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>HTTP Status Code: 404 Not Found</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # <li>
  # <ul>
  # <li>
  # <p>
  # <i>Code: InvalidRequest</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>Cause: The specified copy source is not supported as a byte-range
  # copy source.</i>
  # </p>
  # </li>
  # <li>
  # <p>
  # <i>HTTP Status Code: 400 Bad Request</i>
  # </p>
  # </li>
  # </ul>
  # </li>
  # </ul>
  #
  #
  #
  #
  #
  #
  # <p class="title">
  # <b>Related Resources</b>
  # </p>
  # <ul>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  # </p>
  # </li>
  # <li>
  # <p>
  # <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html">ListMultipartUploads</a>
  # </p>
  # </li>
  # </ul>
  def upload_part_copy(input : UploadPartCopyRequest) : UploadPartCopyOutput
    path = "/{Bucket}/{Key+}?x-id=UploadPartCopy"
    if label = input.bucket
      path.gsub("{Bucket}", label)
    else
      raise "No value provided for input HTTP label: Bucket"
    end
    if label = input.key
      path.gsub("{Key+}", label)
    else
      raise "No value provided for input HTTP label: Key"
    end
    request = HTTP::Request.new("PUT", path)
    request = input.process(request)
    response = AWSSdk::Client.send(request, success_code: 200)

    UploadPartCopyOutput.from_request(request)
  end





  class AbortMultipartUploadRequest
    include RestXML::Structure

    # <p>The bucket name to which the upload was taking place. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Key of the object for which the multipart upload was initiated.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>Upload ID that identifies the multipart upload.</p>
    @[Protocol::Field(location: :query, name: "uploadId", structure: false)]
    property upload_id : String
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @upload_id, @request_payer = nil , @expected_bucket_owner = nil )
    end
  end

  class AbortMultipartUploadOutput
    include RestXML::Structure

    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@request_charged = nil )
    end
  end

  class NoSuchUpload < Exception
    include RestXML::Structure


    def initialize()
    end
  end

  class CompletedPartStruct
    include RestXML::Structure

    # <p>Entity tag returned when the part was uploaded.</p>
    @[Protocol::Field(location: :body, name: "ETag", structure: false)]
    property e_tag : String?
    # <p>Part number that identifies the part. This is a positive integer between 1 and
    # 10,000.</p>
    @[Protocol::Field(location: :body, name: "PartNumber", structure: false)]
    property part_number : Int32?

    def initialize(@e_tag = nil , @part_number = nil )
    end
  end

  class CompletedMultipartUploadStruct
    include RestXML::Structure

    # <p>Array of CompletedPart data types.</p>
    @[Protocol::Field(location: :body, name: "Part", structure: false)]
    property parts : Array(CompletedPartStruct)?

    def initialize(@parts = nil )
    end
  end

  class CompleteMultipartUploadRequest
    include RestXML::Structure

    # <p>Name of the bucket to which the multipart upload was initiated.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Object key for which the multipart upload was initiated.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>The container for the multipart upload request information.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property multipart_upload : CompletedMultipartUploadStruct?
    # <p>ID for the initiated multipart upload.</p>
    @[Protocol::Field(location: :query, name: "uploadId", structure: false)]
    property upload_id : String
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @upload_id, @multipart_upload = nil , @request_payer = nil , @expected_bucket_owner = nil )
    end
  end

  class CompleteMultipartUploadOutput
    include RestXML::Structure

    # <p>The URI that identifies the newly created object.</p>
    @[Protocol::Field(location: :body, name: "Location", structure: false)]
    property location : String?
    # <p>The name of the bucket that contains the newly created object.</p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "Bucket", structure: false)]
    property bucket : String?
    # <p>The object key of the newly created object.</p>
    @[Protocol::Field(location: :body, name: "Key", structure: false)]
    property key : String?
    # <p>If the object expiration is configured, this will contain the expiration date
    # (expiry-date) and rule ID (rule-id). The value of rule-id is URL encoded.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expiration", structure: false)]
    property expiration : String?
    # <p>Entity tag that identifies the newly created object's data. Objects with different
    # object data will have different entity tags. The entity tag is an opaque string. The entity
    # tag may or may not be an MD5 digest of the object data. If the entity tag is not an MD5
    # digest of the object data, it will contain one or more nonhexadecimal characters and/or
    # will consist of less than 32 or more than 32 hexadecimal digits.</p>
    @[Protocol::Field(location: :body, name: "ETag", structure: false)]
    property e_tag : String?
    # <p>If you specified server-side encryption either with an Amazon S3-managed encryption key or an
    # AWS KMS customer master key (CMK) in your initiate multipart upload request, the response
    # includes this header. It confirms the encryption algorithm that Amazon S3 used to encrypt the
    # object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption", structure: false)]
    property server_side_encryption : String?
    # <p>Version ID of the newly created object, in case the bucket has versioning turned
    # on.</p>
    @[Protocol::Field(location: :header, name: "x-amz-version-id", structure: false)]
    property version_id : String?
    # <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric
    # customer managed customer master key (CMK) that was used for the object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-aws-kms-key-id", structure: false)]
    property ssekms_key_id : String?
    # <p>Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption with AWS KMS (SSE-KMS).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-bucket-key-enabled", structure: false)]
    property bucket_key_enabled : Bool?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@location = nil , @bucket = nil , @key = nil , @expiration = nil , @e_tag = nil , @server_side_encryption = nil , @version_id = nil , @ssekms_key_id = nil , @bucket_key_enabled = nil , @request_charged = nil )
    end
  end

  class CopyObjectRequest
    include RestXML::Structure

    # <p>The canned ACL to apply to the object.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-acl", structure: false)]
    property acl : String?
    # <p>The name of the destination bucket.</p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Specifies caching behavior along the request/reply chain.</p>
    @[Protocol::Field(location: :header, name: "Cache-Control", structure: false)]
    property cache_control : String?
    # <p>Specifies presentational information for the object.</p>
    @[Protocol::Field(location: :header, name: "Content-Disposition", structure: false)]
    property content_disposition : String?
    # <p>Specifies what content encodings have been applied to the object and thus what decoding
    # mechanisms must be applied to obtain the media-type referenced by the Content-Type header
    # field.</p>
    @[Protocol::Field(location: :header, name: "Content-Encoding", structure: false)]
    property content_encoding : String?
    # <p>The language the content is in.</p>
    @[Protocol::Field(location: :header, name: "Content-Language", structure: false)]
    property content_language : String?
    # <p>A standard MIME type describing the format of the object data.</p>
    @[Protocol::Field(location: :header, name: "Content-Type", structure: false)]
    property content_type : String?
    # <p>Specifies the source object for the copy operation. You specify the value in one of two
    # formats, depending on whether you want to access the source object through an <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">access
    # point</a>:</p>
    # <ul>
    # <li>
    # <p>For objects not accessed through an access point, specify the name of the source
    # bucket and the key of the source object, separated by a slash (/). For example, to
    # copy the object <code>reports/january.pdf</code> from the bucket
    # <code>awsexamplebucket</code>, use
    # <code>awsexamplebucket/reports/january.pdf</code>. The value must be URL
    # encoded.</p>
    # </li>
    # <li>
    # <p>For objects accessed through access points, specify the Amazon Resource Name (ARN) of the object as accessed through the access point, in the format <code>arn:aws:s3:<Region>:<account-id>:accesspoint/<access-point-name>/object/<key></code>. For example, to copy the object <code>reports/january.pdf</code> through access point <code>my-access-point</code> owned by account <code>123456789012</code> in Region <code>us-west-2</code>, use the URL encoding of <code>arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/reports/january.pdf</code>. The value must be URL encoded.</p>
    # <note>
    # <p>Amazon S3 supports copy operations using access points only when the source and destination buckets are in the same AWS Region.</p>
    # </note>
    # <p>Alternatively, for objects accessed through Amazon S3 on Outposts, specify the ARN of the object as accessed in the format <code>arn:aws:s3-outposts:<Region>:<account-id>:outpost/<outpost-id>/object/<key></code>. For example, to copy the object <code>reports/january.pdf</code> through outpost <code>my-outpost</code> owned by account <code>123456789012</code> in Region <code>us-west-2</code>, use the URL encoding of <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/object/reports/january.pdf</code>. The value must be URL encoded.  </p>
    # </li>
    # </ul>
    # <p>To copy a specific version of an object, append <code>?versionId=<version-id></code>
    # to the value (for example,
    # <code>awsexamplebucket/reports/january.pdf?versionId=QUpfdndhfd8438MNFDN93jdnJFkdmqnh893</code>).
    # If you don't specify a version ID, Amazon S3 copies the latest version of the source
    # object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source", structure: false)]
    property copy_source : String
    # <p>Copies the object if its entity tag (ETag) matches the specified tag.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-if-match", structure: false)]
    property copy_source_if_match : String?
    # <p>Copies the object if it has been modified since the specified time.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-if-modified-since", structure: false)]
    property copy_source_if_modified_since : Time?
    # <p>Copies the object if its entity tag (ETag) is different than the specified ETag.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-if-none-match", structure: false)]
    property copy_source_if_none_match : String?
    # <p>Copies the object if it hasn't been modified since the specified time.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-if-unmodified-since", structure: false)]
    property copy_source_if_unmodified_since : Time?
    # <p>The date and time at which the object is no longer cacheable.</p>
    @[Protocol::Field(location: :header, name: "Expires", structure: false)]
    property expires : Time?
    # <p>Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the
    # object.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-full-control", structure: false)]
    property grant_full_control : String?
    # <p>Allows grantee to read the object data and its
    # metadata.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-read", structure: false)]
    property grant_read : String?
    # <p>Allows grantee to read the object ACL.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-read-acp", structure: false)]
    property grant_read_acp : String?
    # <p>Allows grantee to write the ACL for the applicable
    # object.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-write-acp", structure: false)]
    property grant_write_acp : String?
    # <p>The key of the destination object.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>A map of metadata to store with the object in S3.</p>
    @[Protocol::Field(location: :header_prefix, name: "x-amz-meta-", structure: false)]
    property metadata : Hash(String, String)?
    # <p>Specifies whether the metadata is copied from the source object or replaced with
    # metadata provided in the request.</p>
    @[Protocol::Field(location: :header, name: "x-amz-metadata-directive", structure: false)]
    property metadata_directive : String?
    # <p>Specifies whether the object tag-set are copied from the source object or replaced with
    # tag-set provided in the request.</p>
    @[Protocol::Field(location: :header, name: "x-amz-tagging-directive", structure: false)]
    property tagging_directive : String?
    # <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example,
    # AES256, aws:kms).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption", structure: false)]
    property server_side_encryption : String?
    # <p>By default, Amazon S3 uses the STANDARD Storage Class to store newly created objects. The
    # STANDARD storage class provides high durability and high availability. Depending on
    # performance needs, you can specify a different Storage Class. Amazon S3 on Outposts only uses
    # the OUTPOSTS Storage Class. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage Classes</a> in the <i>Amazon S3
    # Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :header, name: "x-amz-storage-class", structure: false)]
    property storage_class : String?
    # <p>If the bucket is configured as a website, redirects requests for this object to another
    # object in the same bucket or to an external URL. Amazon S3 stores the value of this header in
    # the object metadata.</p>
    @[Protocol::Field(location: :header, name: "x-amz-website-redirect-location", structure: false)]
    property website_redirect_location : String?
    # <p>Specifies the algorithm to use to when encrypting the object (for example,
    # AES256).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This
    # value is used to store the object and then it is discarded; Amazon S3 does not store the
    # encryption key. The key must be appropriate for use with the algorithm specified in the
    # <code>x-amz-server-side-encryption-customer-algorithm</code> header.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key", structure: false)]
    property sse_customer_key : String?
    # <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    # <p>Specifies the AWS KMS key ID to use for object encryption. All GET and PUT requests for
    # an object protected by AWS KMS will fail if not made via SSL or using SigV4. For
    # information about configuring using any of the officially supported AWS SDKs and AWS CLI,
    # see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version">Specifying the
    # Signature Version in Request Authentication</a> in the <i>Amazon S3 Developer
    # Guide</i>.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-aws-kms-key-id", structure: false)]
    property ssekms_key_id : String?
    # <p>Specifies the AWS KMS Encryption Context to use for object encryption. The value of this
    # header is a base64-encoded UTF-8 string holding JSON with the encryption context key-value
    # pairs.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-context", structure: false)]
    property ssekms_encryption_context : String?
    # <p>Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side encryption using AWS KMS (SSE-KMS). Setting this header to <code>true</code> causes Amazon S3 to use an S3 Bucket Key for object encryption with SSE-KMS. </p>
    # <p>Specifying this header with a COPY operation doesn’t affect bucket-level settings for S3 Bucket Key.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-bucket-key-enabled", structure: false)]
    property bucket_key_enabled : Bool?
    # <p>Specifies the algorithm to use when decrypting the source object (for example,
    # AES256).</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-server-side-encryption-customer-algorithm", structure: false)]
    property copy_source_sse_customer_algorithm : String?
    # <p>Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source
    # object. The encryption key provided in this header must be one that was used when the
    # source object was created.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-server-side-encryption-customer-key", structure: false)]
    property copy_source_sse_customer_key : String?
    # <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-server-side-encryption-customer-key-MD5", structure: false)]
    property copy_source_sse_customer_key_md5 : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The tag-set for the object destination object this value must be used in conjunction
    # with the <code>TaggingDirective</code>. The tag-set must be encoded as URL Query
    # parameters.</p>
    @[Protocol::Field(location: :header, name: "x-amz-tagging", structure: false)]
    property tagging : String?
    # <p>The Object Lock mode that you want to apply to the copied object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-mode", structure: false)]
    property object_lock_mode : String?
    # <p>The date and time when you want the copied object's Object Lock to expire.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-retain-until-date", structure: false)]
    property object_lock_retain_until_date : Time?
    # <p>Specifies whether you want to apply a Legal Hold to the copied object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-legal-hold", structure: false)]
    property object_lock_legal_hold_status : String?
    # <p>The account id of the expected destination bucket owner. If the destination bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?
    # <p>The account id of the expected source bucket owner. If the source bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-source-expected-bucket-owner", structure: false)]
    property expected_source_bucket_owner : String?

    def initialize(@bucket, @key, @copy_source, @acl = nil , @website_redirect_location = nil , @sse_customer_algorithm = nil , @sse_customer_key = nil , @sse_customer_key_md5 = nil , @ssekms_key_id = nil , @ssekms_encryption_context = nil , @bucket_key_enabled = nil , @copy_source_sse_customer_algorithm = nil , @copy_source_sse_customer_key = nil , @copy_source_sse_customer_key_md5 = nil , @request_payer = nil , @tagging = nil , @object_lock_mode = nil , @object_lock_retain_until_date = nil , @object_lock_legal_hold_status = nil , @expected_bucket_owner = nil , @storage_class = nil , @server_side_encryption = nil , @cache_control = nil , @content_disposition = nil , @content_encoding = nil , @content_language = nil , @content_type = nil , @copy_source_if_match = nil , @copy_source_if_modified_since = nil , @copy_source_if_none_match = nil , @copy_source_if_unmodified_since = nil , @expires = nil , @grant_full_control = nil , @grant_read = nil , @grant_read_acp = nil , @grant_write_acp = nil , @metadata = nil , @metadata_directive = nil , @tagging_directive = nil , @expected_source_bucket_owner = nil )
    end
  end

  class CopyObjectResultStruct
    include RestXML::Structure

    # <p>Returns the ETag of the new object. The ETag reflects only changes to the contents of an
    # object, not its metadata. The source and destination ETag is identical for a successfully
    # copied object.</p>
    @[Protocol::Field(location: :body, name: "ETag", structure: false)]
    property e_tag : String?
    # <p>Returns the date that the object was last modified.</p>
    @[Protocol::Field(location: :body, name: "LastModified", structure: false)]
    property last_modified : Time?

    def initialize(@e_tag = nil , @last_modified = nil )
    end
  end

  class CopyObjectOutput
    include RestXML::Structure

    # <p>Container for all response elements.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property copy_object_result : CopyObjectResultStruct?
    # <p>If the object expiration is configured, the response includes this header.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expiration", structure: false)]
    property expiration : String?
    # <p>Version of the copied object in the destination bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-version-id", structure: false)]
    property copy_source_version_id : String?
    # <p>Version ID of the newly created copy.</p>
    @[Protocol::Field(location: :header, name: "x-amz-version-id", structure: false)]
    property version_id : String?
    # <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example,
    # AES256, aws:kms).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption", structure: false)]
    property server_side_encryption : String?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header confirming the encryption algorithm used.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header to provide round-trip message integrity verification of
    # the customer-provided encryption key.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    # <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric
    # customer managed customer master key (CMK) that was used for the object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-aws-kms-key-id", structure: false)]
    property ssekms_key_id : String?
    # <p>If present, specifies the AWS KMS Encryption Context to use for object encryption. The
    # value of this header is a base64-encoded UTF-8 string holding JSON with the encryption
    # context key-value pairs.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-context", structure: false)]
    property ssekms_encryption_context : String?
    # <p>Indicates whether the copied object uses an S3 Bucket Key for server-side encryption with AWS KMS (SSE-KMS).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-bucket-key-enabled", structure: false)]
    property bucket_key_enabled : Bool?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@copy_object_result = nil , @expiration = nil , @copy_source_version_id = nil , @version_id = nil , @server_side_encryption = nil , @sse_customer_algorithm = nil , @sse_customer_key_md5 = nil , @ssekms_key_id = nil , @ssekms_encryption_context = nil , @bucket_key_enabled = nil , @request_charged = nil )
    end
  end

  class ObjectNotInActiveTierError < Exception
    include RestXML::Structure


    def initialize()
    end
  end

  class CreateBucketConfigurationStruct
    include RestXML::Structure

    # <p>Specifies the Region where the bucket will be created. If you don't specify a Region,
    # the bucket is created in the US East (N. Virginia) Region (us-east-1).</p>
    @[Protocol::Field(location: :body, name: "LocationConstraint", structure: false)]
    property location_constraint : String?

    def initialize(@location_constraint = nil )
    end
  end

  class CreateBucketRequest
    include RestXML::Structure

    # <p>The canned ACL to apply to the bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-acl", structure: false)]
    property acl : String?
    # <p>The name of the bucket to create.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The configuration information for the bucket.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property create_bucket_configuration : CreateBucketConfigurationStruct?
    # <p>Allows grantee the read, write, read ACP, and write ACP permissions on the
    # bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-full-control", structure: false)]
    property grant_full_control : String?
    # <p>Allows grantee to list the objects in the bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-read", structure: false)]
    property grant_read : String?
    # <p>Allows grantee to read the bucket ACL.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-read-acp", structure: false)]
    property grant_read_acp : String?
    # <p>Allows grantee to create, overwrite, and delete any object in the bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-write", structure: false)]
    property grant_write : String?
    # <p>Allows grantee to write the ACL for the applicable bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-write-acp", structure: false)]
    property grant_write_acp : String?
    # <p>Specifies whether you want S3 Object Lock to be enabled for the new bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-bucket-object-lock-enabled", structure: false)]
    property object_lock_enabled_for_bucket : Bool?

    def initialize(@bucket, @acl = nil , @create_bucket_configuration = nil , @grant_full_control = nil , @grant_read = nil , @grant_read_acp = nil , @grant_write = nil , @grant_write_acp = nil , @object_lock_enabled_for_bucket = nil )
    end
  end

  class CreateBucketOutput
    include RestXML::Structure

    # <p>Specifies the Region where the bucket will be created. If you are creating a bucket on
    # the US East (N. Virginia) Region (us-east-1), you do not need to specify the
    # location.</p>
    @[Protocol::Field(location: :header, name: "Location", structure: false)]
    property location : String?

    def initialize(@location = nil )
    end
  end

  class BucketAlreadyExists < Exception
    include RestXML::Structure


    def initialize()
    end
  end

  class BucketAlreadyOwnedByYou < Exception
    include RestXML::Structure


    def initialize()
    end
  end

  class CreateMultipartUploadRequest
    include RestXML::Structure

    # <p>The canned ACL to apply to the object.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-acl", structure: false)]
    property acl : String?
    # <p>The name of the bucket to which to initiate the upload</p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Specifies caching behavior along the request/reply chain.</p>
    @[Protocol::Field(location: :header, name: "Cache-Control", structure: false)]
    property cache_control : String?
    # <p>Specifies presentational information for the object.</p>
    @[Protocol::Field(location: :header, name: "Content-Disposition", structure: false)]
    property content_disposition : String?
    # <p>Specifies what content encodings have been applied to the object and thus what decoding
    # mechanisms must be applied to obtain the media-type referenced by the Content-Type header
    # field.</p>
    @[Protocol::Field(location: :header, name: "Content-Encoding", structure: false)]
    property content_encoding : String?
    # <p>The language the content is in.</p>
    @[Protocol::Field(location: :header, name: "Content-Language", structure: false)]
    property content_language : String?
    # <p>A standard MIME type describing the format of the object data.</p>
    @[Protocol::Field(location: :header, name: "Content-Type", structure: false)]
    property content_type : String?
    # <p>The date and time at which the object is no longer cacheable.</p>
    @[Protocol::Field(location: :header, name: "Expires", structure: false)]
    property expires : Time?
    # <p>Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the
    # object.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-full-control", structure: false)]
    property grant_full_control : String?
    # <p>Allows grantee to read the object data and its
    # metadata.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-read", structure: false)]
    property grant_read : String?
    # <p>Allows grantee to read the object ACL.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-read-acp", structure: false)]
    property grant_read_acp : String?
    # <p>Allows grantee to write the ACL for the applicable
    # object.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-write-acp", structure: false)]
    property grant_write_acp : String?
    # <p>Object key for which the multipart upload is to be initiated.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>A map of metadata to store with the object in S3.</p>
    @[Protocol::Field(location: :header_prefix, name: "x-amz-meta-", structure: false)]
    property metadata : Hash(String, String)?
    # <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example,
    # AES256, aws:kms).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption", structure: false)]
    property server_side_encryption : String?
    # <p>By default, Amazon S3 uses the STANDARD Storage Class to store newly created objects. The
    # STANDARD storage class provides high durability and high availability. Depending on
    # performance needs, you can specify a different Storage Class. Amazon S3 on Outposts only uses
    # the OUTPOSTS Storage Class. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage Classes</a> in the <i>Amazon S3
    # Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :header, name: "x-amz-storage-class", structure: false)]
    property storage_class : String?
    # <p>If the bucket is configured as a website, redirects requests for this object to another
    # object in the same bucket or to an external URL. Amazon S3 stores the value of this header in
    # the object metadata.</p>
    @[Protocol::Field(location: :header, name: "x-amz-website-redirect-location", structure: false)]
    property website_redirect_location : String?
    # <p>Specifies the algorithm to use to when encrypting the object (for example,
    # AES256).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This
    # value is used to store the object and then it is discarded; Amazon S3 does not store the
    # encryption key. The key must be appropriate for use with the algorithm specified in the
    # <code>x-amz-server-side-encryption-customer-algorithm</code> header.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key", structure: false)]
    property sse_customer_key : String?
    # <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    # <p>Specifies the ID of the symmetric customer managed AWS KMS CMK to use for object
    # encryption. All GET and PUT requests for an object protected by AWS KMS will fail if not
    # made via SSL or using SigV4. For information about configuring using any of the officially
    # supported AWS SDKs and AWS CLI, see <a href="https://docs.aws.amazon.com/http:/docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version">Specifying the Signature Version in Request Authentication</a>
    # in the <i>Amazon S3 Developer Guide</i>.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-aws-kms-key-id", structure: false)]
    property ssekms_key_id : String?
    # <p>Specifies the AWS KMS Encryption Context to use for object encryption. The value of this
    # header is a base64-encoded UTF-8 string holding JSON with the encryption context key-value
    # pairs.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-context", structure: false)]
    property ssekms_encryption_context : String?
    # <p>Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side encryption using AWS KMS (SSE-KMS). Setting this header to <code>true</code> causes Amazon S3 to use an S3 Bucket Key for object encryption with SSE-KMS.</p>
    # <p>Specifying this header with an object operation doesn’t affect bucket-level settings for S3 Bucket Key.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-bucket-key-enabled", structure: false)]
    property bucket_key_enabled : Bool?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The tag-set for the object. The tag-set must be encoded as URL Query parameters.</p>
    @[Protocol::Field(location: :header, name: "x-amz-tagging", structure: false)]
    property tagging : String?
    # <p>Specifies the Object Lock mode that you want to apply to the uploaded object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-mode", structure: false)]
    property object_lock_mode : String?
    # <p>Specifies the date and time when you want the Object Lock to expire.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-retain-until-date", structure: false)]
    property object_lock_retain_until_date : Time?
    # <p>Specifies whether you want to apply a Legal Hold to the uploaded object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-legal-hold", structure: false)]
    property object_lock_legal_hold_status : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @acl = nil , @object_lock_legal_hold_status = nil , @object_lock_retain_until_date = nil , @object_lock_mode = nil , @tagging = nil , @request_payer = nil , @bucket_key_enabled = nil , @ssekms_encryption_context = nil , @ssekms_key_id = nil , @sse_customer_key_md5 = nil , @sse_customer_key = nil , @sse_customer_algorithm = nil , @website_redirect_location = nil , @storage_class = nil , @server_side_encryption = nil , @metadata = nil , @grant_write_acp = nil , @grant_read_acp = nil , @grant_read = nil , @grant_full_control = nil , @expires = nil , @content_type = nil , @content_language = nil , @content_encoding = nil , @content_disposition = nil , @cache_control = nil , @expected_bucket_owner = nil )
    end
  end

  class CreateMultipartUploadOutput
    include RestXML::Structure

    # <p>If the bucket has a lifecycle rule configured with an action to abort incomplete
    # multipart uploads and the prefix in the lifecycle rule matches the object name in the
    # request, the response includes this header. The header indicates when the initiated
    # multipart upload becomes eligible for an abort operation. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config">
    # Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a>.</p>
    #
    # <p>The response also includes the <code>x-amz-abort-rule-id</code> header that provides the
    # ID of the lifecycle configuration rule that defines this action.</p>
    @[Protocol::Field(location: :header, name: "x-amz-abort-date", structure: false)]
    property abort_date : Time?
    # <p>This header is returned along with the <code>x-amz-abort-date</code> header. It
    # identifies the applicable lifecycle configuration rule that defines the action to abort
    # incomplete multipart uploads.</p>
    @[Protocol::Field(location: :header, name: "x-amz-abort-rule-id", structure: false)]
    property abort_rule_id : String?
    # <p>The name of the bucket to which the multipart upload was initiated. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "Bucket", structure: false)]
    property bucket : String?
    # <p>Object key for which the multipart upload was initiated.</p>
    @[Protocol::Field(location: :body, name: "Key", structure: false)]
    property key : String?
    # <p>ID for the initiated multipart upload.</p>
    @[Protocol::Field(location: :body, name: "UploadId", structure: false)]
    property upload_id : String?
    # <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example,
    # AES256, aws:kms).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption", structure: false)]
    property server_side_encryption : String?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header confirming the encryption algorithm used.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header to provide round-trip message integrity verification of
    # the customer-provided encryption key.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    # <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric
    # customer managed customer master key (CMK) that was used for the object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-aws-kms-key-id", structure: false)]
    property ssekms_key_id : String?
    # <p>If present, specifies the AWS KMS Encryption Context to use for object encryption. The
    # value of this header is a base64-encoded UTF-8 string holding JSON with the encryption
    # context key-value pairs.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-context", structure: false)]
    property ssekms_encryption_context : String?
    # <p>Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption with AWS KMS (SSE-KMS).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-bucket-key-enabled", structure: false)]
    property bucket_key_enabled : Bool?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@abort_date = nil , @abort_rule_id = nil , @bucket = nil , @key = nil , @upload_id = nil , @server_side_encryption = nil , @sse_customer_algorithm = nil , @sse_customer_key_md5 = nil , @ssekms_key_id = nil , @ssekms_encryption_context = nil , @bucket_key_enabled = nil , @request_charged = nil )
    end
  end

  class DeleteBucketRequest
    include RestXML::Structure

    # <p>Specifies the bucket being deleted.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class DeleteBucketAnalyticsConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket from which an analytics configuration is deleted.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ID that identifies the analytics configuration.</p>
    @[Protocol::Field(location: :query, name: "id", structure: false)]
    property id : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @id, @expected_bucket_owner = nil )
    end
  end

  class DeleteBucketCorsRequest
    include RestXML::Structure

    # <p>Specifies the bucket whose <code>cors</code> configuration is being deleted.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class DeleteBucketEncryptionRequest
    include RestXML::Structure

    # <p>The name of the bucket containing the server-side encryption configuration to
    # delete.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class DeleteBucketIntelligentTieringConfigurationRequest
    include RestXML::Structure

    # <p>The name of the Amazon S3 bucket whose configuration you want to modify or retrieve.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ID used to identify the S3 Intelligent-Tiering configuration.</p>
    @[Protocol::Field(location: :query, name: "id", structure: false)]
    property id : String

    def initialize(@bucket, @id)
    end
  end

  class DeleteBucketInventoryConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket containing the inventory configuration to delete.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ID used to identify the inventory configuration.</p>
    @[Protocol::Field(location: :query, name: "id", structure: false)]
    property id : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @id, @expected_bucket_owner = nil )
    end
  end

  class DeleteBucketLifecycleRequest
    include RestXML::Structure

    # <p>The bucket name of the lifecycle to delete.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class DeleteBucketMetricsConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket containing the metrics configuration to delete.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ID used to identify the metrics configuration.</p>
    @[Protocol::Field(location: :query, name: "id", structure: false)]
    property id : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @id, @expected_bucket_owner = nil )
    end
  end

  class DeleteBucketOwnershipControlsRequest
    include RestXML::Structure

    # <p>The Amazon S3 bucket whose <code>OwnershipControls</code> you want to delete. </p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class DeleteBucketPolicyRequest
    include RestXML::Structure

    # <p>The bucket name.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class DeleteBucketReplicationRequest
    include RestXML::Structure

    # <p> The bucket name. </p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class DeleteBucketTaggingRequest
    include RestXML::Structure

    # <p>The bucket that has the tag set to be removed.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class DeleteBucketWebsiteRequest
    include RestXML::Structure

    # <p>The bucket name for which you want to remove the website configuration. </p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class DeleteObjectRequest
    include RestXML::Structure

    # <p>The bucket name of the bucket containing the object. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Key name of the object to delete.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>The concatenation of the authentication device's serial number, a space, and the value
    # that is displayed on your authentication device. Required to permanently delete a versioned
    # object if versioning is configured with MFA delete enabled.</p>
    @[Protocol::Field(location: :header, name: "x-amz-mfa", structure: false)]
    property mfa : String?
    # <p>VersionId used to reference a specific version of the object.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>Indicates whether S3 Object Lock should bypass Governance-mode restrictions to process
    # this operation.</p>
    @[Protocol::Field(location: :header, name: "x-amz-bypass-governance-retention", structure: false)]
    property bypass_governance_retention : Bool?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @mfa = nil , @version_id = nil , @request_payer = nil , @bypass_governance_retention = nil , @expected_bucket_owner = nil )
    end
  end

  class DeleteObjectOutput
    include RestXML::Structure

    # <p>Specifies whether the versioned object that was permanently deleted was (true) or was
    # not (false) a delete marker.</p>
    @[Protocol::Field(location: :header, name: "x-amz-delete-marker", structure: false)]
    property delete_marker : Bool?
    # <p>Returns the version ID of the delete marker created as a result of the DELETE
    # operation.</p>
    @[Protocol::Field(location: :header, name: "x-amz-version-id", structure: false)]
    property version_id : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@delete_marker = nil , @version_id = nil , @request_charged = nil )
    end
  end

  class ObjectIdentifierStruct
    include RestXML::Structure

    # <p>Key name of the object to delete.</p>
    @[Protocol::Field(location: :body, name: "Key", structure: false)]
    property key : String
    # <p>VersionId for the specific version of the object to delete.</p>
    @[Protocol::Field(location: :body, name: "VersionId", structure: false)]
    property version_id : String?

    def initialize(@key, @version_id = nil )
    end
  end

  class DeleteStruct
    include RestXML::Structure

    # <p>The objects to delete.</p>
    @[Protocol::Field(location: :body, name: "Object", structure: false)]
    property objects : Array(ObjectIdentifierStruct)
    # <p>Element to enable quiet mode for the request. When you add this element, you must set
    # its value to true.</p>
    @[Protocol::Field(location: :body, name: "Quiet", structure: false)]
    property quiet : Bool?

    def initialize(@objects, @quiet = nil )
    end
  end

  class DeleteObjectsRequest
    include RestXML::Structure

    # <p>The bucket name containing the objects to delete. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Container for the request.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property delete : DeleteStruct
    # <p>The concatenation of the authentication device's serial number, a space, and the value
    # that is displayed on your authentication device. Required to permanently delete a versioned
    # object if versioning is configured with MFA delete enabled.</p>
    @[Protocol::Field(location: :header, name: "x-amz-mfa", structure: false)]
    property mfa : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>Specifies whether you want to delete this object even if it has a Governance-type Object
    # Lock in place. You must have sufficient permissions to perform this operation.</p>
    @[Protocol::Field(location: :header, name: "x-amz-bypass-governance-retention", structure: false)]
    property bypass_governance_retention : Bool?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @delete, @mfa = nil , @request_payer = nil , @bypass_governance_retention = nil , @expected_bucket_owner = nil )
    end
  end

  class DeletedObjectStruct
    include RestXML::Structure

    # <p>The name of the deleted object.</p>
    @[Protocol::Field(location: :body, name: "Key", structure: false)]
    property key : String?
    # <p>The version ID of the deleted object.</p>
    @[Protocol::Field(location: :body, name: "VersionId", structure: false)]
    property version_id : String?
    # <p>Specifies whether the versioned object that was permanently deleted was (true) or was
    # not (false) a delete marker. In a simple DELETE, this header indicates whether (true) or
    # not (false) a delete marker was created.</p>
    @[Protocol::Field(location: :body, name: "DeleteMarker", structure: false)]
    property delete_marker : Bool?
    # <p>The version ID of the delete marker created as a result of the DELETE operation. If you
    # delete a specific object version, the value returned by this header is the version ID of
    # the object version deleted.</p>
    @[Protocol::Field(location: :body, name: "DeleteMarkerVersionId", structure: false)]
    property delete_marker_version_id : String?

    def initialize(@key = nil , @version_id = nil , @delete_marker = nil , @delete_marker_version_id = nil )
    end
  end

  class ErrorStruct
    include RestXML::Structure

    # <p>The error key.</p>
    @[Protocol::Field(location: :body, name: "Key", structure: false)]
    property key : String?
    # <p>The version ID of the error.</p>
    @[Protocol::Field(location: :body, name: "VersionId", structure: false)]
    property version_id : String?
    # <p>The error code is a string that uniquely identifies an error condition. It is meant to
    # be read and understood by programs that detect and handle errors by type. </p>
    # <p class="title">
    # <b>Amazon S3 error codes</b>
    # </p>
    # <ul>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> AccessDenied </p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Access Denied</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 403 Forbidden</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> AccountProblem</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> There is a problem with your AWS account
    # that prevents the operation from completing successfully. Contact AWS Support
    # for further assistance.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 403 Forbidden</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> AllAccessDisabled</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> All access to this Amazon S3 resource has been
    # disabled. Contact AWS Support for further assistance.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 403 Forbidden</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> AmbiguousGrantByEmailAddress</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The email address you provided is
    # associated with more than one account.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> AuthorizationHeaderMalformed</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The authorization header you provided is
    # invalid.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> N/A</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> BadDigest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The Content-MD5 you specified did not
    # match what we received.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> BucketAlreadyExists</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The requested bucket name is not
    # available. The bucket namespace is shared by all users of the system. Please
    # select a different name and try again.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 409 Conflict</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> BucketAlreadyOwnedByYou</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The bucket you tried to create already
    # exists, and you own it. Amazon S3 returns this error in all AWS Regions except in
    # the North Virginia Region. For legacy compatibility, if you re-create an
    # existing bucket that you already own in the North Virginia Region, Amazon S3 returns
    # 200 OK and resets the bucket access control lists (ACLs).</p>
    # </li>
    # <li>
    # <p>
    # <i>Code:</i> 409 Conflict (in all Regions except the North
    # Virginia Region) </p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> BucketNotEmpty</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The bucket you tried to delete is not
    # empty.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 409 Conflict</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> CredentialsNotSupported</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> This request does not support
    # credentials.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> CrossLocationLoggingProhibited</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Cross-location logging not allowed.
    # Buckets in one geographic location cannot log information to a bucket in
    # another location.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 403 Forbidden</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> EntityTooSmall</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Your proposed upload is smaller than the
    # minimum allowed object size.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> EntityTooLarge</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Your proposed upload exceeds the maximum
    # allowed object size.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> ExpiredToken</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The provided token has expired.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> IllegalVersioningConfigurationException </p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Indicates that the versioning
    # configuration specified in the request is invalid.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> IncompleteBody</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> You did not provide the number of bytes
    # specified by the Content-Length HTTP header</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> IncorrectNumberOfFilesInPostRequest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> POST requires exactly one file upload per
    # request.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InlineDataTooLarge</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Inline data exceeds the maximum allowed
    # size.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InternalError</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> We encountered an internal error. Please
    # try again.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 500 Internal Server Error</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Server</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidAccessKeyId</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The AWS access key ID you provided does
    # not exist in our records.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 403 Forbidden</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidAddressingHeader</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> You must specify the Anonymous
    # role.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> N/A</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidArgument</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Invalid Argument</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidBucketName</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The specified bucket is not valid.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidBucketState</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The request is not valid with the current
    # state of the bucket.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 409 Conflict</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidDigest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The Content-MD5 you specified is not
    # valid.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidEncryptionAlgorithmError</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The encryption request you specified is
    # not valid. The valid value is AES256.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidLocationConstraint</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The specified location constraint is not
    # valid. For more information about Regions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html#access-bucket-intro">How to Select a
    # Region for Your Buckets</a>. </p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidObjectState</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The operation is not valid for the current
    # state of the object.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 403 Forbidden</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidPart</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> One or more of the specified parts could
    # not be found. The part might not have been uploaded, or the specified entity
    # tag might not have matched the part's entity tag.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidPartOrder</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The list of parts was not in ascending
    # order. Parts list must be specified in order by part number.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidPayer</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> All access to this object has been
    # disabled. Please contact AWS Support for further assistance.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 403 Forbidden</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidPolicyDocument</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The content of the form does not meet the
    # conditions specified in the policy document.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidRange</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The requested range cannot be
    # satisfied.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 416 Requested Range Not
    # Satisfiable</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidRequest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Please use AWS4-HMAC-SHA256.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>Code:</i> N/A</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidRequest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> SOAP requests must be made over an HTTPS
    # connection.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidRequest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Amazon S3 Transfer Acceleration is not
    # supported for buckets with non-DNS compliant names.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>Code:</i> N/A</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidRequest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Amazon S3 Transfer Acceleration is not
    # supported for buckets with periods (.) in their names.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>Code:</i> N/A</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidRequest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Amazon S3 Transfer Accelerate endpoint only
    # supports virtual style requests.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>Code:</i> N/A</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidRequest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Amazon S3 Transfer Accelerate is not configured
    # on this bucket.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>Code:</i> N/A</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidRequest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Amazon S3 Transfer Accelerate is disabled on
    # this bucket.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>Code:</i> N/A</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidRequest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Amazon S3 Transfer Acceleration is not
    # supported on this bucket. Contact AWS Support for more information.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>Code:</i> N/A</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidRequest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Amazon S3 Transfer Acceleration cannot be
    # enabled on this bucket. Contact AWS Support for more information.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>Code:</i> N/A</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidSecurity</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The provided security credentials are not
    # valid.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 403 Forbidden</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidSOAPRequest</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The SOAP request body is invalid.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidStorageClass</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The storage class you specified is not
    # valid.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidTargetBucketForLogging</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The target bucket for logging does not
    # exist, is not owned by you, or does not have the appropriate grants for the
    # log-delivery group. </p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidToken</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The provided token is malformed or
    # otherwise invalid.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> InvalidURI</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Couldn't parse the specified URI.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> KeyTooLongError</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Your key is too long.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> MalformedACLError</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The XML you provided was not well-formed
    # or did not validate against our published schema.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> MalformedPOSTRequest </p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The body of your POST request is not
    # well-formed multipart/form-data.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> MalformedXML</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> This happens when the user sends malformed
    # XML (XML that doesn't conform to the published XSD) for the configuration. The
    # error message is, "The XML you provided was not well-formed or did not validate
    # against our published schema." </p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> MaxMessageLengthExceeded</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Your request was too big.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> MaxPostPreDataLengthExceededError</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Your POST request fields preceding the
    # upload file were too large.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> MetadataTooLarge</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Your metadata headers exceed the maximum
    # allowed metadata size.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> MethodNotAllowed</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The specified method is not allowed
    # against this resource.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 405 Method Not Allowed</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> MissingAttachment</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> A SOAP attachment was expected, but none
    # were found.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> N/A</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> MissingContentLength</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> You must provide the Content-Length HTTP
    # header.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 411 Length Required</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> MissingRequestBodyError</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> This happens when the user sends an empty
    # XML document as a request. The error message is, "Request body is empty."
    # </p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> MissingSecurityElement</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The SOAP 1.1 request is missing a security
    # element.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> MissingSecurityHeader</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Your request is missing a required
    # header.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> NoLoggingStatusForKey</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> There is no such thing as a logging status
    # subresource for a key.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> NoSuchBucket</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The specified bucket does not
    # exist.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 404 Not Found</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> NoSuchBucketPolicy</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The specified bucket does not have a
    # bucket policy.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 404 Not Found</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> NoSuchKey</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The specified key does not exist.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 404 Not Found</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> NoSuchLifecycleConfiguration</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The lifecycle configuration does not
    # exist. </p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 404 Not Found</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> NoSuchUpload</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The specified multipart upload does not
    # exist. The upload ID might be invalid, or the multipart upload might have been
    # aborted or completed.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 404 Not Found</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> NoSuchVersion </p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Indicates that the version ID specified in
    # the request does not match an existing version.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 404 Not Found</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> NotImplemented</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> A header you provided implies
    # functionality that is not implemented.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 501 Not Implemented</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Server</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> NotSignedUp</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Your account is not signed up for the Amazon S3
    # service. You must sign up before you can use Amazon S3. You can sign up at the
    # following URL: https://aws.amazon.com/s3</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 403 Forbidden</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> OperationAborted</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> A conflicting conditional operation is
    # currently in progress against this resource. Try again.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 409 Conflict</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> PermanentRedirect</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The bucket you are attempting to access
    # must be addressed using the specified endpoint. Send all future requests to
    # this endpoint.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 301 Moved Permanently</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> PreconditionFailed</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> At least one of the preconditions you
    # specified did not hold.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 412 Precondition Failed</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> Redirect</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Temporary redirect.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 307 Moved Temporarily</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> RestoreAlreadyInProgress</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Object restore is already in
    # progress.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 409 Conflict</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> RequestIsNotMultiPartContent</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Bucket POST must be of the enclosure-type
    # multipart/form-data.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> RequestTimeout</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Your socket connection to the server was
    # not read from or written to within the timeout period.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> RequestTimeTooSkewed</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The difference between the request time
    # and the server's time is too large.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 403 Forbidden</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> RequestTorrentOfBucketError</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Requesting the torrent file of a bucket is
    # not permitted.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> SignatureDoesNotMatch</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The request signature we calculated does
    # not match the signature you provided. Check your AWS secret access key and
    # signing method. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html">REST Authentication</a> and
    # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/SOAPAuthentication.html">SOAP Authentication</a>
    # for details.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 403 Forbidden</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> ServiceUnavailable</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Reduce your request rate.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 503 Service Unavailable</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Server</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> SlowDown</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> Reduce your request rate.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 503 Slow Down</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Server</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> TemporaryRedirect</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> You are being redirected to the bucket
    # while DNS updates.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 307 Moved Temporarily</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> TokenRefreshRequired</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The provided token must be
    # refreshed.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> TooManyBuckets</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> You have attempted to create more buckets
    # than allowed.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> UnexpectedContent</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> This request does not support
    # content.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> UnresolvableGrantByEmailAddress</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The email address you provided does not
    # match any account on record.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # <li>
    # <ul>
    # <li>
    # <p>
    # <i>Code:</i> UserKeyMustBeSpecified</p>
    # </li>
    # <li>
    # <p>
    # <i>Description:</i> The bucket POST must contain the specified
    # field name. If it is specified, check the order of the fields.</p>
    # </li>
    # <li>
    # <p>
    # <i>HTTP Status Code:</i> 400 Bad Request</p>
    # </li>
    # <li>
    # <p>
    # <i>SOAP Fault Code Prefix:</i> Client</p>
    # </li>
    # </ul>
    # </li>
    # </ul>
    # <p></p>
    @[Protocol::Field(location: :body, name: "Code", structure: false)]
    property code : String?
    # <p>The error message contains a generic description of the error condition in English. It
    # is intended for a human audience. Simple programs display the message directly to the end
    # user if they encounter an error condition they don't know how or don't care to handle.
    # Sophisticated programs with more exhaustive error handling and proper internationalization
    # are more likely to ignore the error message.</p>
    @[Protocol::Field(location: :body, name: "Message", structure: false)]
    property message : String?

    def initialize(@key = nil , @version_id = nil , @code = nil , @message = nil )
    end
  end

  class DeleteObjectsOutput
    include RestXML::Structure

    # <p>Container element for a successful delete. It identifies the object that was
    # successfully deleted.</p>
    @[Protocol::Field(location: :body, name: "Deleted", structure: false)]
    property deleted : Array(DeletedObjectStruct)?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?
    # <p>Container for a failed delete operation that describes the object that Amazon S3 attempted to
    # delete and the error it encountered.</p>
    @[Protocol::Field(location: :body, name: "Error", structure: false)]
    property errors : Array(ErrorStruct)?

    def initialize(@deleted = nil , @request_charged = nil , @errors = nil )
    end
  end

  class DeleteObjectTaggingRequest
    include RestXML::Structure

    # <p>The bucket name containing the objects from which to remove the tags. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Name of the object key.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>The versionId of the object that the tag-set will be removed from.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @version_id = nil , @expected_bucket_owner = nil )
    end
  end

  class DeleteObjectTaggingOutput
    include RestXML::Structure

    # <p>The versionId of the object the tag-set was removed from.</p>
    @[Protocol::Field(location: :header, name: "x-amz-version-id", structure: false)]
    property version_id : String?

    def initialize(@version_id = nil )
    end
  end

  class DeletePublicAccessBlockRequest
    include RestXML::Structure

    # <p>The Amazon S3 bucket whose <code>PublicAccessBlock</code> configuration you want to delete.
    # </p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class GetBucketAccelerateConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket for which the accelerate configuration is retrieved.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class GetBucketAccelerateConfigurationOutput
    include RestXML::Structure

    # <p>The accelerate configuration of the bucket.</p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String?

    def initialize(@status = nil )
    end
  end

  class GetBucketAclRequest
    include RestXML::Structure

    # <p>Specifies the S3 bucket whose ACL is being requested.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class OwnerStruct
    include RestXML::Structure

    # <p>Container for the display name of the owner.</p>
    @[Protocol::Field(location: :body, name: "DisplayName", structure: false)]
    property display_name : String?
    # <p>Container for the ID of the owner.</p>
    @[Protocol::Field(location: :body, name: "ID", structure: false)]
    property id : String?

    def initialize(@display_name = nil , @id = nil )
    end
  end

  class GranteeStruct
    include RestXML::Structure

    # <p>Screen name of the grantee.</p>
    @[Protocol::Field(location: :body, name: "DisplayName", structure: false)]
    property display_name : String?
    # <p>Email address of the grantee.</p>
    # <note>
    # <p>Using email addresses to specify a grantee is only supported in the following AWS Regions: </p>
    # <ul>
    # <li>
    # <p>US East (N. Virginia)</p>
    # </li>
    # <li>
    # <p>US West (N. California)</p>
    # </li>
    # <li>
    # <p> US West (Oregon)</p>
    # </li>
    # <li>
    # <p> Asia Pacific (Singapore)</p>
    # </li>
    # <li>
    # <p>Asia Pacific (Sydney)</p>
    # </li>
    # <li>
    # <p>Asia Pacific (Tokyo)</p>
    # </li>
    # <li>
    # <p>Europe (Ireland)</p>
    # </li>
    # <li>
    # <p>South America (São Paulo)</p>
    # </li>
    # </ul>
    # <p>For a list of all the Amazon S3 supported Regions and endpoints, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions and Endpoints</a> in the AWS General Reference.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "EmailAddress", structure: false)]
    property email_address : String?
    # <p>The canonical user ID of the grantee.</p>
    @[Protocol::Field(location: :body, name: "ID", structure: false)]
    property id : String?
    # <p>URI of the grantee group.</p>
    @[Protocol::Field(location: :body, name: "URI", structure: false)]
    property uri : String?
    # <p>Type of grantee</p>
    @[Protocol::Field(location: :body, name: "xsi:type", structure: false)]
    property type : String

    def initialize(@type, @display_name = nil , @email_address = nil , @id = nil , @uri = nil )
    end
  end

  class GrantStruct
    include RestXML::Structure

    # <p>The person being granted permissions.</p>
    @[Protocol::Field(location: :body, name: "Grantee", structure: true)]
    property grantee : GranteeStruct?
    # <p>Specifies the permission given to the grantee.</p>
    @[Protocol::Field(location: :body, name: "Permission", structure: false)]
    property permission : String?

    def initialize(@grantee = nil , @permission = nil )
    end
  end

  class GetBucketAclOutput
    include RestXML::Structure

    # <p>Container for the bucket owner's display name and ID.</p>
    @[Protocol::Field(location: :body, name: "Owner", structure: true)]
    property owner : OwnerStruct?
    # <p>A list of grants.</p>
    @[Protocol::Field(location: :body, name: "AccessControlList", structure: false)]
    property grants : Array(GrantStruct)?

    def initialize(@owner = nil , @grants = nil )
    end
  end

  class GetBucketAnalyticsConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket from which an analytics configuration is retrieved.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ID that identifies the analytics configuration.</p>
    @[Protocol::Field(location: :query, name: "id", structure: false)]
    property id : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @id, @expected_bucket_owner = nil )
    end
  end

  class TagStruct
    include RestXML::Structure

    # <p>Name of the object key.</p>
    @[Protocol::Field(location: :body, name: "Key", structure: false)]
    property key : String
    # <p>Value of the tag.</p>
    @[Protocol::Field(location: :body, name: "Value", structure: false)]
    property value : String

    def initialize(@key, @value)
    end
  end

  class AnalyticsAndOperatorStruct
    include RestXML::Structure

    # <p>The prefix to use when evaluating an AND predicate: The prefix that an object must have
    # to be included in the metrics results.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    # <p>The list of tags to use when evaluating an AND predicate.</p>
    @[Protocol::Field(location: :body, name: "Tag", structure: false)]
    property tags : Array(TagStruct)?

    def initialize(@prefix = nil , @tags = nil )
    end
  end

  class AnalyticsS3BucketDestinationStruct
    include RestXML::Structure

    # <p>Specifies the file format used when exporting data to Amazon S3.</p>
    @[Protocol::Field(location: :body, name: "Format", structure: false)]
    property format : String
    # <p>The account ID that owns the destination S3 bucket. If no account ID is provided, the
    # owner is not validated before exporting data.</p>
    # <note>
    # <p> Although this value is optional, we strongly recommend that you set it to help
    # prevent problems if the destination bucket ownership changes. </p>
    # </note>
    @[Protocol::Field(location: :body, name: "BucketAccountId", structure: false)]
    property bucket_account_id : String?
    # <p>The Amazon Resource Name (ARN) of the bucket to which data is exported.</p>
    @[Protocol::Field(location: :body, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The prefix to use when exporting data. The prefix is prepended to all results.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?

    def initialize(@format, @bucket, @bucket_account_id = nil , @prefix = nil )
    end
  end

  class AnalyticsExportDestinationStruct
    include RestXML::Structure

    # <p>A destination signifying output to an S3 bucket.</p>
    @[Protocol::Field(location: :body, name: "S3BucketDestination", structure: true)]
    property s3_bucket_destination : AnalyticsS3BucketDestinationStruct

    def initialize(@s3_bucket_destination)
    end
  end

  class StorageClassAnalysisDataExportStruct
    include RestXML::Structure

    # <p>The version of the output schema to use when exporting data. Must be
    # <code>V_1</code>.</p>
    @[Protocol::Field(location: :body, name: "OutputSchemaVersion", structure: false)]
    property output_schema_version : String
    # <p>The place to store the data for an analysis.</p>
    @[Protocol::Field(location: :body, name: "Destination", structure: true)]
    property destination : AnalyticsExportDestinationStruct

    def initialize(@output_schema_version, @destination)
    end
  end

  class StorageClassAnalysisStruct
    include RestXML::Structure

    # <p>Specifies how data related to the storage class analysis for an Amazon S3 bucket should be
    # exported.</p>
    @[Protocol::Field(location: :body, name: "DataExport", structure: true)]
    property data_export : StorageClassAnalysisDataExportStruct?

    def initialize(@data_export = nil )
    end
  end

  class AnalyticsConfigurationStruct
    include RestXML::Structure

    # <p>The ID that identifies the analytics configuration.</p>
    @[Protocol::Field(location: :body, name: "Id", structure: false)]
    property id : String
    # <p>The filter used to describe a set of objects for analyses. A filter must have exactly
    # one prefix, one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided,
    # all objects will be considered in any analysis.</p>
    @[Protocol::Field(location: :body, name: "Filter", structure: false)]
    property filter : AnalyticsFilterStruct?
    # <p> Contains data related to access patterns to be collected and made available to analyze
    # the tradeoffs between different storage classes. </p>
    @[Protocol::Field(location: :body, name: "StorageClassAnalysis", structure: true)]
    property storage_class_analysis : StorageClassAnalysisStruct

    def initialize(@id, @storage_class_analysis, @filter = nil )
    end
  end

  class GetBucketAnalyticsConfigurationOutput
    include RestXML::Structure

    # <p>The configuration and any analyses for the analytics filter.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property analytics_configuration : AnalyticsConfigurationStruct?

    def initialize(@analytics_configuration = nil )
    end
  end

  class GetBucketCorsRequest
    include RestXML::Structure

    # <p>The bucket name for which to get the cors configuration.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class CORSRuleStruct
    include RestXML::Structure

    # <p>Headers that are specified in the <code>Access-Control-Request-Headers</code> header.
    # These headers are allowed in a preflight OPTIONS request. In response to any preflight
    # OPTIONS request, Amazon S3 returns any requested headers that are allowed.</p>
    @[Protocol::Field(location: :body, name: "AllowedHeader", structure: false)]
    property allowed_headers : Array(String)?
    # <p>An HTTP method that you allow the origin to execute. Valid values are <code>GET</code>,
    # <code>PUT</code>, <code>HEAD</code>, <code>POST</code>, and <code>DELETE</code>.</p>
    @[Protocol::Field(location: :body, name: "AllowedMethod", structure: false)]
    property allowed_methods : Array(String)
    # <p>One or more origins you want customers to be able to access the bucket from.</p>
    @[Protocol::Field(location: :body, name: "AllowedOrigin", structure: false)]
    property allowed_origins : Array(String)
    # <p>One or more headers in the response that you want customers to be able to access from
    # their applications (for example, from a JavaScript <code>XMLHttpRequest</code>
    # object).</p>
    @[Protocol::Field(location: :body, name: "ExposeHeader", structure: false)]
    property expose_headers : Array(String)?
    # <p>The time in seconds that your browser is to cache the preflight response for the
    # specified resource.</p>
    @[Protocol::Field(location: :body, name: "MaxAgeSeconds", structure: false)]
    property max_age_seconds : Int32?

    def initialize(@allowed_methods, @allowed_origins, @allowed_headers = nil , @expose_headers = nil , @max_age_seconds = nil )
    end
  end

  class GetBucketCorsOutput
    include RestXML::Structure

    # <p>A set of origins and methods (cross-origin access that you want to allow). You can add
    # up to 100 rules to the configuration.</p>
    @[Protocol::Field(location: :body, name: "CORSRule", structure: false)]
    property cors_rules : Array(CORSRuleStruct)?

    def initialize(@cors_rules = nil )
    end
  end

  class GetBucketEncryptionRequest
    include RestXML::Structure

    # <p>The name of the bucket from which the server-side encryption configuration is
    # retrieved.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class ServerSideEncryptionByDefaultStruct
    include RestXML::Structure

    # <p>Server-side encryption algorithm to use for the default encryption.</p>
    @[Protocol::Field(location: :body, name: "SSEAlgorithm", structure: false)]
    property sse_algorithm : String
    # <p>AWS Key Management Service (KMS) customer master key ID to use for the default
    # encryption. This parameter is allowed if and only if <code>SSEAlgorithm</code> is set to
    # <code>aws:kms</code>.</p>
    # <p>You can specify the key ID or the Amazon Resource Name (ARN) of the CMK. However, if you
    # are using encryption with cross-account operations, you must use a fully qualified CMK ARN.
    # For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html#bucket-encryption-update-bucket-policy">Using encryption for cross-account operations</a>. </p>
    # <p>
    # <b>For example:</b>
    # </p>
    # <ul>
    # <li>
    # <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
    # </p>
    # </li>
    # <li>
    # <p>Key ARN:
    # <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
    # </p>
    # </li>
    # </ul>
    # <important>
    # <p>Amazon S3 only supports symmetric CMKs and not asymmetric CMKs. For more information, see
    # <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and
    # Asymmetric Keys</a> in the <i>AWS Key Management Service Developer
    # Guide</i>.</p>
    # </important>
    @[Protocol::Field(location: :body, name: "KMSMasterKeyID", structure: false)]
    property kms_master_key_id : String?

    def initialize(@sse_algorithm, @kms_master_key_id = nil )
    end
  end

  class ServerSideEncryptionRuleStruct
    include RestXML::Structure

    # <p>Specifies the default server-side encryption to apply to new objects in the bucket. If a
    # PUT Object request doesn't specify any server-side encryption, this default encryption will
    # be applied.</p>
    @[Protocol::Field(location: :body, name: "ApplyServerSideEncryptionByDefault", structure: true)]
    property apply_server_side_encryption_by_default : ServerSideEncryptionByDefaultStruct?
    # <p>Specifies whether Amazon S3 should use an S3 Bucket Key with server-side encryption using KMS (SSE-KMS) for new objects in the bucket. Existing objects are not affected. Setting the <code>BucketKeyEnabled</code> element to <code>true</code> causes Amazon S3 to use an S3 Bucket Key. By default, S3 Bucket Key is not enabled.</p>
    # <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html">Amazon S3 Bucket Keys</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "BucketKeyEnabled", structure: false)]
    property bucket_key_enabled : Bool?

    def initialize(@apply_server_side_encryption_by_default = nil , @bucket_key_enabled = nil )
    end
  end

  class ServerSideEncryptionConfigurationStruct
    include RestXML::Structure

    # <p>Container for information about a particular server-side encryption configuration
    # rule.</p>
    @[Protocol::Field(location: :body, name: "Rule", structure: false)]
    property rules : Array(ServerSideEncryptionRuleStruct)

    def initialize(@rules)
    end
  end

  class GetBucketEncryptionOutput
    include RestXML::Structure

    #
    @[Protocol::Field(location: :body_io, structure: true)]
    property server_side_encryption_configuration : ServerSideEncryptionConfigurationStruct?

    def initialize(@server_side_encryption_configuration = nil )
    end
  end

  class GetBucketIntelligentTieringConfigurationRequest
    include RestXML::Structure

    # <p>The name of the Amazon S3 bucket whose configuration you want to modify or retrieve.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ID used to identify the S3 Intelligent-Tiering configuration.</p>
    @[Protocol::Field(location: :query, name: "id", structure: false)]
    property id : String

    def initialize(@bucket, @id)
    end
  end

  class IntelligentTieringAndOperatorStruct
    include RestXML::Structure

    # <p>An object key name prefix that identifies the subset of objects to which the
    # configuration applies.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    # <p>All of these tags must exist in the object's tag set in order for the configuration to
    # apply.</p>
    @[Protocol::Field(location: :body, name: "Tag", structure: false)]
    property tags : Array(TagStruct)?

    def initialize(@prefix = nil , @tags = nil )
    end
  end

  class IntelligentTieringFilterStruct
    include RestXML::Structure

    # <p>An object key name prefix that identifies the subset of objects to which the rule
    # applies.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    #
    @[Protocol::Field(location: :body, name: "Tag", structure: true)]
    property tag : TagStruct?
    # <p>A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter.
    # The operator must have at least two predicates, and an object must match all of the
    # predicates in order for the filter to apply.</p>
    @[Protocol::Field(location: :body, name: "And", structure: true)]
    property and : IntelligentTieringAndOperatorStruct?

    def initialize(@prefix = nil , @tag = nil , @and = nil )
    end
  end

  class TieringStruct
    include RestXML::Structure

    # <p>The number of consecutive days of no access after which an object will be eligible to be
    # transitioned to the corresponding tier. The minimum number of days specified for
    # Archive Access tier must be at least 90 days and Deep Archive Access tier must be at least
    # 180 days. The maximum can be up to 2 years (730 days).</p>
    @[Protocol::Field(location: :body, name: "Days", structure: false)]
    property days : Int32
    # <p>S3 Intelligent-Tiering access tier. See <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access">Storage class for
    # automatically optimizing frequently and infrequently accessed objects</a> for a list
    # of access tiers in the S3 Intelligent-Tiering storage class.</p>
    @[Protocol::Field(location: :body, name: "AccessTier", structure: false)]
    property access_tier : String

    def initialize(@days, @access_tier)
    end
  end

  class IntelligentTieringConfigurationStruct
    include RestXML::Structure

    # <p>The ID used to identify the S3 Intelligent-Tiering configuration.</p>
    @[Protocol::Field(location: :body, name: "Id", structure: false)]
    property id : String
    # <p>Specifies a bucket filter. The configuration only includes objects that meet the
    # filter's criteria.</p>
    @[Protocol::Field(location: :body, name: "Filter", structure: true)]
    property filter : IntelligentTieringFilterStruct?
    # <p>Specifies the status of the configuration.</p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String
    # <p>Specifies the S3 Intelligent-Tiering storage class tier of the configuration.</p>
    @[Protocol::Field(location: :body, name: "Tiering", structure: false)]
    property tierings : Array(TieringStruct)

    def initialize(@id, @status, @tierings, @filter = nil )
    end
  end

  class GetBucketIntelligentTieringConfigurationOutput
    include RestXML::Structure

    # <p>Container for S3 Intelligent-Tiering configuration.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property intelligent_tiering_configuration : IntelligentTieringConfigurationStruct?

    def initialize(@intelligent_tiering_configuration = nil )
    end
  end

  class GetBucketInventoryConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket containing the inventory configuration to retrieve.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ID used to identify the inventory configuration.</p>
    @[Protocol::Field(location: :query, name: "id", structure: false)]
    property id : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @id, @expected_bucket_owner = nil )
    end
  end

  class SSES3Struct
    include RestXML::Structure


    def initialize()
    end
  end

  class SSEKMSStruct
    include RestXML::Structure

    # <p>Specifies the ID of the AWS Key Management Service (AWS KMS) symmetric customer managed
    # customer master key (CMK) to use for encrypting inventory reports.</p>
    @[Protocol::Field(location: :body, name: "KeyId", structure: false)]
    property key_id : String

    def initialize(@key_id)
    end
  end

  class InventoryEncryptionStruct
    include RestXML::Structure

    # <p>Specifies the use of SSE-S3 to encrypt delivered inventory reports.</p>
    @[Protocol::Field(location: :body, name: "SSE-S3", structure: true)]
    property sses3 : SSES3Struct?
    # <p>Specifies the use of SSE-KMS to encrypt delivered inventory reports.</p>
    @[Protocol::Field(location: :body, name: "SSE-KMS", structure: true)]
    property ssekms : SSEKMSStruct?

    def initialize(@sses3 = nil , @ssekms = nil )
    end
  end

  class InventoryS3BucketDestinationStruct
    include RestXML::Structure

    # <p>The account ID that owns the destination S3 bucket. If no account ID is provided, the
    # owner is not validated before exporting data. </p>
    # <note>
    # <p> Although this value is optional, we strongly recommend that you set it to help
    # prevent problems if the destination bucket ownership changes. </p>
    # </note>
    @[Protocol::Field(location: :body, name: "AccountId", structure: false)]
    property account_id : String?
    # <p>The Amazon Resource Name (ARN) of the bucket where inventory results will be
    # published.</p>
    @[Protocol::Field(location: :body, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Specifies the output format of the inventory results.</p>
    @[Protocol::Field(location: :body, name: "Format", structure: false)]
    property format : String
    # <p>The prefix that is prepended to all inventory results.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    # <p>Contains the type of server-side encryption used to encrypt the inventory
    # results.</p>
    @[Protocol::Field(location: :body, name: "Encryption", structure: true)]
    property encryption : InventoryEncryptionStruct?

    def initialize(@bucket, @format, @account_id = nil , @prefix = nil , @encryption = nil )
    end
  end

  class InventoryDestinationStruct
    include RestXML::Structure

    # <p>Contains the bucket name, file format, bucket owner (optional), and prefix (optional)
    # where inventory results are published.</p>
    @[Protocol::Field(location: :body, name: "S3BucketDestination", structure: true)]
    property s3_bucket_destination : InventoryS3BucketDestinationStruct

    def initialize(@s3_bucket_destination)
    end
  end

  class InventoryFilterStruct
    include RestXML::Structure

    # <p>The prefix that an object must have to be included in the inventory results.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String

    def initialize(@prefix)
    end
  end

  class InventoryScheduleStruct
    include RestXML::Structure

    # <p>Specifies how frequently inventory results are produced.</p>
    @[Protocol::Field(location: :body, name: "Frequency", structure: false)]
    property frequency : String

    def initialize(@frequency)
    end
  end

  class InventoryConfigurationStruct
    include RestXML::Structure

    # <p>Contains information about where to publish the inventory results.</p>
    @[Protocol::Field(location: :body, name: "Destination", structure: true)]
    property destination : InventoryDestinationStruct
    # <p>Specifies whether the inventory is enabled or disabled. If set to <code>True</code>, an
    # inventory list is generated. If set to <code>False</code>, no inventory list is
    # generated.</p>
    @[Protocol::Field(location: :body, name: "IsEnabled", structure: false)]
    property is_enabled : Bool
    # <p>Specifies an inventory filter. The inventory only includes objects that meet the
    # filter's criteria.</p>
    @[Protocol::Field(location: :body, name: "Filter", structure: true)]
    property filter : InventoryFilterStruct?
    # <p>The ID used to identify the inventory configuration.</p>
    @[Protocol::Field(location: :body, name: "Id", structure: false)]
    property id : String
    # <p>Object versions to include in the inventory list. If set to <code>All</code>, the list
    # includes all the object versions, which adds the version-related fields
    # <code>VersionId</code>, <code>IsLatest</code>, and <code>DeleteMarker</code> to the
    # list. If set to <code>Current</code>, the list does not contain these version-related
    # fields.</p>
    @[Protocol::Field(location: :body, name: "IncludedObjectVersions", structure: false)]
    property included_object_versions : String
    # <p>Contains the optional fields that are included in the inventory results.</p>
    @[Protocol::Field(location: :body, name: "OptionalFields", structure: false)]
    property optional_fields : Array(String)?
    # <p>Specifies the schedule for generating inventory results.</p>
    @[Protocol::Field(location: :body, name: "Schedule", structure: true)]
    property schedule : InventoryScheduleStruct

    def initialize(@destination, @is_enabled, @id, @included_object_versions, @schedule, @filter = nil , @optional_fields = nil )
    end
  end

  class GetBucketInventoryConfigurationOutput
    include RestXML::Structure

    # <p>Specifies the inventory configuration.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property inventory_configuration : InventoryConfigurationStruct?

    def initialize(@inventory_configuration = nil )
    end
  end

  class GetBucketLifecycleConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket for which to get the lifecycle information.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class LifecycleExpirationStruct
    include RestXML::Structure

    # <p>Indicates at what date the object is to be moved or deleted. Should be in GMT ISO 8601
    # Format.</p>
    @[Protocol::Field(location: :body, name: "Date", structure: false)]
    property date : Time?
    # <p>Indicates the lifetime, in days, of the objects that are subject to the rule. The value
    # must be a non-zero positive integer.</p>
    @[Protocol::Field(location: :body, name: "Days", structure: false)]
    property days : Int32?
    # <p>Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If set
    # to true, the delete marker will be expired; if set to false the policy takes no action.
    # This cannot be specified with Days or Date in a Lifecycle Expiration Policy.</p>
    @[Protocol::Field(location: :body, name: "ExpiredObjectDeleteMarker", structure: false)]
    property expired_object_delete_marker : Bool?

    def initialize(@date = nil , @days = nil , @expired_object_delete_marker = nil )
    end
  end

  class LifecycleRuleAndOperatorStruct
    include RestXML::Structure

    # <p>Prefix identifying one or more objects to which the rule applies.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    # <p>All of these tags must exist in the object's tag set in order for the rule to
    # apply.</p>
    @[Protocol::Field(location: :body, name: "Tag", structure: false)]
    property tags : Array(TagStruct)?

    def initialize(@prefix = nil , @tags = nil )
    end
  end

  class TransitionStruct
    include RestXML::Structure

    # <p>Indicates when objects are transitioned to the specified storage class. The date value
    # must be in ISO 8601 format. The time is always midnight UTC.</p>
    @[Protocol::Field(location: :body, name: "Date", structure: false)]
    property date : Time?
    # <p>Indicates the number of days after creation when objects are transitioned to the
    # specified storage class. The value must be a positive integer.</p>
    @[Protocol::Field(location: :body, name: "Days", structure: false)]
    property days : Int32?
    # <p>The storage class to which you want the object to transition.</p>
    @[Protocol::Field(location: :body, name: "StorageClass", structure: false)]
    property storage_class : String?

    def initialize(@date = nil , @days = nil , @storage_class = nil )
    end
  end

  class NoncurrentVersionTransitionStruct
    include RestXML::Structure

    # <p>Specifies the number of days an object is noncurrent before Amazon S3 can perform the
    # associated action. For information about the noncurrent days calculations, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations">How
    # Amazon S3 Calculates How Long an Object Has Been Noncurrent</a> in the
    # <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "NoncurrentDays", structure: false)]
    property noncurrent_days : Int32?
    # <p>The class of storage used to store the object.</p>
    @[Protocol::Field(location: :body, name: "StorageClass", structure: false)]
    property storage_class : String?

    def initialize(@noncurrent_days = nil , @storage_class = nil )
    end
  end

  class NoncurrentVersionExpirationStruct
    include RestXML::Structure

    # <p>Specifies the number of days an object is noncurrent before Amazon S3 can perform the
    # associated action. For information about the noncurrent days calculations, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations">How
    # Amazon S3 Calculates When an Object Became Noncurrent</a> in the <i>Amazon Simple
    # Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "NoncurrentDays", structure: false)]
    property noncurrent_days : Int32?

    def initialize(@noncurrent_days = nil )
    end
  end

  class AbortIncompleteMultipartUploadStruct
    include RestXML::Structure

    # <p>Specifies the number of days after which Amazon S3 aborts an incomplete multipart
    # upload.</p>
    @[Protocol::Field(location: :body, name: "DaysAfterInitiation", structure: false)]
    property days_after_initiation : Int32?

    def initialize(@days_after_initiation = nil )
    end
  end

  class LifecycleRuleStruct
    include RestXML::Structure

    # <p>Specifies the expiration for the lifecycle of the object in the form of date, days and,
    # whether the object has a delete marker.</p>
    @[Protocol::Field(location: :body, name: "Expiration", structure: true)]
    property expiration : LifecycleExpirationStruct?
    # <p>Unique identifier for the rule. The value cannot be longer than 255 characters.</p>
    @[Protocol::Field(location: :body, name: "ID", structure: false)]
    property id : String?
    # <p>Prefix identifying one or more objects to which the rule applies. This is
    # No longer used; use <code>Filter</code> instead.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    #
    @[Protocol::Field(location: :body, name: "Filter", structure: false)]
    property filter : LifecycleRuleFilterStruct?
    # <p>If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not
    # currently being applied.</p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String
    # <p>Specifies when an Amazon S3 object transitions to a specified storage class.</p>
    @[Protocol::Field(location: :body, name: "Transition", structure: false)]
    property transitions : Array(TransitionStruct)?
    # <p> Specifies the transition rule for the lifecycle rule that describes when noncurrent
    # objects transition to a specific storage class. If your bucket is versioning-enabled (or
    # versioning is suspended), you can set this action to request that Amazon S3 transition
    # noncurrent object versions to a specific storage class at a set period in the object's
    # lifetime. </p>
    @[Protocol::Field(location: :body, name: "NoncurrentVersionTransition", structure: false)]
    property noncurrent_version_transitions : Array(NoncurrentVersionTransitionStruct)?
    #
    @[Protocol::Field(location: :body, name: "NoncurrentVersionExpiration", structure: true)]
    property noncurrent_version_expiration : NoncurrentVersionExpirationStruct?
    #
    @[Protocol::Field(location: :body, name: "AbortIncompleteMultipartUpload", structure: true)]
    property abort_incomplete_multipart_upload : AbortIncompleteMultipartUploadStruct?

    def initialize(@status, @expiration = nil , @id = nil , @prefix = nil , @filter = nil , @transitions = nil , @noncurrent_version_transitions = nil , @noncurrent_version_expiration = nil , @abort_incomplete_multipart_upload = nil )
    end
  end

  class GetBucketLifecycleConfigurationOutput
    include RestXML::Structure

    # <p>Container for a lifecycle rule.</p>
    @[Protocol::Field(location: :body, name: "Rule", structure: false)]
    property rules : Array(LifecycleRuleStruct)?

    def initialize(@rules = nil )
    end
  end

  class GetBucketLocationRequest
    include RestXML::Structure

    # <p>The name of the bucket for which to get the location.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class GetBucketLocationOutput
    include RestXML::Structure

    # <p>Specifies the Region where the bucket resides. For a list of all the Amazon S3 supported
    # location constraints by Region, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions and Endpoints</a>.
    # Buckets in Region <code>us-east-1</code> have a LocationConstraint of
    # <code>null</code>.</p>
    @[Protocol::Field(location: :body, name: "LocationConstraint", structure: false)]
    property location_constraint : String?

    def initialize(@location_constraint = nil )
    end
  end

  class GetBucketLoggingRequest
    include RestXML::Structure

    # <p>The bucket name for which to get the logging information.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class TargetGrantStruct
    include RestXML::Structure

    # <p>Container for the person being granted permissions.</p>
    @[Protocol::Field(location: :body, name: "Grantee", structure: true)]
    property grantee : GranteeStruct?
    # <p>Logging permissions assigned to the grantee for the bucket.</p>
    @[Protocol::Field(location: :body, name: "Permission", structure: false)]
    property permission : String?

    def initialize(@grantee = nil , @permission = nil )
    end
  end

  class LoggingEnabledStruct
    include RestXML::Structure

    # <p>Specifies the bucket where you want Amazon S3 to store server access logs. You can have your
    # logs delivered to any bucket that you own, including the same bucket that is being logged.
    # You can also configure multiple buckets to deliver their logs to the same target bucket. In
    # this case, you should choose a different <code>TargetPrefix</code> for each source bucket
    # so that the delivered log files can be distinguished by key.</p>
    @[Protocol::Field(location: :body, name: "TargetBucket", structure: false)]
    property target_bucket : String
    # <p>Container for granting information.</p>
    @[Protocol::Field(location: :body, name: "TargetGrants", structure: false)]
    property target_grants : Array(TargetGrantStruct)?
    # <p>A prefix for all log object keys. If you store log files from multiple Amazon S3 buckets in a
    # single bucket, you can use a prefix to distinguish which log files came from which
    # bucket.</p>
    @[Protocol::Field(location: :body, name: "TargetPrefix", structure: false)]
    property target_prefix : String

    def initialize(@target_bucket, @target_prefix, @target_grants = nil )
    end
  end

  class GetBucketLoggingOutput
    include RestXML::Structure

    #
    @[Protocol::Field(location: :body, name: "LoggingEnabled", structure: true)]
    property logging_enabled : LoggingEnabledStruct?

    def initialize(@logging_enabled = nil )
    end
  end

  class GetBucketMetricsConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket containing the metrics configuration to retrieve.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ID used to identify the metrics configuration.</p>
    @[Protocol::Field(location: :query, name: "id", structure: false)]
    property id : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @id, @expected_bucket_owner = nil )
    end
  end

  class MetricsAndOperatorStruct
    include RestXML::Structure

    # <p>The prefix used when evaluating an AND predicate.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    # <p>The list of tags used when evaluating an AND predicate.</p>
    @[Protocol::Field(location: :body, name: "Tag", structure: false)]
    property tags : Array(TagStruct)?

    def initialize(@prefix = nil , @tags = nil )
    end
  end

  class MetricsConfigurationStruct
    include RestXML::Structure

    # <p>The ID used to identify the metrics configuration.</p>
    @[Protocol::Field(location: :body, name: "Id", structure: false)]
    property id : String
    # <p>Specifies a metrics configuration filter. The metrics configuration will only include
    # objects that meet the filter's criteria. A filter must be a prefix, a tag, or a conjunction
    # (MetricsAndOperator).</p>
    @[Protocol::Field(location: :body, name: "Filter", structure: false)]
    property filter : MetricsFilterStruct?

    def initialize(@id, @filter = nil )
    end
  end

  class GetBucketMetricsConfigurationOutput
    include RestXML::Structure

    # <p>Specifies the metrics configuration.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property metrics_configuration : MetricsConfigurationStruct?

    def initialize(@metrics_configuration = nil )
    end
  end

  class GetBucketNotificationConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket for which to get the notification configuration.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class FilterRuleStruct
    include RestXML::Structure

    # <p>The object key name prefix or suffix identifying one or more objects to which the
    # filtering rule applies. The maximum length is 1,024 characters. Overlapping prefixes and
    # suffixes are not supported. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a>
    # in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>The value that the filter searches for in object key names.</p>
    @[Protocol::Field(location: :body, name: "Value", structure: false)]
    property value : String?

    def initialize(@name = nil , @value = nil )
    end
  end

  class S3KeyFilterStruct
    include RestXML::Structure

    #
    @[Protocol::Field(location: :body, name: "FilterRule", structure: false)]
    property filter_rules : Array(FilterRuleStruct)?

    def initialize(@filter_rules = nil )
    end
  end

  class NotificationConfigurationFilterStruct
    include RestXML::Structure

    #
    @[Protocol::Field(location: :body, name: "S3Key", structure: true)]
    property key : S3KeyFilterStruct?

    def initialize(@key = nil )
    end
  end

  class TopicConfigurationStruct
    include RestXML::Structure

    #
    @[Protocol::Field(location: :body, name: "Id", structure: false)]
    property id : String?
    # <p>The Amazon Resource Name (ARN) of the Amazon SNS topic to which Amazon S3 publishes a message
    # when it detects events of the specified type.</p>
    @[Protocol::Field(location: :body, name: "Topic", structure: false)]
    property topic_arn : String
    # <p>The Amazon S3 bucket event about which to send notifications. For more information, see
    # <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Supported
    # Event Types</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "Event", structure: false)]
    property events : Array(String)
    #
    @[Protocol::Field(location: :body, name: "Filter", structure: true)]
    property filter : NotificationConfigurationFilterStruct?

    def initialize(@topic_arn, @events, @id = nil , @filter = nil )
    end
  end

  class QueueConfigurationStruct
    include RestXML::Structure

    #
    @[Protocol::Field(location: :body, name: "Id", structure: false)]
    property id : String?
    # <p>The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3 publishes a message
    # when it detects events of the specified type.</p>
    @[Protocol::Field(location: :body, name: "Queue", structure: false)]
    property queue_arn : String
    # <p>A collection of bucket events for which to send notifications</p>
    @[Protocol::Field(location: :body, name: "Event", structure: false)]
    property events : Array(String)
    #
    @[Protocol::Field(location: :body, name: "Filter", structure: true)]
    property filter : NotificationConfigurationFilterStruct?

    def initialize(@queue_arn, @events, @id = nil , @filter = nil )
    end
  end

  class LambdaFunctionConfigurationStruct
    include RestXML::Structure

    #
    @[Protocol::Field(location: :body, name: "Id", structure: false)]
    property id : String?
    # <p>The Amazon Resource Name (ARN) of the AWS Lambda function that Amazon S3 invokes when the
    # specified event type occurs.</p>
    @[Protocol::Field(location: :body, name: "CloudFunction", structure: false)]
    property lambda_function_arn : String
    # <p>The Amazon S3 bucket event for which to invoke the AWS Lambda function. For more information,
    # see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Supported
    # Event Types</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "Event", structure: false)]
    property events : Array(String)
    #
    @[Protocol::Field(location: :body, name: "Filter", structure: true)]
    property filter : NotificationConfigurationFilterStruct?

    def initialize(@lambda_function_arn, @events, @id = nil , @filter = nil )
    end
  end

  class NotificationConfigurationStruct
    include RestXML::Structure

    # <p>The topic to which notifications are sent and the events for which notifications are
    # generated.</p>
    @[Protocol::Field(location: :body, name: "TopicConfiguration", structure: false)]
    property topic_configurations : Array(TopicConfigurationStruct)?
    # <p>The Amazon Simple Queue Service queues to publish messages to and the events for which
    # to publish messages.</p>
    @[Protocol::Field(location: :body, name: "QueueConfiguration", structure: false)]
    property queue_configurations : Array(QueueConfigurationStruct)?
    # <p>Describes the AWS Lambda functions to invoke and the events for which to invoke
    # them.</p>
    @[Protocol::Field(location: :body, name: "CloudFunctionConfiguration", structure: false)]
    property lambda_function_configurations : Array(LambdaFunctionConfigurationStruct)?

    def initialize(@topic_configurations = nil , @queue_configurations = nil , @lambda_function_configurations = nil )
    end
  end

  class GetBucketOwnershipControlsRequest
    include RestXML::Structure

    # <p>The name of the Amazon S3 bucket whose <code>OwnershipControls</code> you want to retrieve.
    # </p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class OwnershipControlsRuleStruct
    include RestXML::Structure

    #
    @[Protocol::Field(location: :body, name: "ObjectOwnership", structure: false)]
    property object_ownership : String

    def initialize(@object_ownership)
    end
  end

  class OwnershipControlsStruct
    include RestXML::Structure

    # <p>The container element for an ownership control rule.</p>
    @[Protocol::Field(location: :body, name: "Rule", structure: false)]
    property rules : Array(OwnershipControlsRuleStruct)

    def initialize(@rules)
    end
  end

  class GetBucketOwnershipControlsOutput
    include RestXML::Structure

    # <p>The <code>OwnershipControls</code> (BucketOwnerPreferred or ObjectWriter) currently in
    # effect for this Amazon S3 bucket.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property ownership_controls : OwnershipControlsStruct?

    def initialize(@ownership_controls = nil )
    end
  end

  class GetBucketPolicyRequest
    include RestXML::Structure

    # <p>The bucket name for which to get the bucket policy.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class GetBucketPolicyOutput
    include RestXML::Structure

    # <p>The bucket policy as a JSON document.</p>
    @[Protocol::Field(location: :body, name: "Policy", structure: false)]
    property policy : String?

    def initialize(@policy = nil )
    end
  end

  class GetBucketPolicyStatusRequest
    include RestXML::Structure

    # <p>The name of the Amazon S3 bucket whose policy status you want to retrieve.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class PolicyStatusStruct
    include RestXML::Structure

    # <p>The policy status for this bucket. <code>TRUE</code> indicates that this bucket is
    # public. <code>FALSE</code> indicates that the bucket is not public.</p>
    @[Protocol::Field(location: :body, name: "IsPublic", structure: false)]
    property is_public : Bool?

    def initialize(@is_public = nil )
    end
  end

  class GetBucketPolicyStatusOutput
    include RestXML::Structure

    # <p>The policy status for the specified bucket.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property policy_status : PolicyStatusStruct?

    def initialize(@policy_status = nil )
    end
  end

  class GetBucketReplicationRequest
    include RestXML::Structure

    # <p>The bucket name for which to get the replication information.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class ReplicationRuleAndOperatorStruct
    include RestXML::Structure

    # <p>An object key name prefix that identifies the subset of objects to which the rule
    # applies.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    # <p>An array of tags containing key and value pairs.</p>
    @[Protocol::Field(location: :body, name: "Tag", structure: false)]
    property tags : Array(TagStruct)?

    def initialize(@prefix = nil , @tags = nil )
    end
  end

  class SseKmsEncryptedObjectsStruct
    include RestXML::Structure

    # <p>Specifies whether Amazon S3 replicates objects created with server-side encryption using a
    # customer master key (CMK) stored in AWS Key Management Service.</p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String

    def initialize(@status)
    end
  end

  class ReplicaModificationsStruct
    include RestXML::Structure

    # <p>Specifies whether Amazon S3 replicates modifications on replicas.</p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String

    def initialize(@status)
    end
  end

  class SourceSelectionCriteriaStruct
    include RestXML::Structure

    # <p> A container for filter information for the selection of Amazon S3 objects encrypted with AWS
    # KMS. If you include <code>SourceSelectionCriteria</code> in the replication configuration,
    # this element is required. </p>
    @[Protocol::Field(location: :body, name: "SseKmsEncryptedObjects", structure: true)]
    property sse_kms_encrypted_objects : SseKmsEncryptedObjectsStruct?
    # <p>A filter that you can specify for selections for modifications on replicas. Amazon S3 doesn't
    # replicate replica modifications by default. In the latest version of replication
    # configuration (when <code>Filter</code> is specified), you can specify this element and set
    # the status to <code>Enabled</code> to replicate modifications on replicas. </p>
    # <note>
    # <p> If you don't specify the <code>Filter</code> element, Amazon S3 assumes that the
    # replication configuration is the earlier version, V1. In the earlier version, this
    # element is not allowed</p>
    # </note>
    @[Protocol::Field(location: :body, name: "ReplicaModifications", structure: true)]
    property replica_modifications : ReplicaModificationsStruct?

    def initialize(@sse_kms_encrypted_objects = nil , @replica_modifications = nil )
    end
  end

  class ExistingObjectReplicationStruct
    include RestXML::Structure

    # <p></p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String

    def initialize(@status)
    end
  end

  class AccessControlTranslationStruct
    include RestXML::Structure

    # <p>Specifies the replica ownership. For default and valid values, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTreplication.html">PUT bucket
    # replication</a> in the <i>Amazon Simple Storage Service API Reference</i>.</p>
    @[Protocol::Field(location: :body, name: "Owner", structure: false)]
    property owner : String

    def initialize(@owner)
    end
  end

  class EncryptionConfigurationStruct
    include RestXML::Structure

    # <p>Specifies the ID (Key ARN or Alias ARN) of the customer managed customer master key
    # (CMK) stored in AWS Key Management Service (KMS) for the destination bucket. Amazon S3 uses
    # this key to encrypt replica objects. Amazon S3 only supports symmetric customer managed CMKs.
    # For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and
    # Asymmetric Keys</a> in the <i>AWS Key Management Service Developer
    # Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "ReplicaKmsKeyID", structure: false)]
    property replica_kms_key_id : String?

    def initialize(@replica_kms_key_id = nil )
    end
  end

  class ReplicationTimeValueStruct
    include RestXML::Structure

    # <p> Contains an integer specifying time in minutes. </p>
    # <p> Valid values: 15 minutes. </p>
    @[Protocol::Field(location: :body, name: "Minutes", structure: false)]
    property minutes : Int32?

    def initialize(@minutes = nil )
    end
  end

  class ReplicationTimeStruct
    include RestXML::Structure

    # <p> Specifies whether the replication time is enabled. </p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String
    # <p> A container specifying the time by which replication should be complete for all objects
    # and operations on objects. </p>
    @[Protocol::Field(location: :body, name: "Time", structure: true)]
    property time : ReplicationTimeValueStruct

    def initialize(@status, @time)
    end
  end

  class MetricsStruct
    include RestXML::Structure

    # <p> Specifies whether the replication metrics are enabled. </p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String
    # <p> A container specifying the time threshold for emitting the
    # <code>s3:Replication:OperationMissedThreshold</code> event. </p>
    @[Protocol::Field(location: :body, name: "EventThreshold", structure: true)]
    property event_threshold : ReplicationTimeValueStruct?

    def initialize(@status, @event_threshold = nil )
    end
  end

  class DestinationStruct
    include RestXML::Structure

    # <p> The Amazon Resource Name (ARN) of the bucket where you want Amazon S3 to store the
    # results.</p>
    @[Protocol::Field(location: :body, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Destination bucket owner account ID. In a cross-account scenario, if you direct Amazon S3 to
    # change replica ownership to the AWS account that owns the destination bucket by specifying
    # the <code>AccessControlTranslation</code> property, this is the account ID of the
    # destination bucket owner. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-change-owner.html">Replication Additional
    # Configuration: Changing the Replica Owner</a> in the <i>Amazon Simple Storage
    # Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "Account", structure: false)]
    property account : String?
    # <p> The storage class to use when replicating objects, such as S3 Standard or reduced
    # redundancy. By default, Amazon S3 uses the storage class of the source object to create the
    # object replica. </p>
    # <p>For valid values, see the <code>StorageClass</code> element of the <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTreplication.html">PUT Bucket
    # replication</a> action in the <i>Amazon Simple Storage Service API Reference</i>.</p>
    @[Protocol::Field(location: :body, name: "StorageClass", structure: false)]
    property storage_class : String?
    # <p>Specify this only in a cross-account scenario (where source and destination bucket
    # owners are not the same), and you want to change replica ownership to the AWS account that
    # owns the destination bucket. If this is not specified in the replication configuration, the
    # replicas are owned by same AWS account that owns the source object.</p>
    @[Protocol::Field(location: :body, name: "AccessControlTranslation", structure: true)]
    property access_control_translation : AccessControlTranslationStruct?
    # <p>A container that provides information about encryption. If
    # <code>SourceSelectionCriteria</code> is specified, you must specify this element.</p>
    @[Protocol::Field(location: :body, name: "EncryptionConfiguration", structure: true)]
    property encryption_configuration : EncryptionConfigurationStruct?
    # <p> A container specifying S3 Replication Time Control (S3 RTC), including whether S3 RTC is enabled and the time
    # when all objects and operations on objects must be replicated. Must be specified together
    # with a <code>Metrics</code> block. </p>
    @[Protocol::Field(location: :body, name: "ReplicationTime", structure: true)]
    property replication_time : ReplicationTimeStruct?
    # <p> A container specifying replication metrics-related settings enabling replication
    # metrics and events. </p>
    @[Protocol::Field(location: :body, name: "Metrics", structure: true)]
    property metrics : MetricsStruct?

    def initialize(@bucket, @account = nil , @storage_class = nil , @access_control_translation = nil , @encryption_configuration = nil , @replication_time = nil , @metrics = nil )
    end
  end

  class DeleteMarkerReplicationStruct
    include RestXML::Structure

    # <p>Indicates whether to replicate delete markers.</p>
    # <note>
    # <p>Indicates whether to replicate delete markers.</p>
    # </note>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String?

    def initialize(@status = nil )
    end
  end

  class ReplicationRuleStruct
    include RestXML::Structure

    # <p>A unique identifier for the rule. The maximum value is 255 characters.</p>
    @[Protocol::Field(location: :body, name: "ID", structure: false)]
    property id : String?
    # <p>The priority indicates which rule has precedence whenever two or more replication rules
    # conflict. Amazon S3 will attempt to replicate objects according to all replication rules.
    # However, if there are two or more rules with the same destination bucket, then objects will
    # be replicated according to the rule with the highest priority. The higher the number, the
    # higher the priority. </p>
    # <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html">Replication</a> in the
    # <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "Priority", structure: false)]
    property priority : Int32?
    # <p>An object key name prefix that identifies the object or objects to which the rule
    # applies. The maximum prefix length is 1,024 characters. To include all objects in a bucket,
    # specify an empty string. </p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    #
    @[Protocol::Field(location: :body, name: "Filter", structure: false)]
    property filter : ReplicationRuleFilterStruct?
    # <p>Specifies whether the rule is enabled.</p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String
    # <p>A container that describes additional filters for identifying the source objects that
    # you want to replicate. You can choose to enable or disable the replication of these
    # objects. Currently, Amazon S3 supports only the filter that you can specify for objects created
    # with server-side encryption using a customer master key (CMK) stored in AWS Key Management
    # Service (SSE-KMS).</p>
    @[Protocol::Field(location: :body, name: "SourceSelectionCriteria", structure: true)]
    property source_selection_criteria : SourceSelectionCriteriaStruct?
    # <p></p>
    @[Protocol::Field(location: :body, name: "ExistingObjectReplication", structure: true)]
    property existing_object_replication : ExistingObjectReplicationStruct?
    # <p>A container for information about the replication destination and its configurations
    # including enabling the S3 Replication Time Control (S3 RTC).</p>
    @[Protocol::Field(location: :body, name: "Destination", structure: true)]
    property destination : DestinationStruct
    #
    @[Protocol::Field(location: :body, name: "DeleteMarkerReplication", structure: true)]
    property delete_marker_replication : DeleteMarkerReplicationStruct?

    def initialize(@status, @destination, @id = nil , @priority = nil , @prefix = nil , @filter = nil , @source_selection_criteria = nil , @existing_object_replication = nil , @delete_marker_replication = nil )
    end
  end

  class ReplicationConfigurationStruct
    include RestXML::Structure

    # <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that
    # Amazon S3 assumes when replicating objects. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-how-setup.html">How to Set Up
    # Replication</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "Role", structure: false)]
    property role : String
    # <p>A container for one or more replication rules. A replication configuration must have at
    # least one rule and can contain a maximum of 1,000 rules. </p>
    @[Protocol::Field(location: :body, name: "Rule", structure: false)]
    property rules : Array(ReplicationRuleStruct)

    def initialize(@role, @rules)
    end
  end

  class GetBucketReplicationOutput
    include RestXML::Structure

    #
    @[Protocol::Field(location: :body_io, structure: true)]
    property replication_configuration : ReplicationConfigurationStruct?

    def initialize(@replication_configuration = nil )
    end
  end

  class GetBucketRequestPaymentRequest
    include RestXML::Structure

    # <p>The name of the bucket for which to get the payment request configuration</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class GetBucketRequestPaymentOutput
    include RestXML::Structure

    # <p>Specifies who pays for the download and request fees.</p>
    @[Protocol::Field(location: :body, name: "Payer", structure: false)]
    property payer : String?

    def initialize(@payer = nil )
    end
  end

  class GetBucketTaggingRequest
    include RestXML::Structure

    # <p>The name of the bucket for which to get the tagging information.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class GetBucketTaggingOutput
    include RestXML::Structure

    # <p>Contains the tag set.</p>
    @[Protocol::Field(location: :body, name: "TagSet", structure: false)]
    property tag_set : Array(TagStruct)

    def initialize(@tag_set)
    end
  end

  class GetBucketVersioningRequest
    include RestXML::Structure

    # <p>The name of the bucket for which to get the versioning information.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class GetBucketVersioningOutput
    include RestXML::Structure

    # <p>The versioning state of the bucket.</p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String?
    # <p>Specifies whether MFA delete is enabled in the bucket versioning configuration. This
    # element is only returned if the bucket has been configured with MFA delete. If the bucket
    # has never been so configured, this element is not returned.</p>
    @[Protocol::Field(location: :body, name: "MfaDelete", structure: false)]
    property mfa_delete : String?

    def initialize(@status = nil , @mfa_delete = nil )
    end
  end

  class GetBucketWebsiteRequest
    include RestXML::Structure

    # <p>The bucket name for which to get the website configuration.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class RedirectAllRequestsToStruct
    include RestXML::Structure

    # <p>Name of the host where requests are redirected.</p>
    @[Protocol::Field(location: :body, name: "HostName", structure: false)]
    property host_name : String
    # <p>Protocol to use when redirecting requests. The default is the protocol that is used in
    # the original request.</p>
    @[Protocol::Field(location: :body, name: "Protocol", structure: false)]
    property protocol : String?

    def initialize(@host_name, @protocol = nil )
    end
  end

  class IndexDocumentStruct
    include RestXML::Structure

    # <p>A suffix that is appended to a request that is for a directory on the website endpoint
    # (for example,if the suffix is index.html and you make a request to samplebucket/images/ the
    # data that is returned will be for the object with the key name images/index.html) The
    # suffix must not be empty and must not include a slash character.</p>
    @[Protocol::Field(location: :body, name: "Suffix", structure: false)]
    property suffix : String

    def initialize(@suffix)
    end
  end

  class ErrorDocumentStruct
    include RestXML::Structure

    # <p>The object key name to use when a 4XX class error occurs.</p>
    @[Protocol::Field(location: :body, name: "Key", structure: false)]
    property key : String

    def initialize(@key)
    end
  end

  class ConditionStruct
    include RestXML::Structure

    # <p>The HTTP error code when the redirect is applied. In the event of an error, if the error
    # code equals this value, then the specified redirect is applied. Required when parent
    # element <code>Condition</code> is specified and sibling <code>KeyPrefixEquals</code> is not
    # specified. If both are specified, then both must be true for the redirect to be
    # applied.</p>
    @[Protocol::Field(location: :body, name: "HttpErrorCodeReturnedEquals", structure: false)]
    property http_error_code_returned_equals : String?
    # <p>The object key name prefix when the redirect is applied. For example, to redirect
    # requests for <code>ExamplePage.html</code>, the key prefix will be
    # <code>ExamplePage.html</code>. To redirect request for all pages with the prefix
    # <code>docs/</code>, the key prefix will be <code>/docs</code>, which identifies all
    # objects in the <code>docs/</code> folder. Required when the parent element
    # <code>Condition</code> is specified and sibling <code>HttpErrorCodeReturnedEquals</code>
    # is not specified. If both conditions are specified, both must be true for the redirect to
    # be applied.</p>
    @[Protocol::Field(location: :body, name: "KeyPrefixEquals", structure: false)]
    property key_prefix_equals : String?

    def initialize(@http_error_code_returned_equals = nil , @key_prefix_equals = nil )
    end
  end

  class RedirectStruct
    include RestXML::Structure

    # <p>The host name to use in the redirect request.</p>
    @[Protocol::Field(location: :body, name: "HostName", structure: false)]
    property host_name : String?
    # <p>The HTTP redirect code to use on the response. Not required if one of the siblings is
    # present.</p>
    @[Protocol::Field(location: :body, name: "HttpRedirectCode", structure: false)]
    property http_redirect_code : String?
    # <p>Protocol to use when redirecting requests. The default is the protocol that is used in
    # the original request.</p>
    @[Protocol::Field(location: :body, name: "Protocol", structure: false)]
    property protocol : String?
    # <p>The object key prefix to use in the redirect request. For example, to redirect requests
    # for all pages with prefix <code>docs/</code> (objects in the <code>docs/</code> folder) to
    # <code>documents/</code>, you can set a condition block with <code>KeyPrefixEquals</code>
    # set to <code>docs/</code> and in the Redirect set <code>ReplaceKeyPrefixWith</code> to
    # <code>/documents</code>. Not required if one of the siblings is present. Can be present
    # only if <code>ReplaceKeyWith</code> is not provided.</p>
    @[Protocol::Field(location: :body, name: "ReplaceKeyPrefixWith", structure: false)]
    property replace_key_prefix_with : String?
    # <p>The specific object key to use in the redirect request. For example, redirect request to
    # <code>error.html</code>. Not required if one of the siblings is present. Can be present
    # only if <code>ReplaceKeyPrefixWith</code> is not provided.</p>
    @[Protocol::Field(location: :body, name: "ReplaceKeyWith", structure: false)]
    property replace_key_with : String?

    def initialize(@host_name = nil , @http_redirect_code = nil , @protocol = nil , @replace_key_prefix_with = nil , @replace_key_with = nil )
    end
  end

  class RoutingRuleStruct
    include RestXML::Structure

    # <p>A container for describing a condition that must be met for the specified redirect to
    # apply. For example, 1. If request is for pages in the <code>/docs</code> folder, redirect
    # to the <code>/documents</code> folder. 2. If request results in HTTP error 4xx, redirect
    # request to another host where you might process the error.</p>
    @[Protocol::Field(location: :body, name: "Condition", structure: true)]
    property condition : ConditionStruct?
    # <p>Container for redirect information. You can redirect requests to another host, to
    # another page, or with another protocol. In the event of an error, you can specify a
    # different error code to return.</p>
    @[Protocol::Field(location: :body, name: "Redirect", structure: true)]
    property redirect : RedirectStruct

    def initialize(@redirect, @condition = nil )
    end
  end

  class GetBucketWebsiteOutput
    include RestXML::Structure

    # <p>Specifies the redirect behavior of all requests to a website endpoint of an Amazon S3
    # bucket.</p>
    @[Protocol::Field(location: :body, name: "RedirectAllRequestsTo", structure: true)]
    property redirect_all_requests_to : RedirectAllRequestsToStruct?
    # <p>The name of the index document for the website (for example
    # <code>index.html</code>).</p>
    @[Protocol::Field(location: :body, name: "IndexDocument", structure: true)]
    property index_document : IndexDocumentStruct?
    # <p>The object key name of the website error document to use for 4XX class errors.</p>
    @[Protocol::Field(location: :body, name: "ErrorDocument", structure: true)]
    property error_document : ErrorDocumentStruct?
    # <p>Rules that define when a redirect is applied and the redirect behavior.</p>
    @[Protocol::Field(location: :body, name: "RoutingRules", structure: false)]
    property routing_rules : Array(RoutingRuleStruct)?

    def initialize(@redirect_all_requests_to = nil , @index_document = nil , @error_document = nil , @routing_rules = nil )
    end
  end

  class GetObjectRequest
    include RestXML::Structure

    # <p>The bucket name containing the object. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Return the object only if its entity tag (ETag) is the same as the one specified,
    # otherwise return a 412 (precondition failed).</p>
    @[Protocol::Field(location: :header, name: "If-Match", structure: false)]
    property if_match : String?
    # <p>Return the object only if it has been modified since the specified time, otherwise
    # return a 304 (not modified).</p>
    @[Protocol::Field(location: :header, name: "If-Modified-Since", structure: false)]
    property if_modified_since : Time?
    # <p>Return the object only if its entity tag (ETag) is different from the one specified,
    # otherwise return a 304 (not modified).</p>
    @[Protocol::Field(location: :header, name: "If-None-Match", structure: false)]
    property if_none_match : String?
    # <p>Return the object only if it has not been modified since the specified time, otherwise
    # return a 412 (precondition failed).</p>
    @[Protocol::Field(location: :header, name: "If-Unmodified-Since", structure: false)]
    property if_unmodified_since : Time?
    # <p>Key of the object to get.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>Downloads the specified range bytes of an object. For more information about the HTTP
    # Range header, see <a href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35">https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35</a>.</p>
    # <note>
    # <p>Amazon S3 doesn't support retrieving multiple ranges of data per <code>GET</code>
    # request.</p>
    # </note>
    @[Protocol::Field(location: :header, name: "Range", structure: false)]
    property range : String?
    # <p>Sets the <code>Cache-Control</code> header of the response.</p>
    @[Protocol::Field(location: :query, name: "response-cache-control", structure: false)]
    property response_cache_control : String?
    # <p>Sets the <code>Content-Disposition</code> header of the response</p>
    @[Protocol::Field(location: :query, name: "response-content-disposition", structure: false)]
    property response_content_disposition : String?
    # <p>Sets the <code>Content-Encoding</code> header of the response.</p>
    @[Protocol::Field(location: :query, name: "response-content-encoding", structure: false)]
    property response_content_encoding : String?
    # <p>Sets the <code>Content-Language</code> header of the response.</p>
    @[Protocol::Field(location: :query, name: "response-content-language", structure: false)]
    property response_content_language : String?
    # <p>Sets the <code>Content-Type</code> header of the response.</p>
    @[Protocol::Field(location: :query, name: "response-content-type", structure: false)]
    property response_content_type : String?
    # <p>Sets the <code>Expires</code> header of the response.</p>
    @[Protocol::Field(location: :query, name: "response-expires", structure: false)]
    property response_expires : Time?
    # <p>VersionId used to reference a specific version of the object.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    # <p>Specifies the algorithm to use to when encrypting the object (for example,
    # AES256).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This
    # value is used to store the object and then it is discarded; Amazon S3 does not store the
    # encryption key. The key must be appropriate for use with the algorithm specified in the
    # <code>x-amz-server-side-encryption-customer-algorithm</code> header.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key", structure: false)]
    property sse_customer_key : String?
    # <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>Part number of the object being read. This is a positive integer between 1 and 10,000.
    # Effectively performs a 'ranged' GET request for the part specified. Useful for downloading
    # just a part of an object.</p>
    @[Protocol::Field(location: :query, name: "partNumber", structure: false)]
    property part_number : Int32?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @part_number = nil , @request_payer = nil , @sse_customer_key_md5 = nil , @sse_customer_key = nil , @sse_customer_algorithm = nil , @version_id = nil , @response_expires = nil , @response_content_type = nil , @response_content_language = nil , @response_content_encoding = nil , @response_content_disposition = nil , @response_cache_control = nil , @range = nil , @if_unmodified_since = nil , @if_none_match = nil , @if_modified_since = nil , @if_match = nil , @expected_bucket_owner = nil )
    end
  end

  class GetObjectOutput
    include RestXML::Structure

    # <p>Object data.</p>
    @[Protocol::Field(location: :body_io, structure: false)]
    property body : Bytes?
    # <p>Specifies whether the object retrieved was (true) or was not (false) a Delete Marker. If
    # false, this response header does not appear in the response.</p>
    @[Protocol::Field(location: :header, name: "x-amz-delete-marker", structure: false)]
    property delete_marker : Bool?
    # <p>Indicates that a range of bytes was specified.</p>
    @[Protocol::Field(location: :header, name: "accept-ranges", structure: false)]
    property accept_ranges : String?
    # <p>If the object expiration is configured (see PUT Bucket lifecycle), the response includes
    # this header. It includes the expiry-date and rule-id key-value pairs providing object
    # expiration information. The value of the rule-id is URL encoded.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expiration", structure: false)]
    property expiration : String?
    # <p>Provides information about object restoration operation and expiration time of the
    # restored object copy.</p>
    @[Protocol::Field(location: :header, name: "x-amz-restore", structure: false)]
    property restore : String?
    # <p>Last modified date of the object</p>
    @[Protocol::Field(location: :header, name: "Last-Modified", structure: false)]
    property last_modified : Time?
    # <p>Size of the body in bytes.</p>
    @[Protocol::Field(location: :header, name: "Content-Length", structure: false)]
    property content_length : Int64?
    # <p>An ETag is an opaque identifier assigned by a web server to a specific version of a
    # resource found at a URL.</p>
    @[Protocol::Field(location: :header, name: "ETag", structure: false)]
    property e_tag : String?
    # <p>This is set to the number of metadata entries not returned in <code>x-amz-meta</code>
    # headers. This can happen if you create metadata using an API like SOAP that supports more
    # flexible metadata than the REST API. For example, using SOAP, you can create metadata whose
    # values are not legal HTTP headers.</p>
    @[Protocol::Field(location: :header, name: "x-amz-missing-meta", structure: false)]
    property missing_meta : Int32?
    # <p>Version of the object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-version-id", structure: false)]
    property version_id : String?
    # <p>Specifies caching behavior along the request/reply chain.</p>
    @[Protocol::Field(location: :header, name: "Cache-Control", structure: false)]
    property cache_control : String?
    # <p>Specifies presentational information for the object.</p>
    @[Protocol::Field(location: :header, name: "Content-Disposition", structure: false)]
    property content_disposition : String?
    # <p>Specifies what content encodings have been applied to the object and thus what decoding
    # mechanisms must be applied to obtain the media-type referenced by the Content-Type header
    # field.</p>
    @[Protocol::Field(location: :header, name: "Content-Encoding", structure: false)]
    property content_encoding : String?
    # <p>The language the content is in.</p>
    @[Protocol::Field(location: :header, name: "Content-Language", structure: false)]
    property content_language : String?
    # <p>The portion of the object returned in the response.</p>
    @[Protocol::Field(location: :header, name: "Content-Range", structure: false)]
    property content_range : String?
    # <p>A standard MIME type describing the format of the object data.</p>
    @[Protocol::Field(location: :header, name: "Content-Type", structure: false)]
    property content_type : String?
    # <p>The date and time at which the object is no longer cacheable.</p>
    @[Protocol::Field(location: :header, name: "Expires", structure: false)]
    property expires : Time?
    # <p>If the bucket is configured as a website, redirects requests for this object to another
    # object in the same bucket or to an external URL. Amazon S3 stores the value of this header in
    # the object metadata.</p>
    @[Protocol::Field(location: :header, name: "x-amz-website-redirect-location", structure: false)]
    property website_redirect_location : String?
    # <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example,
    # AES256, aws:kms).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption", structure: false)]
    property server_side_encryption : String?
    # <p>A map of metadata to store with the object in S3.</p>
    @[Protocol::Field(location: :header_prefix, name: "x-amz-meta-", structure: false)]
    property metadata : Hash(String, String)?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header confirming the encryption algorithm used.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header to provide round-trip message integrity verification of
    # the customer-provided encryption key.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    # <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric
    # customer managed customer master key (CMK) that was used for the object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-aws-kms-key-id", structure: false)]
    property ssekms_key_id : String?
    # <p>Indicates whether the object uses an S3 Bucket Key for server-side encryption with AWS KMS (SSE-KMS).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-bucket-key-enabled", structure: false)]
    property bucket_key_enabled : Bool?
    # <p>Provides storage class information of the object. Amazon S3 returns this header for all
    # objects except for S3 Standard storage class objects.</p>
    @[Protocol::Field(location: :header, name: "x-amz-storage-class", structure: false)]
    property storage_class : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?
    # <p>Amazon S3 can return this if your request involves a bucket that is either a source or
    # destination in a replication rule.</p>
    @[Protocol::Field(location: :header, name: "x-amz-replication-status", structure: false)]
    property replication_status : String?
    # <p>The count of parts this object has.</p>
    @[Protocol::Field(location: :header, name: "x-amz-mp-parts-count", structure: false)]
    property parts_count : Int32?
    # <p>The number of tags, if any, on the object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-tagging-count", structure: false)]
    property tag_count : Int32?
    # <p>The Object Lock mode currently in place for this object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-mode", structure: false)]
    property object_lock_mode : String?
    # <p>The date and time when this object's Object Lock will expire.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-retain-until-date", structure: false)]
    property object_lock_retain_until_date : Time?
    # <p>Indicates whether this object has an active legal hold. This field is only returned if
    # you have permission to view an object's legal hold status. </p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-legal-hold", structure: false)]
    property object_lock_legal_hold_status : String?

    def initialize(@body = nil , @object_lock_retain_until_date = nil , @object_lock_mode = nil , @tag_count = nil , @parts_count = nil , @replication_status = nil , @request_charged = nil , @storage_class = nil , @bucket_key_enabled = nil , @ssekms_key_id = nil , @sse_customer_key_md5 = nil , @sse_customer_algorithm = nil , @metadata = nil , @server_side_encryption = nil , @website_redirect_location = nil , @expires = nil , @content_type = nil , @content_range = nil , @content_language = nil , @content_encoding = nil , @content_disposition = nil , @cache_control = nil , @version_id = nil , @missing_meta = nil , @e_tag = nil , @content_length = nil , @last_modified = nil , @restore = nil , @expiration = nil , @accept_ranges = nil , @delete_marker = nil , @object_lock_legal_hold_status = nil )
    end
  end

  class InvalidObjectState < Exception
    include RestXML::Structure

    #
    @[Protocol::Field(location: :body, name: "StorageClass", structure: false)]
    property storage_class : String?
    #
    @[Protocol::Field(location: :body, name: "AccessTier", structure: false)]
    property access_tier : String?

    def initialize(@storage_class = nil , @access_tier = nil )
    end
  end

  class NoSuchKey < Exception
    include RestXML::Structure


    def initialize()
    end
  end

  class GetObjectAclRequest
    include RestXML::Structure

    # <p>The bucket name that contains the object for which to get the ACL information. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The key of the object for which to get the ACL information.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>VersionId used to reference a specific version of the object.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @version_id = nil , @request_payer = nil , @expected_bucket_owner = nil )
    end
  end

  class GetObjectAclOutput
    include RestXML::Structure

    # <p> Container for the bucket owner's display name and ID.</p>
    @[Protocol::Field(location: :body, name: "Owner", structure: true)]
    property owner : OwnerStruct?
    # <p>A list of grants.</p>
    @[Protocol::Field(location: :body, name: "AccessControlList", structure: false)]
    property grants : Array(GrantStruct)?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@owner = nil , @grants = nil , @request_charged = nil )
    end
  end

  class GetObjectLegalHoldRequest
    include RestXML::Structure

    # <p>The bucket name containing the object whose Legal Hold status you want to retrieve. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The key name for the object whose Legal Hold status you want to retrieve.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>The version ID of the object whose Legal Hold status you want to retrieve.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @version_id = nil , @request_payer = nil , @expected_bucket_owner = nil )
    end
  end

  class ObjectLockLegalHoldStruct
    include RestXML::Structure

    # <p>Indicates whether the specified object has a Legal Hold in place.</p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String?

    def initialize(@status = nil )
    end
  end

  class GetObjectLegalHoldOutput
    include RestXML::Structure

    # <p>The current Legal Hold status for the specified object.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property legal_hold : ObjectLockLegalHoldStruct?

    def initialize(@legal_hold = nil )
    end
  end

  class GetObjectLockConfigurationRequest
    include RestXML::Structure

    # <p>The bucket whose Object Lock configuration you want to retrieve.</p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class DefaultRetentionStruct
    include RestXML::Structure

    # <p>The default Object Lock retention mode you want to apply to new objects placed in the
    # specified bucket.</p>
    @[Protocol::Field(location: :body, name: "Mode", structure: false)]
    property mode : String?
    # <p>The number of days that you want to specify for the default retention period.</p>
    @[Protocol::Field(location: :body, name: "Days", structure: false)]
    property days : Int32?
    # <p>The number of years that you want to specify for the default retention period.</p>
    @[Protocol::Field(location: :body, name: "Years", structure: false)]
    property years : Int32?

    def initialize(@mode = nil , @days = nil , @years = nil )
    end
  end

  class ObjectLockRuleStruct
    include RestXML::Structure

    # <p>The default retention period that you want to apply to new objects placed in the
    # specified bucket.</p>
    @[Protocol::Field(location: :body, name: "DefaultRetention", structure: true)]
    property default_retention : DefaultRetentionStruct?

    def initialize(@default_retention = nil )
    end
  end

  class ObjectLockConfigurationStruct
    include RestXML::Structure

    # <p>Indicates whether this bucket has an Object Lock configuration enabled.</p>
    @[Protocol::Field(location: :body, name: "ObjectLockEnabled", structure: false)]
    property object_lock_enabled : String?
    # <p>The Object Lock rule in place for the specified object.</p>
    @[Protocol::Field(location: :body, name: "Rule", structure: true)]
    property rule : ObjectLockRuleStruct?

    def initialize(@object_lock_enabled = nil , @rule = nil )
    end
  end

  class GetObjectLockConfigurationOutput
    include RestXML::Structure

    # <p>The specified bucket's Object Lock configuration.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property object_lock_configuration : ObjectLockConfigurationStruct?

    def initialize(@object_lock_configuration = nil )
    end
  end

  class GetObjectRetentionRequest
    include RestXML::Structure

    # <p>The bucket name containing the object whose retention settings you want to retrieve. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The key name for the object whose retention settings you want to retrieve.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>The version ID for the object whose retention settings you want to retrieve.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @version_id = nil , @request_payer = nil , @expected_bucket_owner = nil )
    end
  end

  class ObjectLockRetentionStruct
    include RestXML::Structure

    # <p>Indicates the Retention mode for the specified object.</p>
    @[Protocol::Field(location: :body, name: "Mode", structure: false)]
    property mode : String?
    # <p>The date on which this Object Lock Retention will expire.</p>
    @[Protocol::Field(location: :body, name: "RetainUntilDate", structure: false)]
    property retain_until_date : Time?

    def initialize(@mode = nil , @retain_until_date = nil )
    end
  end

  class GetObjectRetentionOutput
    include RestXML::Structure

    # <p>The container element for an object's retention settings.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property retention : ObjectLockRetentionStruct?

    def initialize(@retention = nil )
    end
  end

  class GetObjectTaggingRequest
    include RestXML::Structure

    # <p>The bucket name containing the object for which to get the tagging information. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Object key for which to get the tagging information.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>The versionId of the object for which to get the tagging information.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @version_id = nil , @expected_bucket_owner = nil )
    end
  end

  class GetObjectTaggingOutput
    include RestXML::Structure

    # <p>The versionId of the object for which you got the tagging information.</p>
    @[Protocol::Field(location: :header, name: "x-amz-version-id", structure: false)]
    property version_id : String?
    # <p>Contains the tag set.</p>
    @[Protocol::Field(location: :body, name: "TagSet", structure: false)]
    property tag_set : Array(TagStruct)

    def initialize(@tag_set, @version_id = nil )
    end
  end

  class GetObjectTorrentRequest
    include RestXML::Structure

    # <p>The name of the bucket containing the object for which to get the torrent files.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The object key for which to get the information.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @request_payer = nil , @expected_bucket_owner = nil )
    end
  end

  class GetObjectTorrentOutput
    include RestXML::Structure

    # <p>A Bencoded dictionary as defined by the BitTorrent specification</p>
    @[Protocol::Field(location: :body_io, structure: false)]
    property body : Bytes?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@body = nil , @request_charged = nil )
    end
  end

  class GetPublicAccessBlockRequest
    include RestXML::Structure

    # <p>The name of the Amazon S3 bucket whose <code>PublicAccessBlock</code> configuration you want
    # to retrieve. </p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class PublicAccessBlockConfigurationStruct
    include RestXML::Structure

    # <p>Specifies whether Amazon S3 should block public access control lists (ACLs) for this bucket
    # and objects in this bucket. Setting this element to <code>TRUE</code> causes the following
    # behavior:</p>
    # <ul>
    # <li>
    # <p>PUT Bucket acl and PUT Object acl calls fail if the specified ACL is
    # public.</p>
    # </li>
    # <li>
    # <p>PUT Object calls fail if the request includes a public ACL.</p>
    # </li>
    # <li>
    # <p>PUT Bucket calls fail if the request includes a public ACL.</p>
    # </li>
    # </ul>
    # <p>Enabling this setting doesn't affect existing policies or ACLs.</p>
    @[Protocol::Field(location: :body, name: "BlockPublicAcls", structure: false)]
    property block_public_acls : Bool?
    # <p>Specifies whether Amazon S3 should ignore public ACLs for this bucket and objects in this
    # bucket. Setting this element to <code>TRUE</code> causes Amazon S3 to ignore all public ACLs on
    # this bucket and objects in this bucket.</p>
    # <p>Enabling this setting doesn't affect the persistence of any existing ACLs and doesn't
    # prevent new public ACLs from being set.</p>
    @[Protocol::Field(location: :body, name: "IgnorePublicAcls", structure: false)]
    property ignore_public_acls : Bool?
    # <p>Specifies whether Amazon S3 should block public bucket policies for this bucket. Setting this
    # element to <code>TRUE</code> causes Amazon S3 to reject calls to PUT Bucket policy if the
    # specified bucket policy allows public access. </p>
    # <p>Enabling this setting doesn't affect existing bucket policies.</p>
    @[Protocol::Field(location: :body, name: "BlockPublicPolicy", structure: false)]
    property block_public_policy : Bool?
    # <p>Specifies whether Amazon S3 should restrict public bucket policies for this bucket. Setting
    # this element to <code>TRUE</code> restricts access to this bucket to only AWS service
    # principals and authorized users within this account if the bucket has a public
    # policy.</p>
    # <p>Enabling this setting doesn't affect previously stored bucket policies, except that
    # public and cross-account access within any public bucket policy, including non-public
    # delegation to specific accounts, is blocked.</p>
    @[Protocol::Field(location: :body, name: "RestrictPublicBuckets", structure: false)]
    property restrict_public_buckets : Bool?

    def initialize(@block_public_acls = nil , @ignore_public_acls = nil , @block_public_policy = nil , @restrict_public_buckets = nil )
    end
  end

  class GetPublicAccessBlockOutput
    include RestXML::Structure

    # <p>The <code>PublicAccessBlock</code> configuration currently in effect for this Amazon S3
    # bucket.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property public_access_block_configuration : PublicAccessBlockConfigurationStruct?

    def initialize(@public_access_block_configuration = nil )
    end
  end

  class HeadBucketRequest
    include RestXML::Structure

    # <p>The bucket name.</p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @expected_bucket_owner = nil )
    end
  end

  class NoSuchBucket < Exception
    include RestXML::Structure


    def initialize()
    end
  end

  class HeadObjectRequest
    include RestXML::Structure

    # <p>The name of the bucket containing the object.</p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Return the object only if its entity tag (ETag) is the same as the one specified,
    # otherwise return a 412 (precondition failed).</p>
    @[Protocol::Field(location: :header, name: "If-Match", structure: false)]
    property if_match : String?
    # <p>Return the object only if it has been modified since the specified time, otherwise
    # return a 304 (not modified).</p>
    @[Protocol::Field(location: :header, name: "If-Modified-Since", structure: false)]
    property if_modified_since : Time?
    # <p>Return the object only if its entity tag (ETag) is different from the one specified,
    # otherwise return a 304 (not modified).</p>
    @[Protocol::Field(location: :header, name: "If-None-Match", structure: false)]
    property if_none_match : String?
    # <p>Return the object only if it has not been modified since the specified time, otherwise
    # return a 412 (precondition failed).</p>
    @[Protocol::Field(location: :header, name: "If-Unmodified-Since", structure: false)]
    property if_unmodified_since : Time?
    # <p>The object key.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>Downloads the specified range bytes of an object. For more information about the HTTP
    # Range header, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35</a>.</p>
    # <note>
    # <p>Amazon S3 doesn't support retrieving multiple ranges of data per <code>GET</code>
    # request.</p>
    # </note>
    @[Protocol::Field(location: :header, name: "Range", structure: false)]
    property range : String?
    # <p>VersionId used to reference a specific version of the object.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    # <p>Specifies the algorithm to use to when encrypting the object (for example,
    # AES256).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This
    # value is used to store the object and then it is discarded; Amazon S3 does not store the
    # encryption key. The key must be appropriate for use with the algorithm specified in the
    # <code>x-amz-server-side-encryption-customer-algorithm</code> header.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key", structure: false)]
    property sse_customer_key : String?
    # <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>Part number of the object being read. This is a positive integer between 1 and 10,000.
    # Effectively performs a 'ranged' HEAD request for the part specified. Useful querying about
    # the size of the part and the number of parts in this object.</p>
    @[Protocol::Field(location: :query, name: "partNumber", structure: false)]
    property part_number : Int32?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @if_match = nil , @if_modified_since = nil , @if_none_match = nil , @if_unmodified_since = nil , @range = nil , @version_id = nil , @sse_customer_algorithm = nil , @sse_customer_key = nil , @sse_customer_key_md5 = nil , @request_payer = nil , @part_number = nil , @expected_bucket_owner = nil )
    end
  end

  class HeadObjectOutput
    include RestXML::Structure

    # <p>Specifies whether the object retrieved was (true) or was not (false) a Delete Marker. If
    # false, this response header does not appear in the response.</p>
    @[Protocol::Field(location: :header, name: "x-amz-delete-marker", structure: false)]
    property delete_marker : Bool?
    # <p>Indicates that a range of bytes was specified.</p>
    @[Protocol::Field(location: :header, name: "accept-ranges", structure: false)]
    property accept_ranges : String?
    # <p>If the object expiration is configured (see PUT Bucket lifecycle), the response includes
    # this header. It includes the expiry-date and rule-id key-value pairs providing object
    # expiration information. The value of the rule-id is URL encoded.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expiration", structure: false)]
    property expiration : String?
    # <p>If the object is an archived object (an object whose storage class is GLACIER), the
    # response includes this header if either the archive restoration is in progress (see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html">RestoreObject</a> or an archive copy is already restored.</p>
    #
    # <p> If an archive copy is already restored, the header value indicates when Amazon S3 is
    # scheduled to delete the object copy. For example:</p>
    #
    # <p>
    # <code>x-amz-restore: ongoing-request="false", expiry-date="Fri, 23 Dec 2012 00:00:00
    # GMT"</code>
    # </p>
    #
    # <p>If the object restoration is in progress, the header returns the value
    # <code>ongoing-request="true"</code>.</p>
    #
    # <p>For more information about archiving objects, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html#lifecycle-transition-general-considerations">Transitioning Objects: General Considerations</a>.</p>
    @[Protocol::Field(location: :header, name: "x-amz-restore", structure: false)]
    property restore : String?
    # <p>The archive state of the head object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-archive-status", structure: false)]
    property archive_status : String?
    # <p>Last modified date of the object</p>
    @[Protocol::Field(location: :header, name: "Last-Modified", structure: false)]
    property last_modified : Time?
    # <p>Size of the body in bytes.</p>
    @[Protocol::Field(location: :header, name: "Content-Length", structure: false)]
    property content_length : Int64?
    # <p>An ETag is an opaque identifier assigned by a web server to a specific version of a
    # resource found at a URL.</p>
    @[Protocol::Field(location: :header, name: "ETag", structure: false)]
    property e_tag : String?
    # <p>This is set to the number of metadata entries not returned in <code>x-amz-meta</code>
    # headers. This can happen if you create metadata using an API like SOAP that supports more
    # flexible metadata than the REST API. For example, using SOAP, you can create metadata whose
    # values are not legal HTTP headers.</p>
    @[Protocol::Field(location: :header, name: "x-amz-missing-meta", structure: false)]
    property missing_meta : Int32?
    # <p>Version of the object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-version-id", structure: false)]
    property version_id : String?
    # <p>Specifies caching behavior along the request/reply chain.</p>
    @[Protocol::Field(location: :header, name: "Cache-Control", structure: false)]
    property cache_control : String?
    # <p>Specifies presentational information for the object.</p>
    @[Protocol::Field(location: :header, name: "Content-Disposition", structure: false)]
    property content_disposition : String?
    # <p>Specifies what content encodings have been applied to the object and thus what decoding
    # mechanisms must be applied to obtain the media-type referenced by the Content-Type header
    # field.</p>
    @[Protocol::Field(location: :header, name: "Content-Encoding", structure: false)]
    property content_encoding : String?
    # <p>The language the content is in.</p>
    @[Protocol::Field(location: :header, name: "Content-Language", structure: false)]
    property content_language : String?
    # <p>A standard MIME type describing the format of the object data.</p>
    @[Protocol::Field(location: :header, name: "Content-Type", structure: false)]
    property content_type : String?
    # <p>The date and time at which the object is no longer cacheable.</p>
    @[Protocol::Field(location: :header, name: "Expires", structure: false)]
    property expires : Time?
    # <p>If the bucket is configured as a website, redirects requests for this object to another
    # object in the same bucket or to an external URL. Amazon S3 stores the value of this header in
    # the object metadata.</p>
    @[Protocol::Field(location: :header, name: "x-amz-website-redirect-location", structure: false)]
    property website_redirect_location : String?
    # <p>If the object is stored using server-side encryption either with an AWS KMS customer
    # master key (CMK) or an Amazon S3-managed encryption key, the response includes this header with
    # the value of the server-side encryption algorithm used when storing this object in Amazon
    # S3 (for example, AES256, aws:kms).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption", structure: false)]
    property server_side_encryption : String?
    # <p>A map of metadata to store with the object in S3.</p>
    @[Protocol::Field(location: :header_prefix, name: "x-amz-meta-", structure: false)]
    property metadata : Hash(String, String)?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header confirming the encryption algorithm used.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header to provide round-trip message integrity verification of
    # the customer-provided encryption key.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    # <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric
    # customer managed customer master key (CMK) that was used for the object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-aws-kms-key-id", structure: false)]
    property ssekms_key_id : String?
    # <p>Indicates whether the object uses an S3 Bucket Key for server-side encryption with AWS KMS (SSE-KMS).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-bucket-key-enabled", structure: false)]
    property bucket_key_enabled : Bool?
    # <p>Provides storage class information of the object. Amazon S3 returns this header for all
    # objects except for S3 Standard storage class objects.</p>
    #
    # <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage
    # Classes</a>.</p>
    @[Protocol::Field(location: :header, name: "x-amz-storage-class", structure: false)]
    property storage_class : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?
    # <p>Amazon S3 can return this header if your request involves a bucket that is either a source or
    # a destination in a replication rule.</p>
    #
    # <p>In replication, you have a source bucket on which you configure replication and
    # destination bucket or buckets where Amazon S3 stores object replicas. When you request an object
    # (<code>GetObject</code>) or object metadata (<code>HeadObject</code>) from these
    # buckets, Amazon S3 will return the <code>x-amz-replication-status</code> header in the response
    # as follows:</p>
    # <ul>
    # <li>
    # <p>If requesting an object from the source bucket — Amazon S3 will return the
    # <code>x-amz-replication-status</code> header if the object in your request is
    # eligible for replication.</p>
    # <p> For example, suppose that in your replication configuration, you specify object
    # prefix <code>TaxDocs</code> requesting Amazon S3 to replicate objects with key prefix
    # <code>TaxDocs</code>. Any objects you upload with this key name prefix, for
    # example <code>TaxDocs/document1.pdf</code>, are eligible for replication. For any
    # object request with this key name prefix, Amazon S3 will return the
    # <code>x-amz-replication-status</code> header with value PENDING, COMPLETED or
    # FAILED indicating object replication status.</p>
    # </li>
    # <li>
    # <p>If requesting an object from a destination bucket — Amazon S3 will return the
    # <code>x-amz-replication-status</code> header with value REPLICA if the object in
    # your request is a replica that Amazon S3 created and there is no replica modification
    # replication in progress.</p>
    # </li>
    # <li>
    # <p>When replicating objects to multiple destination buckets the
    # <code>x-amz-replication-status</code> header acts differently. The header of the
    # source object will only return a value of COMPLETED when replication is successful to
    # all destinations. The header will remain at value PENDING until replication has
    # completed for all destinations. If one or more destinations fails replication the
    # header will return FAILED. </p>
    # </li>
    # </ul>
    #
    # <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Replication</a>.</p>
    @[Protocol::Field(location: :header, name: "x-amz-replication-status", structure: false)]
    property replication_status : String?
    # <p>The count of parts this object has.</p>
    @[Protocol::Field(location: :header, name: "x-amz-mp-parts-count", structure: false)]
    property parts_count : Int32?
    # <p>The Object Lock mode, if any, that's in effect for this object. This header is only
    # returned if the requester has the <code>s3:GetObjectRetention</code> permission. For more
    # information about S3 Object Lock, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Object
    # Lock</a>. </p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-mode", structure: false)]
    property object_lock_mode : String?
    # <p>The date and time when the Object Lock retention period expires. This header is only
    # returned if the requester has the <code>s3:GetObjectRetention</code> permission.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-retain-until-date", structure: false)]
    property object_lock_retain_until_date : Time?
    # <p>Specifies whether a legal hold is in effect for this object. This header is only
    # returned if the requester has the <code>s3:GetObjectLegalHold</code> permission. This
    # header is not returned if the specified version of this object has never had a legal hold
    # applied. For more information about S3 Object Lock, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Object Lock</a>.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-legal-hold", structure: false)]
    property object_lock_legal_hold_status : String?

    def initialize(@delete_marker = nil , @object_lock_retain_until_date = nil , @object_lock_mode = nil , @parts_count = nil , @replication_status = nil , @request_charged = nil , @storage_class = nil , @bucket_key_enabled = nil , @ssekms_key_id = nil , @sse_customer_key_md5 = nil , @sse_customer_algorithm = nil , @metadata = nil , @server_side_encryption = nil , @website_redirect_location = nil , @expires = nil , @content_type = nil , @content_language = nil , @content_encoding = nil , @content_disposition = nil , @cache_control = nil , @version_id = nil , @missing_meta = nil , @e_tag = nil , @content_length = nil , @last_modified = nil , @archive_status = nil , @restore = nil , @expiration = nil , @accept_ranges = nil , @object_lock_legal_hold_status = nil )
    end
  end

  class ListBucketAnalyticsConfigurationsRequest
    include RestXML::Structure

    # <p>The name of the bucket from which analytics configurations are retrieved.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ContinuationToken that represents a placeholder from where this request should
    # begin.</p>
    @[Protocol::Field(location: :query, name: "continuation-token", structure: false)]
    property continuation_token : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @continuation_token = nil , @expected_bucket_owner = nil )
    end
  end

  class ListBucketAnalyticsConfigurationsOutput
    include RestXML::Structure

    # <p>Indicates whether the returned list of analytics configurations is complete. A value of
    # true indicates that the list is not complete and the NextContinuationToken will be provided
    # for a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "IsTruncated", structure: false)]
    property is_truncated : Bool?
    # <p>The marker that is used as a starting point for this analytics configuration list
    # response. This value is present if it was sent in the request.</p>
    @[Protocol::Field(location: :body, name: "ContinuationToken", structure: false)]
    property continuation_token : String?
    # <p>
    # <code>NextContinuationToken</code> is sent when <code>isTruncated</code> is true, which
    # indicates that there are more analytics configurations to list. The next request must
    # include this <code>NextContinuationToken</code>. The token is obfuscated and is not a
    # usable value.</p>
    @[Protocol::Field(location: :body, name: "NextContinuationToken", structure: false)]
    property next_continuation_token : String?
    # <p>The list of analytics configurations for a bucket.</p>
    @[Protocol::Field(location: :body, name: "AnalyticsConfiguration", structure: false)]
    property analytics_configuration_list : Array(AnalyticsConfigurationStruct)?

    def initialize(@is_truncated = nil , @continuation_token = nil , @next_continuation_token = nil , @analytics_configuration_list = nil )
    end
  end

  class ListBucketIntelligentTieringConfigurationsRequest
    include RestXML::Structure

    # <p>The name of the Amazon S3 bucket whose configuration you want to modify or retrieve.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ContinuationToken that represents a placeholder from where this request should
    # begin.</p>
    @[Protocol::Field(location: :query, name: "continuation-token", structure: false)]
    property continuation_token : String?

    def initialize(@bucket, @continuation_token = nil )
    end
  end

  class ListBucketIntelligentTieringConfigurationsOutput
    include RestXML::Structure

    # <p>Indicates whether the returned list of analytics configurations is complete. A value of
    # true indicates that the list is not complete and the NextContinuationToken will be provided
    # for a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "IsTruncated", structure: false)]
    property is_truncated : Bool?
    # <p>The ContinuationToken that represents a placeholder from where this request should
    # begin.</p>
    @[Protocol::Field(location: :body, name: "ContinuationToken", structure: false)]
    property continuation_token : String?
    # <p>The marker used to continue this inventory configuration listing. Use the
    # <code>NextContinuationToken</code> from this response to continue the listing in a
    # subsequent request. The continuation token is an opaque value that Amazon S3 understands.</p>
    @[Protocol::Field(location: :body, name: "NextContinuationToken", structure: false)]
    property next_continuation_token : String?
    # <p>The list of S3 Intelligent-Tiering configurations for a bucket.</p>
    @[Protocol::Field(location: :body, name: "IntelligentTieringConfiguration", structure: false)]
    property intelligent_tiering_configuration_list : Array(IntelligentTieringConfigurationStruct)?

    def initialize(@is_truncated = nil , @continuation_token = nil , @next_continuation_token = nil , @intelligent_tiering_configuration_list = nil )
    end
  end

  class ListBucketInventoryConfigurationsRequest
    include RestXML::Structure

    # <p>The name of the bucket containing the inventory configurations to retrieve.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The marker used to continue an inventory configuration listing that has been truncated.
    # Use the NextContinuationToken from a previously truncated list response to continue the
    # listing. The continuation token is an opaque value that Amazon S3 understands.</p>
    @[Protocol::Field(location: :query, name: "continuation-token", structure: false)]
    property continuation_token : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @continuation_token = nil , @expected_bucket_owner = nil )
    end
  end

  class ListBucketInventoryConfigurationsOutput
    include RestXML::Structure

    # <p>If sent in the request, the marker that is used as a starting point for this inventory
    # configuration list response.</p>
    @[Protocol::Field(location: :body, name: "ContinuationToken", structure: false)]
    property continuation_token : String?
    # <p>The list of inventory configurations for a bucket.</p>
    @[Protocol::Field(location: :body, name: "InventoryConfiguration", structure: false)]
    property inventory_configuration_list : Array(InventoryConfigurationStruct)?
    # <p>Tells whether the returned list of inventory configurations is complete. A value of true
    # indicates that the list is not complete and the NextContinuationToken is provided for a
    # subsequent request.</p>
    @[Protocol::Field(location: :body, name: "IsTruncated", structure: false)]
    property is_truncated : Bool?
    # <p>The marker used to continue this inventory configuration listing. Use the
    # <code>NextContinuationToken</code> from this response to continue the listing in a
    # subsequent request. The continuation token is an opaque value that Amazon S3 understands.</p>
    @[Protocol::Field(location: :body, name: "NextContinuationToken", structure: false)]
    property next_continuation_token : String?

    def initialize(@continuation_token = nil , @inventory_configuration_list = nil , @is_truncated = nil , @next_continuation_token = nil )
    end
  end

  class ListBucketMetricsConfigurationsRequest
    include RestXML::Structure

    # <p>The name of the bucket containing the metrics configurations to retrieve.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The marker that is used to continue a metrics configuration listing that has been
    # truncated. Use the NextContinuationToken from a previously truncated list response to
    # continue the listing. The continuation token is an opaque value that Amazon S3
    # understands.</p>
    @[Protocol::Field(location: :query, name: "continuation-token", structure: false)]
    property continuation_token : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @continuation_token = nil , @expected_bucket_owner = nil )
    end
  end

  class ListBucketMetricsConfigurationsOutput
    include RestXML::Structure

    # <p>Indicates whether the returned list of metrics configurations is complete. A value of
    # true indicates that the list is not complete and the NextContinuationToken will be provided
    # for a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "IsTruncated", structure: false)]
    property is_truncated : Bool?
    # <p>The marker that is used as a starting point for this metrics configuration list
    # response. This value is present if it was sent in the request.</p>
    @[Protocol::Field(location: :body, name: "ContinuationToken", structure: false)]
    property continuation_token : String?
    # <p>The marker used to continue a metrics configuration listing that has been truncated. Use
    # the <code>NextContinuationToken</code> from a previously truncated list response to
    # continue the listing. The continuation token is an opaque value that Amazon S3
    # understands.</p>
    @[Protocol::Field(location: :body, name: "NextContinuationToken", structure: false)]
    property next_continuation_token : String?
    # <p>The list of metrics configurations for a bucket.</p>
    @[Protocol::Field(location: :body, name: "MetricsConfiguration", structure: false)]
    property metrics_configuration_list : Array(MetricsConfigurationStruct)?

    def initialize(@is_truncated = nil , @continuation_token = nil , @next_continuation_token = nil , @metrics_configuration_list = nil )
    end
  end

  class BucketStruct
    include RestXML::Structure

    # <p>The name of the bucket.</p>
    @[Protocol::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>Date the bucket was created. This date can change when making changes to your bucket, such as editing its bucket policy.</p>
    @[Protocol::Field(location: :body, name: "CreationDate", structure: false)]
    property creation_date : Time?

    def initialize(@name = nil , @creation_date = nil )
    end
  end

  class ListBucketsOutput
    include RestXML::Structure

    # <p>The list of buckets owned by the requestor.</p>
    @[Protocol::Field(location: :body, name: "Buckets", structure: false)]
    property buckets : Array(BucketStruct)?
    # <p>The owner of the buckets listed.</p>
    @[Protocol::Field(location: :body, name: "Owner", structure: true)]
    property owner : OwnerStruct?

    def initialize(@buckets = nil , @owner = nil )
    end
  end

  class ListMultipartUploadsRequest
    include RestXML::Structure

    # <p>The name of the bucket to which the multipart upload was initiated. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Character you use to group keys.</p>
    # <p>All keys that contain the same string between the prefix, if specified, and the first
    # occurrence of the delimiter after the prefix are grouped under a single result element,
    # <code>CommonPrefixes</code>. If you don't specify the prefix parameter, then the
    # substring starts at the beginning of the key. The keys that are grouped under
    # <code>CommonPrefixes</code> result element are not returned elsewhere in the
    # response.</p>
    @[Protocol::Field(location: :query, name: "delimiter", structure: false)]
    property delimiter : String?
    #
    @[Protocol::Field(location: :query, name: "encoding-type", structure: false)]
    property encoding_type : String?
    # <p>Together with upload-id-marker, this parameter specifies the multipart upload after
    # which listing should begin.</p>
    # <p>If <code>upload-id-marker</code> is not specified, only the keys lexicographically
    # greater than the specified <code>key-marker</code> will be included in the list.</p>
    #
    # <p>If <code>upload-id-marker</code> is specified, any multipart uploads for a key equal to
    # the <code>key-marker</code> might also be included, provided those multipart uploads have
    # upload IDs lexicographically greater than the specified
    # <code>upload-id-marker</code>.</p>
    @[Protocol::Field(location: :query, name: "key-marker", structure: false)]
    property key_marker : String?
    # <p>Sets the maximum number of multipart uploads, from 1 to 1,000, to return in the response
    # body. 1,000 is the maximum number of uploads that can be returned in a response.</p>
    @[Protocol::Field(location: :query, name: "max-uploads", structure: false)]
    property max_uploads : Int32?
    # <p>Lists in-progress uploads only for those keys that begin with the specified prefix. You
    # can use prefixes to separate a bucket into different grouping of keys. (You can think of
    # using prefix to make groups in the same way you'd use a folder in a file system.)</p>
    @[Protocol::Field(location: :query, name: "prefix", structure: false)]
    property prefix : String?
    # <p>Together with key-marker, specifies the multipart upload after which listing should
    # begin. If key-marker is not specified, the upload-id-marker parameter is ignored.
    # Otherwise, any multipart uploads for a key equal to the key-marker might be included in the
    # list only if they have an upload ID lexicographically greater than the specified
    # <code>upload-id-marker</code>.</p>
    @[Protocol::Field(location: :query, name: "upload-id-marker", structure: false)]
    property upload_id_marker : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @delimiter = nil , @encoding_type = nil , @key_marker = nil , @max_uploads = nil , @prefix = nil , @upload_id_marker = nil , @expected_bucket_owner = nil )
    end
  end

  class InitiatorStruct
    include RestXML::Structure

    # <p>If the principal is an AWS account, it provides the Canonical User ID. If the principal
    # is an IAM User, it provides a user ARN value.</p>
    @[Protocol::Field(location: :body, name: "ID", structure: false)]
    property id : String?
    # <p>Name of the Principal.</p>
    @[Protocol::Field(location: :body, name: "DisplayName", structure: false)]
    property display_name : String?

    def initialize(@id = nil , @display_name = nil )
    end
  end

  class MultipartUploadStruct
    include RestXML::Structure

    # <p>Upload ID that identifies the multipart upload.</p>
    @[Protocol::Field(location: :body, name: "UploadId", structure: false)]
    property upload_id : String?
    # <p>Key of the object for which the multipart upload was initiated.</p>
    @[Protocol::Field(location: :body, name: "Key", structure: false)]
    property key : String?
    # <p>Date and time at which the multipart upload was initiated.</p>
    @[Protocol::Field(location: :body, name: "Initiated", structure: false)]
    property initiated : Time?
    # <p>The class of storage used to store the object.</p>
    @[Protocol::Field(location: :body, name: "StorageClass", structure: false)]
    property storage_class : String?
    # <p>Specifies the owner of the object that is part of the multipart upload. </p>
    @[Protocol::Field(location: :body, name: "Owner", structure: true)]
    property owner : OwnerStruct?
    # <p>Identifies who initiated the multipart upload.</p>
    @[Protocol::Field(location: :body, name: "Initiator", structure: true)]
    property initiator : InitiatorStruct?

    def initialize(@upload_id = nil , @key = nil , @initiated = nil , @storage_class = nil , @owner = nil , @initiator = nil )
    end
  end

  class CommonPrefixStruct
    include RestXML::Structure

    # <p>Container for the specified common prefix.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?

    def initialize(@prefix = nil )
    end
  end

  class ListMultipartUploadsOutput
    include RestXML::Structure

    # <p>The name of the bucket to which the multipart upload was initiated.</p>
    @[Protocol::Field(location: :body, name: "Bucket", structure: false)]
    property bucket : String?
    # <p>The key at or after which the listing began.</p>
    @[Protocol::Field(location: :body, name: "KeyMarker", structure: false)]
    property key_marker : String?
    # <p>Upload ID after which listing began.</p>
    @[Protocol::Field(location: :body, name: "UploadIdMarker", structure: false)]
    property upload_id_marker : String?
    # <p>When a list is truncated, this element specifies the value that should be used for the
    # key-marker request parameter in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "NextKeyMarker", structure: false)]
    property next_key_marker : String?
    # <p>When a prefix is provided in the request, this field contains the specified prefix. The
    # result contains only keys starting with the specified prefix.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    # <p>Contains the delimiter you specified in the request. If you don't specify a delimiter in
    # your request, this element is absent from the response.</p>
    @[Protocol::Field(location: :body, name: "Delimiter", structure: false)]
    property delimiter : String?
    # <p>When a list is truncated, this element specifies the value that should be used for the
    # <code>upload-id-marker</code> request parameter in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "NextUploadIdMarker", structure: false)]
    property next_upload_id_marker : String?
    # <p>Maximum number of multipart uploads that could have been included in the
    # response.</p>
    @[Protocol::Field(location: :body, name: "MaxUploads", structure: false)]
    property max_uploads : Int32?
    # <p>Indicates whether the returned list of multipart uploads is truncated. A value of true
    # indicates that the list was truncated. The list can be truncated if the number of multipart
    # uploads exceeds the limit allowed or specified by max uploads.</p>
    @[Protocol::Field(location: :body, name: "IsTruncated", structure: false)]
    property is_truncated : Bool?
    # <p>Container for elements related to a particular multipart upload. A response can contain
    # zero or more <code>Upload</code> elements.</p>
    @[Protocol::Field(location: :body, name: "Upload", structure: false)]
    property uploads : Array(MultipartUploadStruct)?
    # <p>If you specify a delimiter in the request, then the result returns each distinct key
    # prefix containing the delimiter in a <code>CommonPrefixes</code> element. The distinct key
    # prefixes are returned in the <code>Prefix</code> child element.</p>
    @[Protocol::Field(location: :body, name: "CommonPrefixes", structure: false)]
    property common_prefixes : Array(CommonPrefixStruct)?
    # <p>Encoding type used by Amazon S3 to encode object keys in the response.</p>
    # <p>If you specify <code>encoding-type</code> request parameter, Amazon S3 includes this element
    # in the response, and returns encoded key name values in the following response
    # elements:</p>
    #
    # <p>
    # <code>Delimiter</code>, <code>KeyMarker</code>, <code>Prefix</code>,
    # <code>NextKeyMarker</code>, <code>Key</code>.</p>
    @[Protocol::Field(location: :body, name: "EncodingType", structure: false)]
    property encoding_type : String?

    def initialize(@bucket = nil , @key_marker = nil , @upload_id_marker = nil , @next_key_marker = nil , @prefix = nil , @delimiter = nil , @next_upload_id_marker = nil , @max_uploads = nil , @is_truncated = nil , @uploads = nil , @common_prefixes = nil , @encoding_type = nil )
    end
  end

  class ListObjectsRequest
    include RestXML::Structure

    # <p>The name of the bucket containing the objects.</p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>A delimiter is a character you use to group keys.</p>
    @[Protocol::Field(location: :query, name: "delimiter", structure: false)]
    property delimiter : String?
    #
    @[Protocol::Field(location: :query, name: "encoding-type", structure: false)]
    property encoding_type : String?
    # <p>Specifies the key to start with when listing objects in a bucket.</p>
    @[Protocol::Field(location: :query, name: "marker", structure: false)]
    property marker : String?
    # <p>Sets the maximum number of keys returned in the response. By default the API returns up
    # to 1,000 key names. The response might contain fewer keys but will never contain more.
    # </p>
    @[Protocol::Field(location: :query, name: "max-keys", structure: false)]
    property max_keys : Int32?
    # <p>Limits the response to keys that begin with the specified prefix.</p>
    @[Protocol::Field(location: :query, name: "prefix", structure: false)]
    property prefix : String?
    # <p>Confirms that the requester knows that she or he will be charged for the list objects
    # request. Bucket owners need not specify this parameter in their requests.</p>
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @delimiter = nil , @encoding_type = nil , @marker = nil , @max_keys = nil , @prefix = nil , @request_payer = nil , @expected_bucket_owner = nil )
    end
  end

  class ObjectStruct
    include RestXML::Structure

    # <p>The name that you assign to an object. You use the object key to retrieve the
    # object.</p>
    @[Protocol::Field(location: :body, name: "Key", structure: false)]
    property key : String?
    # <p>The date the Object was Last Modified</p>
    @[Protocol::Field(location: :body, name: "LastModified", structure: false)]
    property last_modified : Time?
    # <p>The entity tag is a hash of the object. The ETag reflects changes only to the contents
    # of an object, not its metadata. The ETag may or may not be an MD5 digest of the object
    # data. Whether or not it is depends on how the object was created and how it is encrypted as
    # described below:</p>
    # <ul>
    # <li>
    # <p>Objects created by the PUT Object, POST Object, or Copy operation, or through the
    # AWS Management Console, and are encrypted by SSE-S3 or plaintext, have ETags that are
    # an MD5 digest of their object data.</p>
    # </li>
    # <li>
    # <p>Objects created by the PUT Object, POST Object, or Copy operation, or through the
    # AWS Management Console, and are encrypted by SSE-C or SSE-KMS, have ETags that are
    # not an MD5 digest of their object data.</p>
    # </li>
    # <li>
    # <p>If an object is created by either the Multipart Upload or Part Copy operation, the
    # ETag is not an MD5 digest, regardless of the method of encryption.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "ETag", structure: false)]
    property e_tag : String?
    # <p>Size in bytes of the object</p>
    @[Protocol::Field(location: :body, name: "Size", structure: false)]
    property size : Int32?
    # <p>The class of storage used to store the object.</p>
    @[Protocol::Field(location: :body, name: "StorageClass", structure: false)]
    property storage_class : String?
    # <p>The owner of the object</p>
    @[Protocol::Field(location: :body, name: "Owner", structure: true)]
    property owner : OwnerStruct?

    def initialize(@key = nil , @last_modified = nil , @e_tag = nil , @size = nil , @storage_class = nil , @owner = nil )
    end
  end

  class ListObjectsOutput
    include RestXML::Structure

    # <p>A flag that indicates whether Amazon S3 returned all of the results that satisfied the search
    # criteria.</p>
    @[Protocol::Field(location: :body, name: "IsTruncated", structure: false)]
    property is_truncated : Bool?
    # <p>Indicates where in the bucket listing begins. Marker is included in the response if it
    # was sent with the request.</p>
    @[Protocol::Field(location: :body, name: "Marker", structure: false)]
    property marker : String?
    # <p>When response is truncated (the IsTruncated element value in the response is true), you
    # can use the key name in this field as marker in the subsequent request to get next set of
    # objects. Amazon S3 lists objects in alphabetical order Note: This element is returned only if
    # you have delimiter request parameter specified. If response does not include the NextMarker
    # and it is truncated, you can use the value of the last Key in the response as the marker in
    # the subsequent request to get the next set of object keys.</p>
    @[Protocol::Field(location: :body, name: "NextMarker", structure: false)]
    property next_marker : String?
    # <p>Metadata about each object returned.</p>
    @[Protocol::Field(location: :body, name: "Contents", structure: false)]
    property contents : Array(ObjectStruct)?
    # <p>The bucket name.</p>
    @[Protocol::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>Keys that begin with the indicated prefix.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    # <p>Causes keys that contain the same string between the prefix and the first occurrence of
    # the delimiter to be rolled up into a single result element in the
    # <code>CommonPrefixes</code> collection. These rolled-up keys are not returned elsewhere
    # in the response. Each rolled-up result counts as only one return against the
    # <code>MaxKeys</code> value.</p>
    @[Protocol::Field(location: :body, name: "Delimiter", structure: false)]
    property delimiter : String?
    # <p>The maximum number of keys returned in the response body.</p>
    @[Protocol::Field(location: :body, name: "MaxKeys", structure: false)]
    property max_keys : Int32?
    # <p>All of the keys rolled up in a common prefix count as a single return when calculating
    # the number of returns. </p>
    #
    # <p>A response can contain CommonPrefixes only if you specify a delimiter.</p>
    #
    # <p>CommonPrefixes contains all (if there are any) keys between Prefix and the next
    # occurrence of the string specified by the delimiter.</p>
    #
    # <p> CommonPrefixes lists keys that act like subdirectories in the directory specified by
    # Prefix.</p>
    #
    # <p>For example, if the prefix is notes/ and the delimiter is a slash (/) as in
    # notes/summer/july, the common prefix is notes/summer/. All of the keys that roll up into a
    # common prefix count as a single return when calculating the number of returns.</p>
    @[Protocol::Field(location: :body, name: "CommonPrefixes", structure: false)]
    property common_prefixes : Array(CommonPrefixStruct)?
    # <p>Encoding type used by Amazon S3 to encode object keys in the response.</p>
    @[Protocol::Field(location: :body, name: "EncodingType", structure: false)]
    property encoding_type : String?

    def initialize(@is_truncated = nil , @marker = nil , @next_marker = nil , @contents = nil , @name = nil , @prefix = nil , @delimiter = nil , @max_keys = nil , @common_prefixes = nil , @encoding_type = nil )
    end
  end

  class ListObjectsV2Request
    include RestXML::Structure

    # <p>Bucket name to list. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>A delimiter is a character you use to group keys.</p>
    @[Protocol::Field(location: :query, name: "delimiter", structure: false)]
    property delimiter : String?
    # <p>Encoding type used by Amazon S3 to encode object keys in the response.</p>
    @[Protocol::Field(location: :query, name: "encoding-type", structure: false)]
    property encoding_type : String?
    # <p>Sets the maximum number of keys returned in the response. By default the API returns up
    # to 1,000 key names. The response might contain fewer keys but will never contain
    # more.</p>
    @[Protocol::Field(location: :query, name: "max-keys", structure: false)]
    property max_keys : Int32?
    # <p>Limits the response to keys that begin with the specified prefix.</p>
    @[Protocol::Field(location: :query, name: "prefix", structure: false)]
    property prefix : String?
    # <p>ContinuationToken indicates Amazon S3 that the list is being continued on this bucket with a
    # token. ContinuationToken is obfuscated and is not a real key.</p>
    @[Protocol::Field(location: :query, name: "continuation-token", structure: false)]
    property continuation_token : String?
    # <p>The owner field is not present in listV2 by default, if you want to return owner field
    # with each key in the result then set the fetch owner field to true.</p>
    @[Protocol::Field(location: :query, name: "fetch-owner", structure: false)]
    property fetch_owner : Bool?
    # <p>StartAfter is where you want Amazon S3 to start listing from. Amazon S3 starts listing after this
    # specified key. StartAfter can be any key in the bucket.</p>
    @[Protocol::Field(location: :query, name: "start-after", structure: false)]
    property start_after : String?
    # <p>Confirms that the requester knows that she or he will be charged for the list objects
    # request in V2 style. Bucket owners need not specify this parameter in their
    # requests.</p>
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @delimiter = nil , @encoding_type = nil , @max_keys = nil , @prefix = nil , @continuation_token = nil , @fetch_owner = nil , @start_after = nil , @request_payer = nil , @expected_bucket_owner = nil )
    end
  end

  class ListObjectsV2Output
    include RestXML::Structure

    # <p>Set to false if all of the results were returned. Set to true if more keys are available
    # to return. If the number of results exceeds that specified by MaxKeys, all of the results
    # might not be returned.</p>
    @[Protocol::Field(location: :body, name: "IsTruncated", structure: false)]
    property is_truncated : Bool?
    # <p>Metadata about each object returned.</p>
    @[Protocol::Field(location: :body, name: "Contents", structure: false)]
    property contents : Array(ObjectStruct)?
    # <p>The bucket name.</p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p> Keys that begin with the indicated prefix.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    # <p>Causes keys that contain the same string between the prefix and the first occurrence of
    # the delimiter to be rolled up into a single result element in the CommonPrefixes
    # collection. These rolled-up keys are not returned elsewhere in the response. Each rolled-up
    # result counts as only one return against the <code>MaxKeys</code> value.</p>
    @[Protocol::Field(location: :body, name: "Delimiter", structure: false)]
    property delimiter : String?
    # <p>Sets the maximum number of keys returned in the response. By default the API returns up
    # to 1,000 key names. The response might contain fewer keys but will never contain
    # more.</p>
    @[Protocol::Field(location: :body, name: "MaxKeys", structure: false)]
    property max_keys : Int32?
    # <p>All of the keys rolled up into a common prefix count as a single return when calculating
    # the number of returns.</p>
    #
    # <p>A response can contain <code>CommonPrefixes</code> only if you specify a
    # delimiter.</p>
    #
    # <p>
    # <code>CommonPrefixes</code> contains all (if there are any) keys between
    # <code>Prefix</code> and the next occurrence of the string specified by a
    # delimiter.</p>
    #
    # <p>
    # <code>CommonPrefixes</code> lists keys that act like subdirectories in the directory
    # specified by <code>Prefix</code>.</p>
    #
    # <p>For example, if the prefix is <code>notes/</code> and the delimiter is a slash
    # (<code>/</code>) as in <code>notes/summer/july</code>, the common prefix is
    # <code>notes/summer/</code>. All of the keys that roll up into a common prefix count as a
    # single return when calculating the number of returns. </p>
    @[Protocol::Field(location: :body, name: "CommonPrefixes", structure: false)]
    property common_prefixes : Array(CommonPrefixStruct)?
    # <p>Encoding type used by Amazon S3 to encode object key names in the XML response.</p>
    #
    # <p>If you specify the encoding-type request parameter, Amazon S3 includes this element in the
    # response, and returns encoded key name values in the following response elements:</p>
    #
    # <p>
    # <code>Delimiter, Prefix, Key,</code> and <code>StartAfter</code>.</p>
    @[Protocol::Field(location: :body, name: "EncodingType", structure: false)]
    property encoding_type : String?
    # <p>KeyCount is the number of keys returned with this request. KeyCount will always be less
    # than equals to MaxKeys field. Say you ask for 50 keys, your result will include less than
    # equals 50 keys </p>
    @[Protocol::Field(location: :body, name: "KeyCount", structure: false)]
    property key_count : Int32?
    # <p> If ContinuationToken was sent with the request, it is included in the response.</p>
    @[Protocol::Field(location: :body, name: "ContinuationToken", structure: false)]
    property continuation_token : String?
    # <p>
    # <code>NextContinuationToken</code> is sent when <code>isTruncated</code> is true, which
    # means there are more keys in the bucket that can be listed. The next list requests to Amazon S3
    # can be continued with this <code>NextContinuationToken</code>.
    # <code>NextContinuationToken</code> is obfuscated and is not a real key</p>
    @[Protocol::Field(location: :body, name: "NextContinuationToken", structure: false)]
    property next_continuation_token : String?
    # <p>If StartAfter was sent with the request, it is included in the response.</p>
    @[Protocol::Field(location: :body, name: "StartAfter", structure: false)]
    property start_after : String?

    def initialize(@is_truncated = nil , @contents = nil , @name = nil , @prefix = nil , @delimiter = nil , @max_keys = nil , @common_prefixes = nil , @encoding_type = nil , @key_count = nil , @continuation_token = nil , @next_continuation_token = nil , @start_after = nil )
    end
  end

  class ListObjectVersionsRequest
    include RestXML::Structure

    # <p>The bucket name that contains the objects. </p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>A delimiter is a character that you specify to group keys. All keys that contain the
    # same string between the <code>prefix</code> and the first occurrence of the delimiter are
    # grouped under a single result element in CommonPrefixes. These groups are counted as one
    # result against the max-keys limitation. These keys are not returned elsewhere in the
    # response.</p>
    @[Protocol::Field(location: :query, name: "delimiter", structure: false)]
    property delimiter : String?
    #
    @[Protocol::Field(location: :query, name: "encoding-type", structure: false)]
    property encoding_type : String?
    # <p>Specifies the key to start with when listing objects in a bucket.</p>
    @[Protocol::Field(location: :query, name: "key-marker", structure: false)]
    property key_marker : String?
    # <p>Sets the maximum number of keys returned in the response. By default the API returns up
    # to 1,000 key names. The response might contain fewer keys but will never contain more. If
    # additional keys satisfy the search criteria, but were not returned because max-keys was
    # exceeded, the response contains <isTruncated>true</isTruncated>. To return the
    # additional keys, see key-marker and version-id-marker.</p>
    @[Protocol::Field(location: :query, name: "max-keys", structure: false)]
    property max_keys : Int32?
    # <p>Use this parameter to select only those keys that begin with the specified prefix. You
    # can use prefixes to separate a bucket into different groupings of keys. (You can think of
    # using prefix to make groups in the same way you'd use a folder in a file system.) You can
    # use prefix with delimiter to roll up numerous objects into a single result under
    # CommonPrefixes. </p>
    @[Protocol::Field(location: :query, name: "prefix", structure: false)]
    property prefix : String?
    # <p>Specifies the object version you want to start listing from.</p>
    @[Protocol::Field(location: :query, name: "version-id-marker", structure: false)]
    property version_id_marker : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @delimiter = nil , @encoding_type = nil , @key_marker = nil , @max_keys = nil , @prefix = nil , @version_id_marker = nil , @expected_bucket_owner = nil )
    end
  end

  class ObjectVersionStruct
    include RestXML::Structure

    # <p>The entity tag is an MD5 hash of that version of the object.</p>
    @[Protocol::Field(location: :body, name: "ETag", structure: false)]
    property e_tag : String?
    # <p>Size in bytes of the object.</p>
    @[Protocol::Field(location: :body, name: "Size", structure: false)]
    property size : Int32?
    # <p>The class of storage used to store the object.</p>
    @[Protocol::Field(location: :body, name: "StorageClass", structure: false)]
    property storage_class : String?
    # <p>The object key.</p>
    @[Protocol::Field(location: :body, name: "Key", structure: false)]
    property key : String?
    # <p>Version ID of an object.</p>
    @[Protocol::Field(location: :body, name: "VersionId", structure: false)]
    property version_id : String?
    # <p>Specifies whether the object is (true) or is not (false) the latest version of an
    # object.</p>
    @[Protocol::Field(location: :body, name: "IsLatest", structure: false)]
    property is_latest : Bool?
    # <p>Date and time the object was last modified.</p>
    @[Protocol::Field(location: :body, name: "LastModified", structure: false)]
    property last_modified : Time?
    # <p>Specifies the owner of the object.</p>
    @[Protocol::Field(location: :body, name: "Owner", structure: true)]
    property owner : OwnerStruct?

    def initialize(@e_tag = nil , @size = nil , @storage_class = nil , @key = nil , @version_id = nil , @is_latest = nil , @last_modified = nil , @owner = nil )
    end
  end

  class DeleteMarkerEntryStruct
    include RestXML::Structure

    # <p>The account that created the delete marker.></p>
    @[Protocol::Field(location: :body, name: "Owner", structure: true)]
    property owner : OwnerStruct?
    # <p>The object key.</p>
    @[Protocol::Field(location: :body, name: "Key", structure: false)]
    property key : String?
    # <p>Version ID of an object.</p>
    @[Protocol::Field(location: :body, name: "VersionId", structure: false)]
    property version_id : String?
    # <p>Specifies whether the object is (true) or is not (false) the latest version of an
    # object.</p>
    @[Protocol::Field(location: :body, name: "IsLatest", structure: false)]
    property is_latest : Bool?
    # <p>Date and time the object was last modified.</p>
    @[Protocol::Field(location: :body, name: "LastModified", structure: false)]
    property last_modified : Time?

    def initialize(@owner = nil , @key = nil , @version_id = nil , @is_latest = nil , @last_modified = nil )
    end
  end

  class ListObjectVersionsOutput
    include RestXML::Structure

    # <p>A flag that indicates whether Amazon S3 returned all of the results that satisfied the search
    # criteria. If your results were truncated, you can make a follow-up paginated request using
    # the NextKeyMarker and NextVersionIdMarker response parameters as a starting place in
    # another request to return the rest of the results.</p>
    @[Protocol::Field(location: :body, name: "IsTruncated", structure: false)]
    property is_truncated : Bool?
    # <p>Marks the last key returned in a truncated response.</p>
    @[Protocol::Field(location: :body, name: "KeyMarker", structure: false)]
    property key_marker : String?
    # <p>Marks the last version of the key returned in a truncated response.</p>
    @[Protocol::Field(location: :body, name: "VersionIdMarker", structure: false)]
    property version_id_marker : String?
    # <p>When the number of responses exceeds the value of <code>MaxKeys</code>,
    # <code>NextKeyMarker</code> specifies the first key not returned that satisfies the
    # search criteria. Use this value for the key-marker request parameter in a subsequent
    # request.</p>
    @[Protocol::Field(location: :body, name: "NextKeyMarker", structure: false)]
    property next_key_marker : String?
    # <p>When the number of responses exceeds the value of <code>MaxKeys</code>,
    # <code>NextVersionIdMarker</code> specifies the first object version not returned that
    # satisfies the search criteria. Use this value for the version-id-marker request parameter
    # in a subsequent request.</p>
    @[Protocol::Field(location: :body, name: "NextVersionIdMarker", structure: false)]
    property next_version_id_marker : String?
    # <p>Container for version information.</p>
    @[Protocol::Field(location: :body, name: "Version", structure: false)]
    property versions : Array(ObjectVersionStruct)?
    # <p>Container for an object that is a delete marker.</p>
    @[Protocol::Field(location: :body, name: "DeleteMarker", structure: false)]
    property delete_markers : Array(DeleteMarkerEntryStruct)?
    # <p>The bucket name.</p>
    @[Protocol::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>Selects objects that start with the value supplied by this parameter.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String?
    # <p>The delimiter grouping the included keys. A delimiter is a character that you specify to
    # group keys. All keys that contain the same string between the prefix and the first
    # occurrence of the delimiter are grouped under a single result element in
    # <code>CommonPrefixes</code>. These groups are counted as one result against the max-keys
    # limitation. These keys are not returned elsewhere in the response.</p>
    @[Protocol::Field(location: :body, name: "Delimiter", structure: false)]
    property delimiter : String?
    # <p>Specifies the maximum number of objects to return.</p>
    @[Protocol::Field(location: :body, name: "MaxKeys", structure: false)]
    property max_keys : Int32?
    # <p>All of the keys rolled up into a common prefix count as a single return when calculating
    # the number of returns.</p>
    @[Protocol::Field(location: :body, name: "CommonPrefixes", structure: false)]
    property common_prefixes : Array(CommonPrefixStruct)?
    # <p> Encoding type used by Amazon S3 to encode object key names in the XML response.</p>
    #
    # <p>If you specify encoding-type request parameter, Amazon S3 includes this element in the
    # response, and returns encoded key name values in the following response elements:</p>
    #
    # <p>
    # <code>KeyMarker, NextKeyMarker, Prefix, Key</code>, and <code>Delimiter</code>.</p>
    @[Protocol::Field(location: :body, name: "EncodingType", structure: false)]
    property encoding_type : String?

    def initialize(@is_truncated = nil , @key_marker = nil , @version_id_marker = nil , @next_key_marker = nil , @next_version_id_marker = nil , @versions = nil , @delete_markers = nil , @name = nil , @prefix = nil , @delimiter = nil , @max_keys = nil , @common_prefixes = nil , @encoding_type = nil )
    end
  end

  class ListPartsRequest
    include RestXML::Structure

    # <p>The name of the bucket to which the parts are being uploaded. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Object key for which the multipart upload was initiated.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>Sets the maximum number of parts to return.</p>
    @[Protocol::Field(location: :query, name: "max-parts", structure: false)]
    property max_parts : Int32?
    # <p>Specifies the part after which listing should begin. Only parts with higher part numbers
    # will be listed.</p>
    @[Protocol::Field(location: :query, name: "part-number-marker", structure: false)]
    property part_number_marker : String?
    # <p>Upload ID identifying the multipart upload whose parts are being listed.</p>
    @[Protocol::Field(location: :query, name: "uploadId", structure: false)]
    property upload_id : String
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @upload_id, @max_parts = nil , @part_number_marker = nil , @request_payer = nil , @expected_bucket_owner = nil )
    end
  end

  class PartStruct
    include RestXML::Structure

    # <p>Part number identifying the part. This is a positive integer between 1 and
    # 10,000.</p>
    @[Protocol::Field(location: :body, name: "PartNumber", structure: false)]
    property part_number : Int32?
    # <p>Date and time at which the part was uploaded.</p>
    @[Protocol::Field(location: :body, name: "LastModified", structure: false)]
    property last_modified : Time?
    # <p>Entity tag returned when the part was uploaded.</p>
    @[Protocol::Field(location: :body, name: "ETag", structure: false)]
    property e_tag : String?
    # <p>Size in bytes of the uploaded part data.</p>
    @[Protocol::Field(location: :body, name: "Size", structure: false)]
    property size : Int32?

    def initialize(@part_number = nil , @last_modified = nil , @e_tag = nil , @size = nil )
    end
  end

  class ListPartsOutput
    include RestXML::Structure

    # <p>If the bucket has a lifecycle rule configured with an action to abort incomplete
    # multipart uploads and the prefix in the lifecycle rule matches the object name in the
    # request, then the response includes this header indicating when the initiated multipart
    # upload will become eligible for abort operation. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config">Aborting
    # Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a>.</p>
    #
    # <p>The response will also include the <code>x-amz-abort-rule-id</code> header that will
    # provide the ID of the lifecycle configuration rule that defines this action.</p>
    @[Protocol::Field(location: :header, name: "x-amz-abort-date", structure: false)]
    property abort_date : Time?
    # <p>This header is returned along with the <code>x-amz-abort-date</code> header. It
    # identifies applicable lifecycle configuration rule that defines the action to abort
    # incomplete multipart uploads.</p>
    @[Protocol::Field(location: :header, name: "x-amz-abort-rule-id", structure: false)]
    property abort_rule_id : String?
    # <p>The name of the bucket to which the multipart upload was initiated.</p>
    @[Protocol::Field(location: :body, name: "Bucket", structure: false)]
    property bucket : String?
    # <p>Object key for which the multipart upload was initiated.</p>
    @[Protocol::Field(location: :body, name: "Key", structure: false)]
    property key : String?
    # <p>Upload ID identifying the multipart upload whose parts are being listed.</p>
    @[Protocol::Field(location: :body, name: "UploadId", structure: false)]
    property upload_id : String?
    # <p>When a list is truncated, this element specifies the last part in the list, as well as
    # the value to use for the part-number-marker request parameter in a subsequent
    # request.</p>
    @[Protocol::Field(location: :body, name: "PartNumberMarker", structure: false)]
    property part_number_marker : String?
    # <p>When a list is truncated, this element specifies the last part in the list, as well as
    # the value to use for the part-number-marker request parameter in a subsequent
    # request.</p>
    @[Protocol::Field(location: :body, name: "NextPartNumberMarker", structure: false)]
    property next_part_number_marker : String?
    # <p>Maximum number of parts that were allowed in the response.</p>
    @[Protocol::Field(location: :body, name: "MaxParts", structure: false)]
    property max_parts : Int32?
    # <p> Indicates whether the returned list of parts is truncated. A true value indicates that
    # the list was truncated. A list can be truncated if the number of parts exceeds the limit
    # returned in the MaxParts element.</p>
    @[Protocol::Field(location: :body, name: "IsTruncated", structure: false)]
    property is_truncated : Bool?
    # <p> Container for elements related to a particular part. A response can contain zero or
    # more <code>Part</code> elements.</p>
    @[Protocol::Field(location: :body, name: "Part", structure: false)]
    property parts : Array(PartStruct)?
    # <p>Container element that identifies who initiated the multipart upload. If the initiator
    # is an AWS account, this element provides the same information as the <code>Owner</code>
    # element. If the initiator is an IAM User, this element provides the user ARN and display
    # name.</p>
    @[Protocol::Field(location: :body, name: "Initiator", structure: true)]
    property initiator : InitiatorStruct?
    # <p> Container element that identifies the object owner, after the object is created. If
    # multipart upload is initiated by an IAM user, this element provides the parent account ID
    # and display name.</p>
    @[Protocol::Field(location: :body, name: "Owner", structure: true)]
    property owner : OwnerStruct?
    # <p>Class of storage (STANDARD or REDUCED_REDUNDANCY) used to store the uploaded
    # object.</p>
    @[Protocol::Field(location: :body, name: "StorageClass", structure: false)]
    property storage_class : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@abort_date = nil , @abort_rule_id = nil , @bucket = nil , @key = nil , @upload_id = nil , @part_number_marker = nil , @next_part_number_marker = nil , @max_parts = nil , @is_truncated = nil , @parts = nil , @initiator = nil , @owner = nil , @storage_class = nil , @request_charged = nil )
    end
  end

  class AccelerateConfigurationStruct
    include RestXML::Structure

    # <p>Specifies the transfer acceleration status of the bucket.</p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String?

    def initialize(@status = nil )
    end
  end

  class PutBucketAccelerateConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket for which the accelerate configuration is set.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Container for setting the transfer acceleration state.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property accelerate_configuration : AccelerateConfigurationStruct
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @accelerate_configuration, @expected_bucket_owner = nil )
    end
  end

  class AccessControlPolicyStruct
    include RestXML::Structure

    # <p>A list of grants.</p>
    @[Protocol::Field(location: :body, name: "AccessControlList", structure: false)]
    property grants : Array(GrantStruct)?
    # <p>Container for the bucket owner's display name and ID.</p>
    @[Protocol::Field(location: :body, name: "Owner", structure: true)]
    property owner : OwnerStruct?

    def initialize(@grants = nil , @owner = nil )
    end
  end

  class PutBucketAclRequest
    include RestXML::Structure

    # <p>The canned ACL to apply to the bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-acl", structure: false)]
    property acl : String?
    # <p>Contains the elements that set the ACL permissions for an object per grantee.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property access_control_policy : AccessControlPolicyStruct?
    # <p>The bucket to which to apply the ACL.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The base64-encoded 128-bit MD5 digest of the data. This header must be used as a message
    # integrity check to verify that the request body was not corrupted in transit. For more
    # information, go to <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC
    # 1864.</a>
    # </p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>Allows grantee the read, write, read ACP, and write ACP permissions on the
    # bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-full-control", structure: false)]
    property grant_full_control : String?
    # <p>Allows grantee to list the objects in the bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-read", structure: false)]
    property grant_read : String?
    # <p>Allows grantee to read the bucket ACL.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-read-acp", structure: false)]
    property grant_read_acp : String?
    # <p>Allows grantee to create, overwrite, and delete any object in the bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-write", structure: false)]
    property grant_write : String?
    # <p>Allows grantee to write the ACL for the applicable bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-write-acp", structure: false)]
    property grant_write_acp : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @acl = nil , @access_control_policy = nil , @content_md5 = nil , @grant_full_control = nil , @grant_read = nil , @grant_read_acp = nil , @grant_write = nil , @grant_write_acp = nil , @expected_bucket_owner = nil )
    end
  end

  class PutBucketAnalyticsConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket to which an analytics configuration is stored.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ID that identifies the analytics configuration.</p>
    @[Protocol::Field(location: :query, name: "id", structure: false)]
    property id : String
    # <p>The configuration and any analyses for the analytics filter.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property analytics_configuration : AnalyticsConfigurationStruct
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @id, @analytics_configuration, @expected_bucket_owner = nil )
    end
  end

  class CORSConfigurationStruct
    include RestXML::Structure

    # <p>A set of origins and methods (cross-origin access that you want to allow). You can add
    # up to 100 rules to the configuration.</p>
    @[Protocol::Field(location: :body, name: "CORSRule", structure: false)]
    property cors_rules : Array(CORSRuleStruct)

    def initialize(@cors_rules)
    end
  end

  class PutBucketCorsRequest
    include RestXML::Structure

    # <p>Specifies the bucket impacted by the <code>cors</code>configuration.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Describes the cross-origin access configuration for objects in an Amazon S3 bucket. For more
    # information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html">Enabling Cross-Origin Resource
    # Sharing</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property cors_configuration : CORSConfigurationStruct
    # <p>The base64-encoded 128-bit MD5 digest of the data. This header must be used as a message
    # integrity check to verify that the request body was not corrupted in transit. For more
    # information, go to <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC
    # 1864.</a>
    # </p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @cors_configuration, @content_md5 = nil , @expected_bucket_owner = nil )
    end
  end

  class PutBucketEncryptionRequest
    include RestXML::Structure

    # <p>Specifies default encryption for a bucket using server-side encryption with Amazon S3-managed
    # keys (SSE-S3) or customer master keys stored in AWS KMS (SSE-KMS). For information about
    # the Amazon S3 default encryption feature, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html">Amazon S3 Default Bucket Encryption</a>
    # in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The base64-encoded 128-bit MD5 digest of the server-side encryption configuration.</p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    #
    @[Protocol::Field(location: :body_io, structure: true)]
    property server_side_encryption_configuration : ServerSideEncryptionConfigurationStruct
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @server_side_encryption_configuration, @content_md5 = nil , @expected_bucket_owner = nil )
    end
  end

  class PutBucketIntelligentTieringConfigurationRequest
    include RestXML::Structure

    # <p>The name of the Amazon S3 bucket whose configuration you want to modify or retrieve.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ID used to identify the S3 Intelligent-Tiering configuration.</p>
    @[Protocol::Field(location: :query, name: "id", structure: false)]
    property id : String
    # <p>Container for S3 Intelligent-Tiering configuration.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property intelligent_tiering_configuration : IntelligentTieringConfigurationStruct

    def initialize(@bucket, @id, @intelligent_tiering_configuration)
    end
  end

  class PutBucketInventoryConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket where the inventory configuration will be stored.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ID used to identify the inventory configuration.</p>
    @[Protocol::Field(location: :query, name: "id", structure: false)]
    property id : String
    # <p>Specifies the inventory configuration.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property inventory_configuration : InventoryConfigurationStruct
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @id, @inventory_configuration, @expected_bucket_owner = nil )
    end
  end

  class BucketLifecycleConfigurationStruct
    include RestXML::Structure

    # <p>A lifecycle rule for individual objects in an Amazon S3 bucket.</p>
    @[Protocol::Field(location: :body, name: "Rule", structure: false)]
    property rules : Array(LifecycleRuleStruct)

    def initialize(@rules)
    end
  end

  class PutBucketLifecycleConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket for which to set the configuration.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Container for lifecycle rules. You can add as many as 1,000 rules.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property lifecycle_configuration : BucketLifecycleConfigurationStruct?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @lifecycle_configuration = nil , @expected_bucket_owner = nil )
    end
  end

  class BucketLoggingStatusStruct
    include RestXML::Structure

    #
    @[Protocol::Field(location: :body, name: "LoggingEnabled", structure: true)]
    property logging_enabled : LoggingEnabledStruct?

    def initialize(@logging_enabled = nil )
    end
  end

  class PutBucketLoggingRequest
    include RestXML::Structure

    # <p>The name of the bucket for which to set the logging parameters.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Container for logging status information.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property bucket_logging_status : BucketLoggingStatusStruct
    # <p>The MD5 hash of the <code>PutBucketLogging</code> request body.</p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @bucket_logging_status, @content_md5 = nil , @expected_bucket_owner = nil )
    end
  end

  class PutBucketMetricsConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket for which the metrics configuration is set.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The ID used to identify the metrics configuration.</p>
    @[Protocol::Field(location: :query, name: "id", structure: false)]
    property id : String
    # <p>Specifies the metrics configuration.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property metrics_configuration : MetricsConfigurationStruct
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @id, @metrics_configuration, @expected_bucket_owner = nil )
    end
  end

  class PutBucketNotificationConfigurationRequest
    include RestXML::Structure

    # <p>The name of the bucket.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    #
    @[Protocol::Field(location: :body_io, structure: true)]
    property notification_configuration : NotificationConfigurationStruct
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @notification_configuration, @expected_bucket_owner = nil )
    end
  end

  class PutBucketOwnershipControlsRequest
    include RestXML::Structure

    # <p>The name of the Amazon S3 bucket whose <code>OwnershipControls</code> you want to set.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The MD5 hash of the <code>OwnershipControls</code> request body. </p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?
    # <p>The <code>OwnershipControls</code> (BucketOwnerPreferred or ObjectWriter) that you want
    # to apply to this Amazon S3 bucket.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property ownership_controls : OwnershipControlsStruct

    def initialize(@bucket, @ownership_controls, @content_md5 = nil , @expected_bucket_owner = nil )
    end
  end

  class PutBucketPolicyRequest
    include RestXML::Structure

    # <p>The name of the bucket.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The MD5 hash of the request body.</p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>Set this parameter to true to confirm that you want to remove your permissions to change
    # this bucket policy in the future.</p>
    @[Protocol::Field(location: :header, name: "x-amz-confirm-remove-self-bucket-access", structure: false)]
    property confirm_remove_self_bucket_access : Bool?
    # <p>The bucket policy as a JSON document.</p>
    @[Protocol::Field(location: :body_io, structure: false)]
    property policy : String
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @policy, @content_md5 = nil , @confirm_remove_self_bucket_access = nil , @expected_bucket_owner = nil )
    end
  end

  class PutBucketReplicationRequest
    include RestXML::Structure

    # <p>The name of the bucket</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The base64-encoded 128-bit MD5 digest of the data. You must use this header as a message
    # integrity check to verify that the request body was not corrupted in transit. For more
    # information, see <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.</p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    #
    @[Protocol::Field(location: :body_io, structure: true)]
    property replication_configuration : ReplicationConfigurationStruct
    # <p>A token to allow Object Lock to be enabled for an existing bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-bucket-object-lock-token", structure: false)]
    property token : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @replication_configuration, @content_md5 = nil , @token = nil , @expected_bucket_owner = nil )
    end
  end

  class RequestPaymentConfigurationStruct
    include RestXML::Structure

    # <p>Specifies who pays for the download and request fees.</p>
    @[Protocol::Field(location: :body, name: "Payer", structure: false)]
    property payer : String

    def initialize(@payer)
    end
  end

  class PutBucketRequestPaymentRequest
    include RestXML::Structure

    # <p>The bucket name.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>>The base64-encoded 128-bit MD5 digest of the data. You must use this header as a
    # message integrity check to verify that the request body was not corrupted in transit. For
    # more information, see <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC
    # 1864</a>.</p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>Container for Payer.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property request_payment_configuration : RequestPaymentConfigurationStruct
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @request_payment_configuration, @content_md5 = nil , @expected_bucket_owner = nil )
    end
  end

  class TaggingStruct
    include RestXML::Structure

    # <p>A collection for a set of tags</p>
    @[Protocol::Field(location: :body, name: "TagSet", structure: false)]
    property tag_set : Array(TagStruct)

    def initialize(@tag_set)
    end
  end

  class PutBucketTaggingRequest
    include RestXML::Structure

    # <p>The bucket name.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The base64-encoded 128-bit MD5 digest of the data. You must use this header as a message
    # integrity check to verify that the request body was not corrupted in transit. For more
    # information, see <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.</p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>Container for the <code>TagSet</code> and <code>Tag</code> elements.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property tagging : TaggingStruct
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @tagging, @content_md5 = nil , @expected_bucket_owner = nil )
    end
  end

  class VersioningConfigurationStruct
    include RestXML::Structure

    # <p>Specifies whether MFA delete is enabled in the bucket versioning configuration. This
    # element is only returned if the bucket has been configured with MFA delete. If the bucket
    # has never been so configured, this element is not returned.</p>
    @[Protocol::Field(location: :body, name: "MfaDelete", structure: false)]
    property mfa_delete : String?
    # <p>The versioning state of the bucket.</p>
    @[Protocol::Field(location: :body, name: "Status", structure: false)]
    property status : String?

    def initialize(@mfa_delete = nil , @status = nil )
    end
  end

  class PutBucketVersioningRequest
    include RestXML::Structure

    # <p>The bucket name.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>>The base64-encoded 128-bit MD5 digest of the data. You must use this header as a
    # message integrity check to verify that the request body was not corrupted in transit. For
    # more information, see <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC
    # 1864</a>.</p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>The concatenation of the authentication device's serial number, a space, and the value
    # that is displayed on your authentication device.</p>
    @[Protocol::Field(location: :header, name: "x-amz-mfa", structure: false)]
    property mfa : String?
    # <p>Container for setting the versioning state.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property versioning_configuration : VersioningConfigurationStruct
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @versioning_configuration, @content_md5 = nil , @mfa = nil , @expected_bucket_owner = nil )
    end
  end

  class WebsiteConfigurationStruct
    include RestXML::Structure

    # <p>The name of the error document for the website.</p>
    @[Protocol::Field(location: :body, name: "ErrorDocument", structure: true)]
    property error_document : ErrorDocumentStruct?
    # <p>The name of the index document for the website.</p>
    @[Protocol::Field(location: :body, name: "IndexDocument", structure: true)]
    property index_document : IndexDocumentStruct?
    # <p>The redirect behavior for every request to this bucket's website endpoint.</p>
    # <important>
    # <p>If you specify this property, you can't specify any other property.</p>
    # </important>
    @[Protocol::Field(location: :body, name: "RedirectAllRequestsTo", structure: true)]
    property redirect_all_requests_to : RedirectAllRequestsToStruct?
    # <p>Rules that define when a redirect is applied and the redirect behavior.</p>
    @[Protocol::Field(location: :body, name: "RoutingRules", structure: false)]
    property routing_rules : Array(RoutingRuleStruct)?

    def initialize(@error_document = nil , @index_document = nil , @redirect_all_requests_to = nil , @routing_rules = nil )
    end
  end

  class PutBucketWebsiteRequest
    include RestXML::Structure

    # <p>The bucket name.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The base64-encoded 128-bit MD5 digest of the data. You must use this header as a message
    # integrity check to verify that the request body was not corrupted in transit. For more
    # information, see <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.</p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>Container for the request.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property website_configuration : WebsiteConfigurationStruct
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @website_configuration, @content_md5 = nil , @expected_bucket_owner = nil )
    end
  end

  class PutObjectRequest
    include RestXML::Structure

    # <p>The canned ACL to apply to the object. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned
    # ACL</a>.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-acl", structure: false)]
    property acl : String?
    # <p>Object data.</p>
    @[Protocol::Field(location: :body_io, structure: false)]
    property body : Bytes?
    # <p>The bucket name to which the PUT operation was initiated. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p> Can be used to specify caching behavior along the request/reply chain. For more
    # information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9</a>.</p>
    @[Protocol::Field(location: :header, name: "Cache-Control", structure: false)]
    property cache_control : String?
    # <p>Specifies presentational information for the object. For more information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec19.html#sec19.5.1">http://www.w3.org/Protocols/rfc2616/rfc2616-sec19.html#sec19.5.1</a>.</p>
    @[Protocol::Field(location: :header, name: "Content-Disposition", structure: false)]
    property content_disposition : String?
    # <p>Specifies what content encodings have been applied to the object and thus what decoding
    # mechanisms must be applied to obtain the media-type referenced by the Content-Type header
    # field. For more information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.11">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.11</a>.</p>
    @[Protocol::Field(location: :header, name: "Content-Encoding", structure: false)]
    property content_encoding : String?
    # <p>The language the content is in.</p>
    @[Protocol::Field(location: :header, name: "Content-Language", structure: false)]
    property content_language : String?
    # <p>Size of the body in bytes. This parameter is useful when the size of the body cannot be
    # determined automatically. For more information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.13">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.13</a>.</p>
    @[Protocol::Field(location: :header, name: "Content-Length", structure: false)]
    property content_length : Int64?
    # <p>The base64-encoded 128-bit MD5 digest of the message (without the headers) according to
    # RFC 1864. This header can be used as a message integrity check to verify that the data is
    # the same data that was originally sent. Although it is optional, we recommend using the
    # Content-MD5 mechanism as an end-to-end integrity check. For more information about REST
    # request authentication, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html">REST
    # Authentication</a>.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>A standard MIME type describing the format of the contents. For more information, see
    # <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17</a>.</p>
    @[Protocol::Field(location: :header, name: "Content-Type", structure: false)]
    property content_type : String?
    # <p>The date and time at which the object is no longer cacheable. For more information, see
    # <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.21">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.21</a>.</p>
    @[Protocol::Field(location: :header, name: "Expires", structure: false)]
    property expires : Time?
    # <p>Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the
    # object.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-full-control", structure: false)]
    property grant_full_control : String?
    # <p>Allows grantee to read the object data and its
    # metadata.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-read", structure: false)]
    property grant_read : String?
    # <p>Allows grantee to read the object ACL.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-read-acp", structure: false)]
    property grant_read_acp : String?
    # <p>Allows grantee to write the ACL for the applicable
    # object.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-write-acp", structure: false)]
    property grant_write_acp : String?
    # <p>Object key for which the PUT operation was initiated.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>A map of metadata to store with the object in S3.</p>
    @[Protocol::Field(location: :header_prefix, name: "x-amz-meta-", structure: false)]
    property metadata : Hash(String, String)?
    # <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example,
    # AES256, aws:kms).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption", structure: false)]
    property server_side_encryption : String?
    # <p>By default, Amazon S3 uses the STANDARD Storage Class to store newly created objects. The
    # STANDARD storage class provides high durability and high availability. Depending on
    # performance needs, you can specify a different Storage Class. Amazon S3 on Outposts only uses
    # the OUTPOSTS Storage Class. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage Classes</a> in the <i>Amazon S3
    # Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :header, name: "x-amz-storage-class", structure: false)]
    property storage_class : String?
    # <p>If the bucket is configured as a website, redirects requests for this object to another
    # object in the same bucket or to an external URL. Amazon S3 stores the value of this header in
    # the object metadata. For information about object metadata, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html">Object Key and Metadata</a>.</p>
    #
    # <p>In the following example, the request header sets the redirect to an object
    # (anotherPage.html) in the same bucket:</p>
    #
    # <p>
    # <code>x-amz-website-redirect-location: /anotherPage.html</code>
    # </p>
    #
    # <p>In the following example, the request header sets the object redirect to another
    # website:</p>
    #
    # <p>
    # <code>x-amz-website-redirect-location: http://www.example.com/</code>
    # </p>
    #
    # <p>For more information about website hosting in Amazon S3, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html">Hosting Websites on Amazon S3</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html">How to Configure Website Page
    # Redirects</a>. </p>
    @[Protocol::Field(location: :header, name: "x-amz-website-redirect-location", structure: false)]
    property website_redirect_location : String?
    # <p>Specifies the algorithm to use to when encrypting the object (for example,
    # AES256).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This
    # value is used to store the object and then it is discarded; Amazon S3 does not store the
    # encryption key. The key must be appropriate for use with the algorithm specified in the
    # <code>x-amz-server-side-encryption-customer-algorithm</code> header.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key", structure: false)]
    property sse_customer_key : String?
    # <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    # <p>If <code>x-amz-server-side-encryption</code> is present and has the value of
    # <code>aws:kms</code>, this header specifies the ID of the AWS Key Management Service
    # (AWS KMS) symmetrical customer managed customer master key (CMK) that was used for the
    # object.</p>
    # <p> If the value of <code>x-amz-server-side-encryption</code> is <code>aws:kms</code>, this
    # header specifies the ID of the symmetric customer managed AWS KMS CMK that will be used for
    # the object. If you specify <code>x-amz-server-side-encryption:aws:kms</code>, but do not
    # provide<code> x-amz-server-side-encryption-aws-kms-key-id</code>, Amazon S3 uses the AWS
    # managed CMK in AWS to protect the data.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-aws-kms-key-id", structure: false)]
    property ssekms_key_id : String?
    # <p>Specifies the AWS KMS Encryption Context to use for object encryption. The value of this
    # header is a base64-encoded UTF-8 string holding JSON with the encryption context key-value
    # pairs.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-context", structure: false)]
    property ssekms_encryption_context : String?
    # <p>Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side encryption using AWS KMS (SSE-KMS). Setting this header to <code>true</code> causes Amazon S3 to use an S3 Bucket Key for object encryption with SSE-KMS.</p>
    # <p>Specifying this header with a PUT operation doesn’t affect bucket-level settings for S3 Bucket Key.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-bucket-key-enabled", structure: false)]
    property bucket_key_enabled : Bool?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The tag-set for the object. The tag-set must be encoded as URL Query parameters. (For
    # example, "Key1=Value1")</p>
    @[Protocol::Field(location: :header, name: "x-amz-tagging", structure: false)]
    property tagging : String?
    # <p>The Object Lock mode that you want to apply to this object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-mode", structure: false)]
    property object_lock_mode : String?
    # <p>The date and time when you want this object's Object Lock to expire.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-retain-until-date", structure: false)]
    property object_lock_retain_until_date : Time?
    # <p>Specifies whether a legal hold will be applied to this object. For more information
    # about S3 Object Lock, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Object
    # Lock</a>.</p>
    @[Protocol::Field(location: :header, name: "x-amz-object-lock-legal-hold", structure: false)]
    property object_lock_legal_hold_status : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@key, @bucket, @acl = nil , @storage_class = nil , @website_redirect_location = nil , @sse_customer_algorithm = nil , @sse_customer_key = nil , @sse_customer_key_md5 = nil , @ssekms_key_id = nil , @ssekms_encryption_context = nil , @bucket_key_enabled = nil , @request_payer = nil , @tagging = nil , @object_lock_mode = nil , @object_lock_retain_until_date = nil , @object_lock_legal_hold_status = nil , @server_side_encryption = nil , @metadata = nil , @grant_write_acp = nil , @grant_read_acp = nil , @grant_read = nil , @grant_full_control = nil , @expires = nil , @content_type = nil , @content_md5 = nil , @content_length = nil , @content_language = nil , @content_encoding = nil , @content_disposition = nil , @cache_control = nil , @body = nil , @expected_bucket_owner = nil )
    end
  end

  class PutObjectOutput
    include RestXML::Structure

    # <p> If the expiration is configured for the object (see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>), the response includes this header. It
    # includes the expiry-date and rule-id key-value pairs that provide information about object
    # expiration. The value of the rule-id is URL encoded.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expiration", structure: false)]
    property expiration : String?
    # <p>Entity tag for the uploaded object.</p>
    @[Protocol::Field(location: :header, name: "ETag", structure: false)]
    property e_tag : String?
    # <p>If you specified server-side encryption either with an AWS KMS customer master key (CMK)
    # or Amazon S3-managed encryption key in your PUT request, the response includes this header. It
    # confirms the encryption algorithm that Amazon S3 used to encrypt the object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption", structure: false)]
    property server_side_encryption : String?
    # <p>Version of the object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-version-id", structure: false)]
    property version_id : String?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header confirming the encryption algorithm used.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header to provide round-trip message integrity verification of
    # the customer-provided encryption key.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    # <p>If <code>x-amz-server-side-encryption</code> is present and has the value of
    # <code>aws:kms</code>, this header specifies the ID of the AWS Key Management Service
    # (AWS KMS) symmetric customer managed customer master key (CMK) that was used for the
    # object. </p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-aws-kms-key-id", structure: false)]
    property ssekms_key_id : String?
    # <p>If present, specifies the AWS KMS Encryption Context to use for object encryption. The
    # value of this header is a base64-encoded UTF-8 string holding JSON with the encryption
    # context key-value pairs.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-context", structure: false)]
    property ssekms_encryption_context : String?
    # <p>Indicates whether the uploaded object uses an S3 Bucket Key for server-side encryption with AWS KMS (SSE-KMS).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-bucket-key-enabled", structure: false)]
    property bucket_key_enabled : Bool?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@expiration = nil , @e_tag = nil , @server_side_encryption = nil , @version_id = nil , @sse_customer_algorithm = nil , @sse_customer_key_md5 = nil , @ssekms_key_id = nil , @ssekms_encryption_context = nil , @bucket_key_enabled = nil , @request_charged = nil )
    end
  end

  class PutObjectAclRequest
    include RestXML::Structure

    # <p>The canned ACL to apply to the object. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned ACL</a>.</p>
    @[Protocol::Field(location: :header, name: "x-amz-acl", structure: false)]
    property acl : String?
    # <p>Contains the elements that set the ACL permissions for an object per grantee.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property access_control_policy : AccessControlPolicyStruct?
    # <p>The bucket name that contains the object to which you want to attach the ACL. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The base64-encoded 128-bit MD5 digest of the data. This header must be used as a message
    # integrity check to verify that the request body was not corrupted in transit. For more
    # information, go to <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC
    # 1864.></a>
    # </p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>Allows grantee the read, write, read ACP, and write ACP permissions on the
    # bucket.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-full-control", structure: false)]
    property grant_full_control : String?
    # <p>Allows grantee to list the objects in the
    # bucket.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-read", structure: false)]
    property grant_read : String?
    # <p>Allows grantee to read the bucket ACL.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-read-acp", structure: false)]
    property grant_read_acp : String?
    # <p>Allows grantee to create, overwrite, and delete any object in the bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-write", structure: false)]
    property grant_write : String?
    # <p>Allows grantee to write the ACL for the applicable
    # bucket.</p>
    # <p>This action is not supported by Amazon S3 on Outposts.</p>
    @[Protocol::Field(location: :header, name: "x-amz-grant-write-acp", structure: false)]
    property grant_write_acp : String?
    # <p>Key for which the PUT operation was initiated.</p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>VersionId used to reference a specific version of the object.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @acl = nil , @access_control_policy = nil , @content_md5 = nil , @grant_full_control = nil , @grant_read = nil , @grant_read_acp = nil , @grant_write = nil , @grant_write_acp = nil , @request_payer = nil , @version_id = nil , @expected_bucket_owner = nil )
    end
  end

  class PutObjectAclOutput
    include RestXML::Structure

    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@request_charged = nil )
    end
  end

  class PutObjectLegalHoldRequest
    include RestXML::Structure

    # <p>The bucket name containing the object that you want to place a Legal Hold on. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The key name for the object that you want to place a Legal Hold on.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>Container element for the Legal Hold configuration you want to apply to the specified
    # object.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property legal_hold : ObjectLockLegalHoldStruct?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The version ID of the object that you want to place a Legal Hold on.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    # <p>The MD5 hash for the request body.</p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @legal_hold = nil , @request_payer = nil , @version_id = nil , @content_md5 = nil , @expected_bucket_owner = nil )
    end
  end

  class PutObjectLegalHoldOutput
    include RestXML::Structure

    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@request_charged = nil )
    end
  end

  class PutObjectLockConfigurationRequest
    include RestXML::Structure

    # <p>The bucket whose Object Lock configuration you want to create or replace.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The Object Lock configuration that you want to apply to the specified bucket.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property object_lock_configuration : ObjectLockConfigurationStruct?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>A token to allow Object Lock to be enabled for an existing bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-bucket-object-lock-token", structure: false)]
    property token : String?
    # <p>The MD5 hash for the request body.</p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @object_lock_configuration = nil , @request_payer = nil , @token = nil , @content_md5 = nil , @expected_bucket_owner = nil )
    end
  end

  class PutObjectLockConfigurationOutput
    include RestXML::Structure

    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@request_charged = nil )
    end
  end

  class PutObjectRetentionRequest
    include RestXML::Structure

    # <p>The bucket name that contains the object you want to apply this Object Retention
    # configuration to. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The key name for the object that you want to apply this Object Retention configuration
    # to.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>The container element for the Object Retention configuration.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property retention : ObjectLockRetentionStruct?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The version ID for the object that you want to apply this Object Retention configuration
    # to.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    # <p>Indicates whether this operation should bypass Governance-mode restrictions.</p>
    @[Protocol::Field(location: :header, name: "x-amz-bypass-governance-retention", structure: false)]
    property bypass_governance_retention : Bool?
    # <p>The MD5 hash for the request body.</p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @retention = nil , @request_payer = nil , @version_id = nil , @bypass_governance_retention = nil , @content_md5 = nil , @expected_bucket_owner = nil )
    end
  end

  class PutObjectRetentionOutput
    include RestXML::Structure

    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@request_charged = nil )
    end
  end

  class PutObjectTaggingRequest
    include RestXML::Structure

    # <p>The bucket name containing the object. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Name of the object key.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>The versionId of the object that the tag-set will be added to.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    # <p>The MD5 hash for the request body.</p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>Container for the <code>TagSet</code> and <code>Tag</code> elements</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property tagging : TaggingStruct
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @tagging, @version_id = nil , @content_md5 = nil , @expected_bucket_owner = nil )
    end
  end

  class PutObjectTaggingOutput
    include RestXML::Structure

    # <p>The versionId of the object the tag-set was added to.</p>
    @[Protocol::Field(location: :header, name: "x-amz-version-id", structure: false)]
    property version_id : String?

    def initialize(@version_id = nil )
    end
  end

  class PutPublicAccessBlockRequest
    include RestXML::Structure

    # <p>The name of the Amazon S3 bucket whose <code>PublicAccessBlock</code> configuration you want
    # to set.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The MD5 hash of the <code>PutPublicAccessBlock</code> request body. </p>
    # <p>For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>The <code>PublicAccessBlock</code> configuration that you want to apply to this Amazon S3
    # bucket. You can enable the configuration options in any combination. For more information
    # about when Amazon S3 considers a bucket or object public, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The Meaning of "Public"</a> in the <i>Amazon Simple Storage Service Developer
    # Guide</i>.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property public_access_block_configuration : PublicAccessBlockConfigurationStruct
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @public_access_block_configuration, @content_md5 = nil , @expected_bucket_owner = nil )
    end
  end

  class GlacierJobParametersStruct
    include RestXML::Structure

    # <p>Retrieval tier at which the restore will be processed.</p>
    @[Protocol::Field(location: :body, name: "Tier", structure: false)]
    property tier : String

    def initialize(@tier)
    end
  end

  class CSVInputStruct
    include RestXML::Structure

    # <p>Describes the first line of input. Valid values are:</p>
    # <ul>
    # <li>
    # <p>
    # <code>NONE</code>: First line is not a header.</p>
    # </li>
    # <li>
    # <p>
    # <code>IGNORE</code>: First line is a header, but you can't use the header values
    # to indicate the column in an expression. You can use column position (such as _1, _2,
    # …) to indicate the column (<code>SELECT s._1 FROM OBJECT s</code>).</p>
    # </li>
    # <li>
    # <p>
    # <code>Use</code>: First line is a header, and you can use the header value to
    # identify a column in an expression (<code>SELECT "name" FROM OBJECT</code>). </p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "FileHeaderInfo", structure: false)]
    property file_header_info : String?
    # <p>A single character used to indicate that a row should be ignored when the character is
    # present at the start of that row. You can specify any character to indicate a comment
    # line.</p>
    @[Protocol::Field(location: :body, name: "Comments", structure: false)]
    property comments : String?
    # <p>A single character used for escaping the quotation mark character inside an already
    # escaped value. For example, the value """ a , b """ is parsed as " a , b ".</p>
    @[Protocol::Field(location: :body, name: "QuoteEscapeCharacter", structure: false)]
    property quote_escape_character : String?
    # <p>A single character used to separate individual records in the input. Instead of the
    # default value, you can specify an arbitrary delimiter.</p>
    @[Protocol::Field(location: :body, name: "RecordDelimiter", structure: false)]
    property record_delimiter : String?
    # <p>A single character used to separate individual fields in a record. You can specify an
    # arbitrary delimiter.</p>
    @[Protocol::Field(location: :body, name: "FieldDelimiter", structure: false)]
    property field_delimiter : String?
    # <p>A single character used for escaping when the field delimiter is part of the value. For
    # example, if the value is <code>a, b</code>, Amazon S3 wraps this field value in quotation marks,
    # as follows: <code>" a , b "</code>.</p>
    # <p>Type: String</p>
    # <p>Default: <code>"</code>
    # </p>
    # <p>Ancestors: <code>CSV</code>
    # </p>
    @[Protocol::Field(location: :body, name: "QuoteCharacter", structure: false)]
    property quote_character : String?
    # <p>Specifies that CSV field values may contain quoted record delimiters and such records
    # should be allowed. Default value is FALSE. Setting this value to TRUE may lower
    # performance.</p>
    @[Protocol::Field(location: :body, name: "AllowQuotedRecordDelimiter", structure: false)]
    property allow_quoted_record_delimiter : Bool?

    def initialize(@file_header_info = nil , @comments = nil , @quote_escape_character = nil , @record_delimiter = nil , @field_delimiter = nil , @quote_character = nil , @allow_quoted_record_delimiter = nil )
    end
  end

  class JSONInputStruct
    include RestXML::Structure

    # <p>The type of JSON. Valid values: Document, Lines.</p>
    @[Protocol::Field(location: :body, name: "Type", structure: false)]
    property type : String?

    def initialize(@type = nil )
    end
  end

  class ParquetInputStruct
    include RestXML::Structure


    def initialize()
    end
  end

  class InputSerializationStruct
    include RestXML::Structure

    # <p>Describes the serialization of a CSV-encoded object.</p>
    @[Protocol::Field(location: :body, name: "CSV", structure: true)]
    property csv : CSVInputStruct?
    # <p>Specifies object's compression format. Valid values: NONE, GZIP, BZIP2. Default Value:
    # NONE.</p>
    @[Protocol::Field(location: :body, name: "CompressionType", structure: false)]
    property compression_type : String?
    # <p>Specifies JSON as object's input serialization format.</p>
    @[Protocol::Field(location: :body, name: "JSON", structure: true)]
    property json : JSONInputStruct?
    # <p>Specifies Parquet as object's input serialization format.</p>
    @[Protocol::Field(location: :body, name: "Parquet", structure: true)]
    property parquet : ParquetInputStruct?

    def initialize(@csv = nil , @compression_type = nil , @json = nil , @parquet = nil )
    end
  end

  class CSVOutput
    include RestXML::Structure

    # <p>Indicates whether to use quotation marks around output fields. </p>
    # <ul>
    # <li>
    # <p>
    # <code>ALWAYS</code>: Always use quotation marks for output fields.</p>
    # </li>
    # <li>
    # <p>
    # <code>ASNEEDED</code>: Use quotation marks for output fields when needed.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "QuoteFields", structure: false)]
    property quote_fields : String?
    # <p>The single character used for escaping the quote character inside an already escaped
    # value.</p>
    @[Protocol::Field(location: :body, name: "QuoteEscapeCharacter", structure: false)]
    property quote_escape_character : String?
    # <p>A single character used to separate individual records in the output. Instead of the
    # default value, you can specify an arbitrary delimiter.</p>
    @[Protocol::Field(location: :body, name: "RecordDelimiter", structure: false)]
    property record_delimiter : String?
    # <p>The value used to separate individual fields in a record. You can specify an arbitrary
    # delimiter.</p>
    @[Protocol::Field(location: :body, name: "FieldDelimiter", structure: false)]
    property field_delimiter : String?
    # <p>A single character used for escaping when the field delimiter is part of the value. For
    # example, if the value is <code>a, b</code>, Amazon S3 wraps this field value in quotation marks,
    # as follows: <code>" a , b "</code>.</p>
    @[Protocol::Field(location: :body, name: "QuoteCharacter", structure: false)]
    property quote_character : String?

    def initialize(@quote_fields = nil , @quote_escape_character = nil , @record_delimiter = nil , @field_delimiter = nil , @quote_character = nil )
    end
  end

  class JSONOutput
    include RestXML::Structure

    # <p>The value used to separate individual records in the output. If no value is specified,
    # Amazon S3 uses a newline character ('\n').</p>
    @[Protocol::Field(location: :body, name: "RecordDelimiter", structure: false)]
    property record_delimiter : String?

    def initialize(@record_delimiter = nil )
    end
  end

  class OutputSerializationStruct
    include RestXML::Structure

    # <p>Describes the serialization of CSV-encoded Select results.</p>
    @[Protocol::Field(location: :body, name: "CSV", structure: true)]
    property csv : CSVOutput?
    # <p>Specifies JSON as request's output serialization format.</p>
    @[Protocol::Field(location: :body, name: "JSON", structure: true)]
    property json : JSONOutput?

    def initialize(@csv = nil , @json = nil )
    end
  end

  class SelectParametersStruct
    include RestXML::Structure

    # <p>Describes the serialization format of the object.</p>
    @[Protocol::Field(location: :body, name: "InputSerialization", structure: true)]
    property input_serialization : InputSerializationStruct
    # <p>The type of the provided expression (for example, SQL).</p>
    @[Protocol::Field(location: :body, name: "ExpressionType", structure: false)]
    property expression_type : String
    # <p>The expression that is used to query the object.</p>
    @[Protocol::Field(location: :body, name: "Expression", structure: false)]
    property expression : String
    # <p>Describes how the results of the Select job are serialized.</p>
    @[Protocol::Field(location: :body, name: "OutputSerialization", structure: true)]
    property output_serialization : OutputSerializationStruct

    def initialize(@input_serialization, @expression_type, @expression, @output_serialization)
    end
  end

  class EncryptionStruct
    include RestXML::Structure

    # <p>The server-side encryption algorithm used when storing job results in Amazon S3 (for example,
    # AES256, aws:kms).</p>
    @[Protocol::Field(location: :body, name: "EncryptionType", structure: false)]
    property encryption_type : String
    # <p>If the encryption type is <code>aws:kms</code>, this optional value specifies the ID of
    # the symmetric customer managed AWS KMS CMK to use for encryption of job results. Amazon S3 only
    # supports symmetric CMKs. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and
    # Asymmetric Keys</a> in the <i>AWS Key Management Service Developer
    # Guide</i>.</p>
    @[Protocol::Field(location: :body, name: "KMSKeyId", structure: false)]
    property kms_key_id : String?
    # <p>If the encryption type is <code>aws:kms</code>, this optional value can be used to
    # specify the encryption context for the restore results.</p>
    @[Protocol::Field(location: :body, name: "KMSContext", structure: false)]
    property kms_context : String?

    def initialize(@encryption_type, @kms_key_id = nil , @kms_context = nil )
    end
  end

  class MetadataEntryStruct
    include RestXML::Structure

    # <p>Name of the Object.</p>
    @[Protocol::Field(location: :body, name: "Name", structure: false)]
    property name : String?
    # <p>Value of the Object.</p>
    @[Protocol::Field(location: :body, name: "Value", structure: false)]
    property value : String?

    def initialize(@name = nil , @value = nil )
    end
  end

  class S3LocationStruct
    include RestXML::Structure

    # <p>The name of the bucket where the restore results will be placed.</p>
    @[Protocol::Field(location: :body, name: "BucketName", structure: false)]
    property bucket_name : String
    # <p>The prefix that is prepended to the restore results for this request.</p>
    @[Protocol::Field(location: :body, name: "Prefix", structure: false)]
    property prefix : String
    #
    @[Protocol::Field(location: :body, name: "Encryption", structure: true)]
    property encryption : EncryptionStruct?
    # <p>The canned ACL to apply to the restore results.</p>
    @[Protocol::Field(location: :body, name: "CannedACL", structure: false)]
    property canned_acl : String?
    # <p>A list of grants that control access to the staged results.</p>
    @[Protocol::Field(location: :body, name: "AccessControlList", structure: false)]
    property access_control_list : Array(GrantStruct)?
    # <p>The tag-set that is applied to the restore results.</p>
    @[Protocol::Field(location: :body, name: "Tagging", structure: true)]
    property tagging : TaggingStruct?
    # <p>A list of metadata to store with the restore results in S3.</p>
    @[Protocol::Field(location: :body, name: "UserMetadata", structure: false)]
    property user_metadata : Array(MetadataEntryStruct)?
    # <p>The class of storage used to store the restore results.</p>
    @[Protocol::Field(location: :body, name: "StorageClass", structure: false)]
    property storage_class : String?

    def initialize(@bucket_name, @prefix, @encryption = nil , @canned_acl = nil , @access_control_list = nil , @tagging = nil , @user_metadata = nil , @storage_class = nil )
    end
  end

  class OutputLocationStruct
    include RestXML::Structure

    # <p>Describes an S3 location that will receive the results of the restore request.</p>
    @[Protocol::Field(location: :body, name: "S3", structure: true)]
    property s3 : S3LocationStruct?

    def initialize(@s3 = nil )
    end
  end

  class RestoreRequest
    include RestXML::Structure

    # <p>Lifetime of the active copy in days. Do not use with restores that specify
    # <code>OutputLocation</code>.</p>
    # <p>The Days element is required for regular restores, and must not be provided for select
    # requests.</p>
    @[Protocol::Field(location: :body, name: "Days", structure: false)]
    property days : Int32?
    # <p>S3 Glacier related parameters pertaining to this job. Do not use with restores that
    # specify <code>OutputLocation</code>.</p>
    @[Protocol::Field(location: :body, name: "GlacierJobParameters", structure: true)]
    property glacier_job_parameters : GlacierJobParametersStruct?
    # <p>Type of restore request.</p>
    @[Protocol::Field(location: :body, name: "Type", structure: false)]
    property type : String?
    # <p>Retrieval tier at which the restore will be processed.</p>
    @[Protocol::Field(location: :body, name: "Tier", structure: false)]
    property tier : String?
    # <p>The optional description for the job.</p>
    @[Protocol::Field(location: :body, name: "Description", structure: false)]
    property description : String?
    # <p>Describes the parameters for Select job types.</p>
    @[Protocol::Field(location: :body, name: "SelectParameters", structure: true)]
    property select_parameters : SelectParametersStruct?
    # <p>Describes the location where the restore job's output is stored.</p>
    @[Protocol::Field(location: :body, name: "OutputLocation", structure: true)]
    property output_location : OutputLocationStruct?

    def initialize(@days = nil , @glacier_job_parameters = nil , @type = nil , @tier = nil , @description = nil , @select_parameters = nil , @output_location = nil )
    end
  end

  class RestoreObjectRequest
    include RestXML::Structure

    # <p>The bucket name containing the object to restore. </p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Object key for which the operation was initiated.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>VersionId used to reference a specific version of the object.</p>
    @[Protocol::Field(location: :query, name: "versionId", structure: false)]
    property version_id : String?
    #
    @[Protocol::Field(location: :body_io, structure: true)]
    property restore_request : RestoreRequest?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @version_id = nil , @restore_request = nil , @request_payer = nil , @expected_bucket_owner = nil )
    end
  end

  class RestoreObjectOutput
    include RestXML::Structure

    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?
    # <p>Indicates the path in the provided S3 output location where Select results will be
    # restored to.</p>
    @[Protocol::Field(location: :header, name: "x-amz-restore-output-path", structure: false)]
    property restore_output_path : String?

    def initialize(@request_charged = nil , @restore_output_path = nil )
    end
  end

  class ObjectAlreadyInActiveTierError < Exception
    include RestXML::Structure


    def initialize()
    end
  end

  class RequestProgressStruct
    include RestXML::Structure

    # <p>Specifies whether periodic QueryProgress frames should be sent. Valid values: TRUE,
    # FALSE. Default value: FALSE.</p>
    @[Protocol::Field(location: :body, name: "Enabled", structure: false)]
    property enabled : Bool?

    def initialize(@enabled = nil )
    end
  end

  class ScanRangeStruct
    include RestXML::Structure

    # <p>Specifies the start of the byte range. This parameter is optional. Valid values:
    # non-negative integers. The default value is 0. If only start is supplied, it means scan
    # from that point to the end of the file.For example;
    # <code><scanrange><start>50</start></scanrange></code> means scan
    # from byte 50 until the end of the file.</p>
    @[Protocol::Field(location: :body, name: "Start", structure: false)]
    property start : Int64?
    # <p>Specifies the end of the byte range. This parameter is optional. Valid values:
    # non-negative integers. The default value is one less than the size of the object being
    # queried. If only the End parameter is supplied, it is interpreted to mean scan the last N
    # bytes of the file. For example,
    # <code><scanrange><end>50</end></scanrange></code> means scan the
    # last 50 bytes.</p>
    @[Protocol::Field(location: :body, name: "End", structure: false)]
    property end : Int64?

    def initialize(@start = nil , @end = nil )
    end
  end

  class SelectObjectContentRequest
    include RestXML::Structure

    # <p>The S3 bucket.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>The object key.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>The SSE Algorithm used to encrypt the object. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side Encryption (Using Customer-Provided Encryption Keys</a>. </p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>The SSE Customer Key. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side Encryption
    # (Using Customer-Provided Encryption Keys</a>. </p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key", structure: false)]
    property sse_customer_key : String?
    # <p>The SSE Customer Key MD5. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side Encryption
    # (Using Customer-Provided Encryption Keys</a>. </p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    # <p>The expression that is used to query the object.</p>
    @[Protocol::Field(location: :body, name: "Expression", structure: false)]
    property expression : String
    # <p>The type of the provided expression (for example, SQL).</p>
    @[Protocol::Field(location: :body, name: "ExpressionType", structure: false)]
    property expression_type : String
    # <p>Specifies if periodic request progress information should be enabled.</p>
    @[Protocol::Field(location: :body, name: "RequestProgress", structure: true)]
    property request_progress : RequestProgressStruct?
    # <p>Describes the format of the data in the object that is being queried.</p>
    @[Protocol::Field(location: :body, name: "InputSerialization", structure: true)]
    property input_serialization : InputSerializationStruct
    # <p>Describes the format of the data that you want Amazon S3 to return in response.</p>
    @[Protocol::Field(location: :body, name: "OutputSerialization", structure: true)]
    property output_serialization : OutputSerializationStruct
    # <p>Specifies the byte range of the object to get the records from. A record is processed
    # when its first byte is contained by the range. This parameter is optional, but when
    # specified, it must not be empty. See RFC 2616, Section 14.35.1 about how to specify the
    # start and end of the range.</p>
    # <p>
    # <code>ScanRange</code>may be used in the following ways:</p>
    # <ul>
    # <li>
    # <p>
    # <code><scanrange><start>50</start><end>100</end></scanrange></code>
    # - process only the records starting between the bytes 50 and 100 (inclusive, counting
    # from zero)</p>
    # </li>
    # <li>
    # <p>
    # <code><scanrange><start>50</start></scanrange></code> -
    # process only the records starting after the byte 50</p>
    # </li>
    # <li>
    # <p>
    # <code><scanrange><end>50</end></scanrange></code> -
    # process only the records within the last 50 bytes of the file.</p>
    # </li>
    # </ul>
    @[Protocol::Field(location: :body, name: "ScanRange", structure: true)]
    property scan_range : ScanRangeStruct?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @expression, @expression_type, @input_serialization, @output_serialization, @sse_customer_algorithm = nil , @sse_customer_key = nil , @sse_customer_key_md5 = nil , @request_progress = nil , @scan_range = nil , @expected_bucket_owner = nil )
    end
  end

  class RecordsEventStruct
    include RestXML::Structure

    # <p>The byte array of partial, one or more result records.</p>
    @[Protocol::Field(location: :body, name: "Payload", structure: false)]
    property payload : Bytes?

    def initialize(@payload = nil )
    end
  end

  class StatsStruct
    include RestXML::Structure

    # <p>The total number of object bytes scanned.</p>
    @[Protocol::Field(location: :body, name: "BytesScanned", structure: false)]
    property bytes_scanned : Int64?
    # <p>The total number of uncompressed object bytes processed.</p>
    @[Protocol::Field(location: :body, name: "BytesProcessed", structure: false)]
    property bytes_processed : Int64?
    # <p>The total number of bytes of records payload data returned.</p>
    @[Protocol::Field(location: :body, name: "BytesReturned", structure: false)]
    property bytes_returned : Int64?

    def initialize(@bytes_scanned = nil , @bytes_processed = nil , @bytes_returned = nil )
    end
  end

  class StatsEventStruct
    include RestXML::Structure

    # <p>The Stats event details.</p>
    @[Protocol::Field(location: :body, name: "Details", structure: true)]
    property details : StatsStruct?

    def initialize(@details = nil )
    end
  end

  class ProgressStruct
    include RestXML::Structure

    # <p>The current number of object bytes scanned.</p>
    @[Protocol::Field(location: :body, name: "BytesScanned", structure: false)]
    property bytes_scanned : Int64?
    # <p>The current number of uncompressed object bytes processed.</p>
    @[Protocol::Field(location: :body, name: "BytesProcessed", structure: false)]
    property bytes_processed : Int64?
    # <p>The current number of bytes of records payload data returned.</p>
    @[Protocol::Field(location: :body, name: "BytesReturned", structure: false)]
    property bytes_returned : Int64?

    def initialize(@bytes_scanned = nil , @bytes_processed = nil , @bytes_returned = nil )
    end
  end

  class ProgressEventStruct
    include RestXML::Structure

    # <p>The Progress event details.</p>
    @[Protocol::Field(location: :body, name: "Details", structure: true)]
    property details : ProgressStruct?

    def initialize(@details = nil )
    end
  end

  class ContinuationEventStruct
    include RestXML::Structure


    def initialize()
    end
  end

  class EndEventStruct
    include RestXML::Structure


    def initialize()
    end
  end

  class SelectObjectContentOutput
    include RestXML::Structure

    # <p>The array of results.</p>
    @[Protocol::Field(location: :body_io, structure: false)]
    property payload : SelectObjectContentEventStreamStruct?

    def initialize(@payload = nil )
    end
  end

  class UploadPartRequest
    include RestXML::Structure

    # <p>Object data.</p>
    @[Protocol::Field(location: :body_io, structure: false)]
    property body : Bytes?
    # <p>The name of the bucket to which the multipart upload was initiated.</p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Size of the body in bytes. This parameter is useful when the size of the body cannot be
    # determined automatically.</p>
    @[Protocol::Field(location: :header, name: "Content-Length", structure: false)]
    property content_length : Int64?
    # <p>The base64-encoded 128-bit MD5 digest of the part data. This parameter is auto-populated
    # when using the command from the CLI. This parameter is required if object lock parameters
    # are specified.</p>
    @[Protocol::Field(location: :header, name: "Content-MD5", structure: false)]
    property content_md5 : String?
    # <p>Object key for which the multipart upload was initiated.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>Part number of part being uploaded. This is a positive integer between 1 and
    # 10,000.</p>
    @[Protocol::Field(location: :query, name: "partNumber", structure: false)]
    property part_number : Int32
    # <p>Upload ID identifying the multipart upload whose part is being uploaded.</p>
    @[Protocol::Field(location: :query, name: "uploadId", structure: false)]
    property upload_id : String
    # <p>Specifies the algorithm to use to when encrypting the object (for example,
    # AES256).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This
    # value is used to store the object and then it is discarded; Amazon S3 does not store the
    # encryption key. The key must be appropriate for use with the algorithm specified in the
    # <code>x-amz-server-side-encryption-customer-algorithm header</code>. This must be the
    # same encryption key specified in the initiate multipart upload request.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key", structure: false)]
    property sse_customer_key : String?
    # <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?

    def initialize(@bucket, @key, @part_number, @upload_id, @body = nil , @content_length = nil , @content_md5 = nil , @sse_customer_algorithm = nil , @sse_customer_key = nil , @sse_customer_key_md5 = nil , @request_payer = nil , @expected_bucket_owner = nil )
    end
  end

  class UploadPartOutput
    include RestXML::Structure

    # <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example,
    # AES256, aws:kms).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption", structure: false)]
    property server_side_encryption : String?
    # <p>Entity tag for the uploaded object.</p>
    @[Protocol::Field(location: :header, name: "ETag", structure: false)]
    property e_tag : String?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header confirming the encryption algorithm used.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header to provide round-trip message integrity verification of
    # the customer-provided encryption key.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    # <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric
    # customer managed customer master key (CMK) was used for the object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-aws-kms-key-id", structure: false)]
    property ssekms_key_id : String?
    # <p>Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption with AWS KMS (SSE-KMS).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-bucket-key-enabled", structure: false)]
    property bucket_key_enabled : Bool?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@server_side_encryption = nil , @e_tag = nil , @sse_customer_algorithm = nil , @sse_customer_key_md5 = nil , @ssekms_key_id = nil , @bucket_key_enabled = nil , @request_charged = nil )
    end
  end

  class UploadPartCopyRequest
    include RestXML::Structure

    # <p>The bucket name.</p>
    # <p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    # <p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
    @[Protocol::Field(location: :uri, name: "Bucket", structure: false)]
    property bucket : String
    # <p>Specifies the source object for the copy operation. You specify the value in one of two
    # formats, depending on whether you want to access the source object through an <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">access
    # point</a>:</p>
    # <ul>
    # <li>
    # <p>For objects not accessed through an access point, specify the name of the source
    # bucket and key of the source object, separated by a slash (/). For example, to copy
    # the object <code>reports/january.pdf</code> from the bucket
    # <code>awsexamplebucket</code>, use
    # <code>awsexamplebucket/reports/january.pdf</code>. The value must be URL
    # encoded.</p>
    # </li>
    # <li>
    # <p>For objects accessed through access points, specify the Amazon Resource Name (ARN) of the object as accessed through the access point, in the format <code>arn:aws:s3:<Region>:<account-id>:accesspoint/<access-point-name>/object/<key></code>. For example, to copy the object <code>reports/january.pdf</code> through access point <code>my-access-point</code> owned by account <code>123456789012</code> in Region <code>us-west-2</code>, use the URL encoding of <code>arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/reports/january.pdf</code>. The value must be URL encoded.</p>
    # <note>
    # <p>Amazon S3 supports copy operations using access points only when the source and destination buckets are in the same AWS Region.</p>
    # </note>
    # <p>Alternatively, for objects accessed through Amazon S3 on Outposts, specify the ARN of the object as accessed in the format <code>arn:aws:s3-outposts:<Region>:<account-id>:outpost/<outpost-id>/object/<key></code>. For example, to copy the object <code>reports/january.pdf</code> through outpost <code>my-outpost</code> owned by account <code>123456789012</code> in Region <code>us-west-2</code>, use the URL encoding of <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/object/reports/january.pdf</code>. The value must be URL encoded.  </p>
    # </li>
    # </ul>
    # <p>To copy a specific version of an object, append <code>?versionId=<version-id></code>
    # to the value (for example,
    # <code>awsexamplebucket/reports/january.pdf?versionId=QUpfdndhfd8438MNFDN93jdnJFkdmqnh893</code>).
    # If you don't specify a version ID, Amazon S3 copies the latest version of the source
    # object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source", structure: false)]
    property copy_source : String
    # <p>Copies the object if its entity tag (ETag) matches the specified tag.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-if-match", structure: false)]
    property copy_source_if_match : String?
    # <p>Copies the object if it has been modified since the specified time.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-if-modified-since", structure: false)]
    property copy_source_if_modified_since : Time?
    # <p>Copies the object if its entity tag (ETag) is different than the specified ETag.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-if-none-match", structure: false)]
    property copy_source_if_none_match : String?
    # <p>Copies the object if it hasn't been modified since the specified time.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-if-unmodified-since", structure: false)]
    property copy_source_if_unmodified_since : Time?
    # <p>The range of bytes to copy from the source object. The range value must use the form
    # bytes=first-last, where the first and last are the zero-based byte offsets to copy. For
    # example, bytes=0-9 indicates that you want to copy the first 10 bytes of the source. You
    # can copy a range only if the source object is greater than 5 MB.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-range", structure: false)]
    property copy_source_range : String?
    # <p>Object key for which the multipart upload was initiated.</p>
    @[Protocol::Field(location: :uri, name: "Key", structure: false)]
    property key : String
    # <p>Part number of part being copied. This is a positive integer between 1 and
    # 10,000.</p>
    @[Protocol::Field(location: :query, name: "partNumber", structure: false)]
    property part_number : Int32
    # <p>Upload ID identifying the multipart upload whose part is being copied.</p>
    @[Protocol::Field(location: :query, name: "uploadId", structure: false)]
    property upload_id : String
    # <p>Specifies the algorithm to use to when encrypting the object (for example,
    # AES256).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This
    # value is used to store the object and then it is discarded; Amazon S3 does not store the
    # encryption key. The key must be appropriate for use with the algorithm specified in the
    # <code>x-amz-server-side-encryption-customer-algorithm</code> header. This must be the
    # same encryption key specified in the initiate multipart upload request.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key", structure: false)]
    property sse_customer_key : String?
    # <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    # <p>Specifies the algorithm to use when decrypting the source object (for example,
    # AES256).</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-server-side-encryption-customer-algorithm", structure: false)]
    property copy_source_sse_customer_algorithm : String?
    # <p>Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source
    # object. The encryption key provided in this header must be one that was used when the
    # source object was created.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-server-side-encryption-customer-key", structure: false)]
    property copy_source_sse_customer_key : String?
    # <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-server-side-encryption-customer-key-MD5", structure: false)]
    property copy_source_sse_customer_key_md5 : String?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-payer", structure: false)]
    property request_payer : String?
    # <p>The account id of the expected destination bucket owner. If the destination bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-expected-bucket-owner", structure: false)]
    property expected_bucket_owner : String?
    # <p>The account id of the expected source bucket owner. If the source bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
    @[Protocol::Field(location: :header, name: "x-amz-source-expected-bucket-owner", structure: false)]
    property expected_source_bucket_owner : String?

    def initialize(@bucket, @upload_id, @part_number, @key, @copy_source, @copy_source_if_none_match = nil , @copy_source_if_unmodified_since = nil , @copy_source_range = nil , @copy_source_if_modified_since = nil , @copy_source_if_match = nil , @sse_customer_algorithm = nil , @sse_customer_key = nil , @sse_customer_key_md5 = nil , @copy_source_sse_customer_algorithm = nil , @copy_source_sse_customer_key = nil , @copy_source_sse_customer_key_md5 = nil , @request_payer = nil , @expected_bucket_owner = nil , @expected_source_bucket_owner = nil )
    end
  end

  class CopyPartResultStruct
    include RestXML::Structure

    # <p>Entity tag of the object.</p>
    @[Protocol::Field(location: :body, name: "ETag", structure: false)]
    property e_tag : String?
    # <p>Date and time at which the object was uploaded.</p>
    @[Protocol::Field(location: :body, name: "LastModified", structure: false)]
    property last_modified : Time?

    def initialize(@e_tag = nil , @last_modified = nil )
    end
  end

  class UploadPartCopyOutput
    include RestXML::Structure

    # <p>The version of the source object that was copied, if you have enabled versioning on the
    # source bucket.</p>
    @[Protocol::Field(location: :header, name: "x-amz-copy-source-version-id", structure: false)]
    property copy_source_version_id : String?
    # <p>Container for all response elements.</p>
    @[Protocol::Field(location: :body_io, structure: true)]
    property copy_part_result : CopyPartResultStruct?
    # <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example,
    # AES256, aws:kms).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption", structure: false)]
    property server_side_encryption : String?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header confirming the encryption algorithm used.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-algorithm", structure: false)]
    property sse_customer_algorithm : String?
    # <p>If server-side encryption with a customer-provided encryption key was requested, the
    # response will include this header to provide round-trip message integrity verification of
    # the customer-provided encryption key.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-customer-key-MD5", structure: false)]
    property sse_customer_key_md5 : String?
    # <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric
    # customer managed customer master key (CMK) that was used for the object.</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-aws-kms-key-id", structure: false)]
    property ssekms_key_id : String?
    # <p>Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption with AWS KMS (SSE-KMS).</p>
    @[Protocol::Field(location: :header, name: "x-amz-server-side-encryption-bucket-key-enabled", structure: false)]
    property bucket_key_enabled : Bool?
    #
    @[Protocol::Field(location: :header, name: "x-amz-request-charged", structure: false)]
    property request_charged : String?

    def initialize(@copy_source_version_id = nil , @copy_part_result = nil , @server_side_encryption = nil , @sse_customer_algorithm = nil , @sse_customer_key_md5 = nil , @ssekms_key_id = nil , @bucket_key_enabled = nil , @request_charged = nil )
    end
  end


  struct AnalyticsFilterStruct

  property prefix : String?

  property tag : TagStruct?

  property and : AnalyticsAndOperatorStruct?

  def self.prefix(prefix __arg1)
    new(prefix: __arg1)
  end
  def self.tag(tag __arg1)
    new(tag: __arg1)
  end
  def self.and(and __arg1)
    new(and: __arg1)
  end

  def initialize(@prefix = nil, @tag = nil, @and = nil)
  end
end

  struct LifecycleRuleFilterStruct

  property prefix : String?

  property tag : TagStruct?

  property and : LifecycleRuleAndOperatorStruct?

  def self.prefix(prefix __arg1)
    new(prefix: __arg1)
  end
  def self.tag(tag __arg1)
    new(tag: __arg1)
  end
  def self.and(and __arg1)
    new(and: __arg1)
  end

  def initialize(@prefix = nil, @tag = nil, @and = nil)
  end
end

  struct MetricsFilterStruct

  property prefix : String?

  property tag : TagStruct?

  property and : MetricsAndOperatorStruct?

  def self.prefix(prefix __arg1)
    new(prefix: __arg1)
  end
  def self.tag(tag __arg1)
    new(tag: __arg1)
  end
  def self.and(and __arg1)
    new(and: __arg1)
  end

  def initialize(@prefix = nil, @tag = nil, @and = nil)
  end
end

  struct ReplicationRuleFilterStruct

  property prefix : String?

  property tag : TagStruct?

  property and : ReplicationRuleAndOperatorStruct?

  def self.prefix(prefix __arg1)
    new(prefix: __arg1)
  end
  def self.tag(tag __arg1)
    new(tag: __arg1)
  end
  def self.and(and __arg1)
    new(and: __arg1)
  end

  def initialize(@prefix = nil, @tag = nil, @and = nil)
  end
end

  struct SelectObjectContentEventStreamStruct

  property records : RecordsEventStruct?

  property stats : StatsEventStruct?

  property progress : ProgressEventStruct?

  property cont : ContinuationEventStruct?

  property end : EndEventStruct?

  def self.records(records __arg1)
    new(records: __arg1)
  end
  def self.stats(stats __arg1)
    new(stats: __arg1)
  end
  def self.progress(progress __arg1)
    new(progress: __arg1)
  end
  def self.cont(cont __arg1)
    new(cont: __arg1)
  end
  def self.end(end __arg1)
    new(end: __arg1)
  end

  def initialize(@records = nil, @stats = nil, @progress = nil, @cont = nil, @end = nil)
  end
end


end


AWSSdk::AmazonS3.delete_bucket(AWSSdk::AmazonS3::DeleteBucketRequest.new("String"))
