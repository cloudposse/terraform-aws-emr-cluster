<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 1.3 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 2.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dns_master"></a> [dns\_master](#module\_dns\_master) | cloudposse/route53-cluster-hostname/aws | 0.12.0 |
| <a name="module_label_core"></a> [label\_core](#module\_label\_core) | cloudposse/label/null | 0.24.1 |
| <a name="module_label_ec2"></a> [label\_ec2](#module\_label\_ec2) | cloudposse/label/null | 0.24.1 |
| <a name="module_label_ec2_autoscaling"></a> [label\_ec2\_autoscaling](#module\_label\_ec2\_autoscaling) | cloudposse/label/null | 0.24.1 |
| <a name="module_label_emr"></a> [label\_emr](#module\_label\_emr) | cloudposse/label/null | 0.24.1 |
| <a name="module_label_master"></a> [label\_master](#module\_label\_master) | cloudposse/label/null | 0.24.1 |
| <a name="module_label_master_managed"></a> [label\_master\_managed](#module\_label\_master\_managed) | cloudposse/label/null | 0.24.1 |
| <a name="module_label_service_managed"></a> [label\_service\_managed](#module\_label\_service\_managed) | cloudposse/label/null | 0.24.1 |
| <a name="module_label_slave"></a> [label\_slave](#module\_label\_slave) | cloudposse/label/null | 0.24.1 |
| <a name="module_label_slave_managed"></a> [label\_slave\_managed](#module\_label\_slave\_managed) | cloudposse/label/null | 0.24.1 |
| <a name="module_label_task"></a> [label\_task](#module\_label\_task) | cloudposse/label/null | 0.24.1 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.24.1 |

## Resources

| Name | Type |
|------|------|
| [aws_emr_cluster.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/emr_cluster) | resource |
| [aws_emr_instance_group.task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/emr_instance_group) | resource |
| [aws_iam_instance_profile.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ec2_autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.emr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ec2_autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.emr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.managed_master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.managed_service_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.managed_slave](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.slave](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.managed_master_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.managed_master_service_access_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.managed_service_access_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.managed_slave_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.master_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.master_ingress_cidr_blocks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.master_ingress_security_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.slave_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.slave_ingress_cidr_blocks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.slave_ingress_security_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_vpc_endpoint.vpc_endpoint_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_iam_policy_document.assume_role_ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_emr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_info"></a> [additional\_info](#input\_additional\_info) | A JSON string for selecting additional features such as adding proxy information. Note: Currently there is no API to retrieve the value of this argument after EMR cluster creation from provider, therefore Terraform cannot detect drift from the actual EMR cluster if its value is changed outside Terraform | `string` | `null` | no |
| <a name="input_additional_master_security_group"></a> [additional\_master\_security\_group](#input\_additional\_master\_security\_group) | The name of the existing additional security group that will be used for EMR master node. If empty, a new security group will be created | `string` | `""` | no |
| <a name="input_additional_slave_security_group"></a> [additional\_slave\_security\_group](#input\_additional\_slave\_security\_group) | The name of the existing additional security group that will be used for EMR core & task nodes. If empty, a new security group will be created | `string` | `""` | no |
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| <a name="input_applications"></a> [applications](#input\_applications) | A list of applications for the cluster. Valid values are: Flink, Ganglia, Hadoop, HBase, HCatalog, Hive, Hue, JupyterHub, Livy, Mahout, MXNet, Oozie, Phoenix, Pig, Presto, Spark, Sqoop, TensorFlow, Tez, Zeppelin, and ZooKeeper (as of EMR 5.25.0). Case insensitive | `list(string)` | n/a | yes |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| <a name="input_bootstrap_action"></a> [bootstrap\_action](#input\_bootstrap\_action) | List of bootstrap actions that will be run before Hadoop is started on the cluster nodes | <pre>list(object({<br>    path = string<br>    name = string<br>    args = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_configurations_json"></a> [configurations\_json](#input\_configurations\_json) | A JSON string for supplying list of configurations for the EMR cluster. See https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html for more details | `string` | `""` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| <a name="input_core_instance_group_autoscaling_policy"></a> [core\_instance\_group\_autoscaling\_policy](#input\_core\_instance\_group\_autoscaling\_policy) | String containing the EMR Auto Scaling Policy JSON for the Core instance group | `string` | `null` | no |
| <a name="input_core_instance_group_bid_price"></a> [core\_instance\_group\_bid\_price](#input\_core\_instance\_group\_bid\_price) | Bid price for each EC2 instance in the Core instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances | `string` | `null` | no |
| <a name="input_core_instance_group_ebs_iops"></a> [core\_instance\_group\_ebs\_iops](#input\_core\_instance\_group\_ebs\_iops) | The number of I/O operations per second (IOPS) that the Core volume supports | `number` | `null` | no |
| <a name="input_core_instance_group_ebs_size"></a> [core\_instance\_group\_ebs\_size](#input\_core\_instance\_group\_ebs\_size) | Core instances volume size, in gibibytes (GiB) | `number` | n/a | yes |
| <a name="input_core_instance_group_ebs_type"></a> [core\_instance\_group\_ebs\_type](#input\_core\_instance\_group\_ebs\_type) | Core instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | `string` | `"gp2"` | no |
| <a name="input_core_instance_group_ebs_volumes_per_instance"></a> [core\_instance\_group\_ebs\_volumes\_per\_instance](#input\_core\_instance\_group\_ebs\_volumes\_per\_instance) | The number of EBS volumes with this configuration to attach to each EC2 instance in the Core instance group | `number` | `1` | no |
| <a name="input_core_instance_group_instance_count"></a> [core\_instance\_group\_instance\_count](#input\_core\_instance\_group\_instance\_count) | Target number of instances for the Core instance group. Must be at least 1 | `number` | `1` | no |
| <a name="input_core_instance_group_instance_type"></a> [core\_instance\_group\_instance\_type](#input\_core\_instance\_group\_instance\_type) | EC2 instance type for all instances in the Core instance group | `string` | n/a | yes |
| <a name="input_create_task_instance_group"></a> [create\_task\_instance\_group](#input\_create\_task\_instance\_group) | Whether to create an instance group for Task nodes. For more info: https://www.terraform.io/docs/providers/aws/r/emr_instance_group.html, https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-master-core-task-nodes.html | `bool` | `false` | no |
| <a name="input_create_vpc_endpoint_s3"></a> [create\_vpc\_endpoint\_s3](#input\_create\_vpc\_endpoint\_s3) | Set to false to prevent the module from creating VPC S3 Endpoint | `bool` | `true` | no |
| <a name="input_custom_ami_id"></a> [custom\_ami\_id](#input\_custom\_ami\_id) | A custom Amazon Linux AMI for the cluster (instead of an EMR-owned AMI). Available in Amazon EMR version 5.7.0 and later | `string` | `null` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_ebs_root_volume_size"></a> [ebs\_root\_volume\_size](#input\_ebs\_root\_volume\_size) | Size in GiB of the EBS root device volume of the Linux AMI that is used for each EC2 instance. Available in Amazon EMR version 4.x and later | `number` | `10` | no |
| <a name="input_ec2_autoscaling_role_permissions_boundary"></a> [ec2\_autoscaling\_role\_permissions\_boundary](#input\_ec2\_autoscaling\_role\_permissions\_boundary) | The Permissions Boundary ARN to apply to the EC2 Autoscaling Role. | `string` | `""` | no |
| <a name="input_ec2_role_permissions_boundary"></a> [ec2\_role\_permissions\_boundary](#input\_ec2\_role\_permissions\_boundary) | The Permissions Boundary ARN to apply to the EC2 Role. | `string` | `""` | no |
| <a name="input_emr_role_permissions_boundary"></a> [emr\_role\_permissions\_boundary](#input\_emr\_role\_permissions\_boundary) | The Permissions Boundary ARN to apply to the EMR Role. | `string` | `""` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_govcloud"></a> [govcloud](#input\_govcloud) | Adjust ARNs for use in AWS GovCloud. | `bool` | `false` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_keep_job_flow_alive_when_no_steps"></a> [keep\_job\_flow\_alive\_when\_no\_steps](#input\_keep\_job\_flow\_alive\_when\_no\_steps) | Switch on/off run cluster with no steps or when all steps are complete | `bool` | `true` | no |
| <a name="input_kerberos_ad_domain_join_password"></a> [kerberos\_ad\_domain\_join\_password](#input\_kerberos\_ad\_domain\_join\_password) | The Active Directory password for ad\_domain\_join\_user. Terraform cannot perform drift detection of this configuration. | `string` | `null` | no |
| <a name="input_kerberos_ad_domain_join_user"></a> [kerberos\_ad\_domain\_join\_user](#input\_kerberos\_ad\_domain\_join\_user) | Required only when establishing a cross-realm trust with an Active Directory domain. A user with sufficient privileges to join resources to the domain. Terraform cannot perform drift detection of this configuration. | `string` | `null` | no |
| <a name="input_kerberos_cross_realm_trust_principal_password"></a> [kerberos\_cross\_realm\_trust\_principal\_password](#input\_kerberos\_cross\_realm\_trust\_principal\_password) | Required only when establishing a cross-realm trust with a KDC in a different realm. The cross-realm principal password, which must be identical across realms. Terraform cannot perform drift detection of this configuration. | `string` | `null` | no |
| <a name="input_kerberos_enabled"></a> [kerberos\_enabled](#input\_kerberos\_enabled) | Set to true if EMR cluster will use kerberos\_attributes | `bool` | `false` | no |
| <a name="input_kerberos_kdc_admin_password"></a> [kerberos\_kdc\_admin\_password](#input\_kerberos\_kdc\_admin\_password) | The password used within the cluster for the kadmin service on the cluster-dedicated KDC, which maintains Kerberos principals, password policies, and keytabs for the cluster. Terraform cannot perform drift detection of this configuration. | `string` | `null` | no |
| <a name="input_kerberos_realm"></a> [kerberos\_realm](#input\_kerberos\_realm) | The name of the Kerberos realm to which all nodes in a cluster belong. For example, EC2.INTERNAL | `string` | `"EC2.INTERNAL"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Amazon EC2 key pair that can be used to ssh to the master node as the user called `hadoop` | `string` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | The letter case of label keys (`tag` names) (i.e. `name`, `namespace`, `environment`, `stage`, `attributes`) to use in `tags`.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | The letter case of output label values (also used in `tags` and `id`).<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_log_uri"></a> [log\_uri](#input\_log\_uri) | The path to the Amazon S3 location where logs for this cluster are stored | `string` | `null` | no |
| <a name="input_managed_master_security_group"></a> [managed\_master\_security\_group](#input\_managed\_master\_security\_group) | The name of the existing managed security group that will be used for EMR master node. If empty, a new security group will be created | `string` | `""` | no |
| <a name="input_managed_slave_security_group"></a> [managed\_slave\_security\_group](#input\_managed\_slave\_security\_group) | The name of the existing managed security group that will be used for EMR core & task nodes. If empty, a new security group will be created | `string` | `""` | no |
| <a name="input_master_allowed_cidr_blocks"></a> [master\_allowed\_cidr\_blocks](#input\_master\_allowed\_cidr\_blocks) | List of CIDR blocks to be allowed to access the master instances | `list(string)` | `[]` | no |
| <a name="input_master_allowed_security_groups"></a> [master\_allowed\_security\_groups](#input\_master\_allowed\_security\_groups) | List of security groups to be allowed to connect to the master instances | `list(string)` | `[]` | no |
| <a name="input_master_dns_name"></a> [master\_dns\_name](#input\_master\_dns\_name) | Name of the cluster CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `emr-master-var.name` | `string` | `null` | no |
| <a name="input_master_instance_group_bid_price"></a> [master\_instance\_group\_bid\_price](#input\_master\_instance\_group\_bid\_price) | Bid price for each EC2 instance in the Master instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances | `string` | `null` | no |
| <a name="input_master_instance_group_ebs_iops"></a> [master\_instance\_group\_ebs\_iops](#input\_master\_instance\_group\_ebs\_iops) | The number of I/O operations per second (IOPS) that the Master volume supports | `number` | `null` | no |
| <a name="input_master_instance_group_ebs_size"></a> [master\_instance\_group\_ebs\_size](#input\_master\_instance\_group\_ebs\_size) | Master instances volume size, in gibibytes (GiB) | `number` | n/a | yes |
| <a name="input_master_instance_group_ebs_type"></a> [master\_instance\_group\_ebs\_type](#input\_master\_instance\_group\_ebs\_type) | Master instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | `string` | `"gp2"` | no |
| <a name="input_master_instance_group_ebs_volumes_per_instance"></a> [master\_instance\_group\_ebs\_volumes\_per\_instance](#input\_master\_instance\_group\_ebs\_volumes\_per\_instance) | The number of EBS volumes with this configuration to attach to each EC2 instance in the Master instance group | `number` | `1` | no |
| <a name="input_master_instance_group_instance_count"></a> [master\_instance\_group\_instance\_count](#input\_master\_instance\_group\_instance\_count) | Target number of instances for the Master instance group. Must be at least 1 | `number` | `1` | no |
| <a name="input_master_instance_group_instance_type"></a> [master\_instance\_group\_instance\_type](#input\_master\_instance\_group\_instance\_type) | EC2 instance type for all instances in the Master instance group | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_release_label"></a> [release\_label](#input\_release\_label) | The release label for the Amazon EMR release. https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-5x.html | `string` | `"emr-5.25.0"` | no |
| <a name="input_route_table_id"></a> [route\_table\_id](#input\_route\_table\_id) | Route table ID for the VPC S3 Endpoint when launching the EMR cluster in a private subnet. Required when `subnet_type` is `private` | `string` | `""` | no |
| <a name="input_scale_down_behavior"></a> [scale\_down\_behavior](#input\_scale\_down\_behavior) | The way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized | `string` | `null` | no |
| <a name="input_security_configuration"></a> [security\_configuration](#input\_security\_configuration) | The security configuration name to attach to the EMR cluster. Only valid for EMR clusters with `release_label` 4.8.0 or greater. See https://www.terraform.io/docs/providers/aws/r/emr_security_configuration.html for more info | `string` | `null` | no |
| <a name="input_service_access_security_group"></a> [service\_access\_security\_group](#input\_service\_access\_security\_group) | The name of the existing additional security group that will be used for EMR core & task nodes. If empty, a new security group will be created | `string` | `""` | no |
| <a name="input_slave_allowed_cidr_blocks"></a> [slave\_allowed\_cidr\_blocks](#input\_slave\_allowed\_cidr\_blocks) | List of CIDR blocks to be allowed to access the slave instances | `list(string)` | `[]` | no |
| <a name="input_slave_allowed_security_groups"></a> [slave\_allowed\_security\_groups](#input\_slave\_allowed\_security\_groups) | List of security groups to be allowed to connect to the slave instances | `list(string)` | `[]` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_step_concurrency_level"></a> [step\_concurrency\_level](#input\_step\_concurrency\_level) | The number of steps that can be executed concurrently. You can specify a maximum of 256 steps. Only valid for EMR clusters with release\_label 5.28.0 or greater. | `number` | `null` | no |
| <a name="input_steps"></a> [steps](#input\_steps) | List of steps to run when creating the cluster. | <pre>list(object({<br>    name              = string<br>    action_on_failure = string<br>    hadoop_jar_step = object({<br>      args       = list(string)<br>      jar        = string<br>      main_class = string<br>      properties = map(string)<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | VPC subnet ID where you want the job flow to launch. Cannot specify the `cc1.4xlarge` instance type for nodes of a job flow launched in a Amazon VPC | `string` | n/a | yes |
| <a name="input_subnet_type"></a> [subnet\_type](#input\_subnet\_type) | Type of VPC subnet ID where you want the job flow to launch. Supported values are `private` or `public` | `string` | `"private"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| <a name="input_task_instance_group_autoscaling_policy"></a> [task\_instance\_group\_autoscaling\_policy](#input\_task\_instance\_group\_autoscaling\_policy) | String containing the EMR Auto Scaling Policy JSON for the Task instance group | `string` | `null` | no |
| <a name="input_task_instance_group_bid_price"></a> [task\_instance\_group\_bid\_price](#input\_task\_instance\_group\_bid\_price) | Bid price for each EC2 instance in the Task instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances | `string` | `null` | no |
| <a name="input_task_instance_group_ebs_iops"></a> [task\_instance\_group\_ebs\_iops](#input\_task\_instance\_group\_ebs\_iops) | The number of I/O operations per second (IOPS) that the Task volume supports | `number` | `null` | no |
| <a name="input_task_instance_group_ebs_optimized"></a> [task\_instance\_group\_ebs\_optimized](#input\_task\_instance\_group\_ebs\_optimized) | Indicates whether an Amazon EBS volume in the Task instance group is EBS-optimized. Changing this forces a new resource to be created | `bool` | `false` | no |
| <a name="input_task_instance_group_ebs_size"></a> [task\_instance\_group\_ebs\_size](#input\_task\_instance\_group\_ebs\_size) | Task instances volume size, in gibibytes (GiB) | `number` | `10` | no |
| <a name="input_task_instance_group_ebs_type"></a> [task\_instance\_group\_ebs\_type](#input\_task\_instance\_group\_ebs\_type) | Task instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | `string` | `"gp2"` | no |
| <a name="input_task_instance_group_ebs_volumes_per_instance"></a> [task\_instance\_group\_ebs\_volumes\_per\_instance](#input\_task\_instance\_group\_ebs\_volumes\_per\_instance) | The number of EBS volumes with this configuration to attach to each EC2 instance in the Task instance group | `number` | `1` | no |
| <a name="input_task_instance_group_instance_count"></a> [task\_instance\_group\_instance\_count](#input\_task\_instance\_group\_instance\_count) | Target number of instances for the Task instance group. Must be at least 1 | `number` | `1` | no |
| <a name="input_task_instance_group_instance_type"></a> [task\_instance\_group\_instance\_type](#input\_task\_instance\_group\_instance\_type) | EC2 instance type for all instances in the Task instance group | `string` | `null` | no |
| <a name="input_termination_protection"></a> [termination\_protection](#input\_termination\_protection) | Switch on/off termination protection (default is false, except when using multiple master nodes). Before attempting to destroy the resource when termination protection is enabled, this configuration must be applied with its value set to false | `bool` | `false` | no |
| <a name="input_use_existing_additional_master_security_group"></a> [use\_existing\_additional\_master\_security\_group](#input\_use\_existing\_additional\_master\_security\_group) | If set to `true`, will use variable `additional_master_security_group` using an existing security group that was created outside of this module | `bool` | `false` | no |
| <a name="input_use_existing_additional_slave_security_group"></a> [use\_existing\_additional\_slave\_security\_group](#input\_use\_existing\_additional\_slave\_security\_group) | If set to `true`, will use variable `additional_slave_security_group` using an existing security group that was created outside of this module | `bool` | `false` | no |
| <a name="input_use_existing_managed_master_security_group"></a> [use\_existing\_managed\_master\_security\_group](#input\_use\_existing\_managed\_master\_security\_group) | If set to `true`, will use variable `managed_master_security_group` using an existing security group that was created outside of this module | `bool` | `false` | no |
| <a name="input_use_existing_managed_slave_security_group"></a> [use\_existing\_managed\_slave\_security\_group](#input\_use\_existing\_managed\_slave\_security\_group) | If set to `true`, will use variable `managed_slave_security_group` using an existing security group that was created outside of this module | `bool` | `false` | no |
| <a name="input_use_existing_service_access_security_group"></a> [use\_existing\_service\_access\_security\_group](#input\_use\_existing\_service\_access\_security\_group) | If set to `true`, will use variable `service_access_security_group` using an existing security group that was created outside of this module | `bool` | `false` | no |
| <a name="input_visible_to_all_users"></a> [visible\_to\_all\_users](#input\_visible\_to\_all\_users) | Whether the job flow is visible to all IAM users of the AWS account associated with the job flow | `bool` | `true` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to create the cluster in (e.g. `vpc-a22222ee`) | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | Route53 parent zone ID. If provided (not empty), the module will create sub-domain DNS records for the masters and slaves | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | EMR cluster ID |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | EMR cluster name |
| <a name="output_ec2_role"></a> [ec2\_role](#output\_ec2\_role) | Role name of EMR EC2 instances so users can attach more policies |
| <a name="output_master_host"></a> [master\_host](#output\_master\_host) | Name of the cluster CNAME record for the master nodes in the parent DNS zone |
| <a name="output_master_public_dns"></a> [master\_public\_dns](#output\_master\_public\_dns) | Master public DNS |
| <a name="output_master_security_group_id"></a> [master\_security\_group\_id](#output\_master\_security\_group\_id) | Master security group ID |
| <a name="output_slave_security_group_id"></a> [slave\_security\_group\_id](#output\_slave\_security\_group\_id) | Slave security group ID |
<!-- markdownlint-restore -->
