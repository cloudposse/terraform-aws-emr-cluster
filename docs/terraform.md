## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional_info | A JSON string for selecting additional features such as adding proxy information. Note: Currently there is no API to retrieve the value of this argument after EMR cluster creation from provider, therefore Terraform cannot detect drift from the actual EMR cluster if its value is changed outside Terraform | string | `null` | no |
| additional_master_security_groups | String containing a comma separated list of additional Amazon EC2 security group IDs for the master nodes | string | `null` | no |
| additional_slave_security_groups | String containing a comma separated list of additional Amazon EC2 security group IDs for the slave nodes | string | `null` | no |
| applications | A list of applications for the cluster. Valid values are: Flink, Ganglia, Hadoop, HBase, HCatalog, Hive, Hue, JupyterHub, Livy, Mahout, MXNet, Oozie, Phoenix, Pig, Presto, Spark, Sqoop, TensorFlow, Tez, Zeppelin, and ZooKeeper (as of EMR 5.25.0). Case insensitive | list(string) | - | yes |
| attributes | Additional attributes (_e.g._ "1") | list(string) | `<list>` | no |
| bootstrap_args | List of command line arguments to pass to the bootstrap action script | list(string) | `null` | no |
| bootstrap_name | Name of the bootstrap action | string | - | yes |
| bootstrap_path | Location of the script to run during a bootstrap action. Can be either a location in Amazon S3 or on a local file system | string | - | yes |
| configurations_json | A JSON string for supplying list of configurations for the EMR cluster. See https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html for more details | string | `null` | no |
| core_instance_group_autoscaling_policy | String containing the EMR Auto Scaling Policy JSON for the Core instance group | string | `null` | no |
| core_instance_group_bid_price | Bid price for each EC2 instance in the Core instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances | string | `null` | no |
| core_instance_group_ebs_iops | The number of I/O operations per second (IOPS) that the Core volume supports | number | `null` | no |
| core_instance_group_ebs_size | Core instances volume size, in gibibytes (GiB) | number | - | yes |
| core_instance_group_ebs_type | Core instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | string | `gp2` | no |
| core_instance_group_ebs_volumes_per_instance | The number of EBS volumes with this configuration to attach to each EC2 instance in the Core instance group | number | `1` | no |
| core_instance_group_instance_count | Target number of instances for the Core instance group. Must be at least 1 | number | `1` | no |
| core_instance_group_instance_type | EC2 instance type for all instances in the Core instance group | string | - | yes |
| create_task_instance_group | Whether to create an instance group for Task nodes. For more info: https://www.terraform.io/docs/providers/aws/r/emr_instance_group.html, https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-master-core-task-nodes.html | bool | `false` | no |
| custom_ami_id | A custom Amazon Linux AMI for the cluster (instead of an EMR-owned AMI). Available in Amazon EMR version 5.7.0 and later | string | `null` | no |
| delimiter | Delimiter between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| ebs_root_volume_size | Size in GiB of the EBS root device volume of the Linux AMI that is used for each EC2 instance. Available in Amazon EMR version 4.x and later | number | `10` | no |
| enabled | Set to false to prevent the module from creating any resources | bool | `true` | no |
| keep_job_flow_alive_when_no_steps | Switch on/off run cluster with no steps or when all steps are complete | bool | `true` | no |
| key_name | Amazon EC2 key pair that can be used to ssh to the master node as the user called `hadoop` | string | `null` | no |
| log_uri | The path to the Amazon S3 location where logs for this cluster are stored | string | `null` | no |
| master_allowed_cidr_blocks | List of CIDR blocks to be allowed to access the master instances | list(string) | `<list>` | no |
| master_allowed_security_groups | List of security groups to be allowed to connect to the master instances | list(string) | `<list>` | no |
| master_dns_name | Name of the cluster CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `emr-master-var.name` | string | `null` | no |
| master_instance_group_bid_price | Bid price for each EC2 instance in the Master instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances | string | `null` | no |
| master_instance_group_ebs_iops | The number of I/O operations per second (IOPS) that the Master volume supports | number | `null` | no |
| master_instance_group_ebs_size | Master instances volume size, in gibibytes (GiB) | number | - | yes |
| master_instance_group_ebs_type | Master instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | string | `gp2` | no |
| master_instance_group_ebs_volumes_per_instance | The number of EBS volumes with this configuration to attach to each EC2 instance in the Master instance group | number | `1` | no |
| master_instance_group_instance_count | Target number of instances for the Master instance group. Must be at least 1 | number | `1` | no |
| master_instance_group_instance_type | EC2 instance type for all instances in the Master instance group | string | - | yes |
| name | Name of the application | string | - | yes |
| namespace | Namespace (e.g. `eg` or `cp`) | string | `` | no |
| release_label | The release label for the Amazon EMR release. https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-5x.html | string | `emr-5.25.0` | no |
| scale_down_behavior | The way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized | string | `null` | no |
| security_configuration | The security configuration name to attach to the EMR cluster. Only valid for EMR clusters with `release_label` 4.8.0 or greater. See https://www.terraform.io/docs/providers/aws/r/emr_security_configuration.html for more info | string | `null` | no |
| service_access_allowed_cidr_blocks | List of CIDR blocks to be allowed to connect to the cluster for service access, which applies only to clusters in private subnets | list(string) | `<list>` | no |
| service_access_allowed_security_groups | List of security groups to be allowed to connect to the cluster for service access, which applies only to clusters in private subnets | list(string) | `<list>` | no |
| slave_allowed_cidr_blocks | List of CIDR blocks to be allowed to access the slave instances | list(string) | `<list>` | no |
| slave_allowed_security_groups | List of security groups to be allowed to connect to the slave instances | list(string) | `<list>` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | `` | no |
| subnet_id | VPC subnet ID where you want the job flow to launch. Cannot specify the `cc1.4xlarge` instance type for nodes of a job flow launched in a Amazon VPC | string | - | yes |
| tags | Additional tags (_e.g._ { BusinessUnit : ABC }) | map(string) | `<map>` | no |
| task_instance_group_autoscaling_policy | String containing the EMR Auto Scaling Policy JSON for the Task instance group | string | `null` | no |
| task_instance_group_bid_price | Bid price for each EC2 instance in the Task instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances | string | `null` | no |
| task_instance_group_ebs_iops | The number of I/O operations per second (IOPS) that the Task volume supports | number | `null` | no |
| task_instance_group_ebs_optimized | Indicates whether an Amazon EBS volume in the Task instance group is EBS-optimized. Changing this forces a new resource to be created | bool | `false` | no |
| task_instance_group_ebs_size | Task instances volume size, in gibibytes (GiB) | number | `10` | no |
| task_instance_group_ebs_type | Task instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | string | `gp2` | no |
| task_instance_group_ebs_volumes_per_instance | The number of EBS volumes with this configuration to attach to each EC2 instance in the Task instance group | number | `1` | no |
| task_instance_group_instance_count | Target number of instances for the Task instance group. Must be at least 1 | number | `1` | no |
| task_instance_group_instance_type | EC2 instance type for all instances in the Task instance group | string | `null` | no |
| termination_protection | Switch on/off termination protection (default is false, except when using multiple master nodes). Before attempting to destroy the resource when termination protection is enabled, this configuration must be applied with its value set to false | bool | `false` | no |
| visible_to_all_users | Whether the job flow is visible to all IAM users of the AWS account associated with the job flow | bool | `true` | no |
| vpc_id | VPC ID to create the cluster in (e.g. `vpc-a22222ee`) | string | - | yes |
| zone_id | Route53 parent zone ID. If provided (not empty), the module will create sub-domain DNS records for the masters and slaves | string | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster_id | EMR cluster ID |
| cluster_name | EMR cluster name |
| master_host | Name of the cluster CNAME record for the master nodes in the parent DNS zone |
| master_public_dns | Master public DNS |
| master_security_group_id | Master security group ID |
| slave_security_group_id | Slave security group ID |

