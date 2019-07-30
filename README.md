<!-- This file was automatically generated by the `build-harness`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->
[![README Header][readme_header_img]][readme_header_link]

[![Cloud Posse][logo]](https://cpco.io/homepage)

# terraform-aws-emr-cluster [![Codefresh Build Status](https://g.codefresh.io/api/badges/pipeline/cloudposse/terraform-modules%2Fterraform-aws-emr-cluster?type=cf-1)](https://g.codefresh.io/public/accounts/cloudposse/pipelines/5d3b77ee6818e3f6dec32663) [![Latest Release](https://img.shields.io/github/release/cloudposse/terraform-aws-emr-cluster.svg)](https://github.com/cloudposse/terraform-aws-emr-cluster/releases/latest) [![Slack Community](https://slack.cloudposse.com/badge.svg)](https://slack.cloudposse.com)


Terraform module to provision an Elastic MapReduce (EMR) cluster on AWS.


---

This project is part of our comprehensive ["SweetOps"](https://cpco.io/sweetops) approach towards DevOps. 
[<img align="right" title="Share via Email" src="https://docs.cloudposse.com/images/ionicons/ios-email-outline-2.0.1-16x16-999999.svg"/>][share_email]
[<img align="right" title="Share on Google+" src="https://docs.cloudposse.com/images/ionicons/social-googleplus-outline-2.0.1-16x16-999999.svg" />][share_googleplus]
[<img align="right" title="Share on Facebook" src="https://docs.cloudposse.com/images/ionicons/social-facebook-outline-2.0.1-16x16-999999.svg" />][share_facebook]
[<img align="right" title="Share on Reddit" src="https://docs.cloudposse.com/images/ionicons/social-reddit-outline-2.0.1-16x16-999999.svg" />][share_reddit]
[<img align="right" title="Share on LinkedIn" src="https://docs.cloudposse.com/images/ionicons/social-linkedin-outline-2.0.1-16x16-999999.svg" />][share_linkedin]
[<img align="right" title="Share on Twitter" src="https://docs.cloudposse.com/images/ionicons/social-twitter-outline-2.0.1-16x16-999999.svg" />][share_twitter]


[![Terraform Open Source Modules](https://docs.cloudposse.com/images/terraform-open-source-modules.svg)][terraform_modules]



It's 100% Open Source and licensed under the [APACHE2](LICENSE).







We literally have [*hundreds of terraform modules*][terraform_modules] that are Open Source and well-maintained. Check them out! 







## Usage


**IMPORTANT:** The `master` branch is used in `source` just as an example. In your code, do not pin to `master` because there may be breaking changes between releases.
Instead pin to the release tag (e.g. `?ref=tags/x.y.z`) of one of our [latest releases](https://github.com/cloudposse/terraform-aws-emr-cluster/releases).



For a complete example, see [examples/complete](examples/complete)

```hcl
provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source     = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=master"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  cidr_block = "172.16.0.0/16"
}

module "subnets" {
  source               = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=master"
  availability_zones   = var.availability_zones
  namespace            = var.namespace
  stage                = var.stage
  name                 = var.name
  vpc_id               = module.vpc.vpc_id
  igw_id               = module.vpc.igw_id
  cidr_block           = module.vpc.vpc_cidr_block
  nat_gateway_enabled  = false
  nat_instance_enabled = false
}

module "s3_log_storage" {
  source        = "git::https://github.com/cloudposse/terraform-aws-s3-log-storage.git?ref=master"
  region        = var.region
  namespace     = var.namespace
  stage         = var.stage
  name          = var.name
  attributes    = ["logs"]
  force_destroy = true
}

module "aws_key_pair" {
  source              = "git::https://github.com/cloudposse/terraform-aws-key-pair.git?ref=master"
  namespace           = var.namespace
  stage               = var.stage
  name                = var.name
  attributes          = ["ssh", "key"]
  ssh_public_key_path = var.ssh_public_key_path
  generate_ssh_key    = var.generate_ssh_key
}

module "emr_cluster" {
  source                                         = "git::https://github.com/cloudposse/terraform-aws-emr-cluster.git?ref=master"
  namespace                                      = var.namespace
  stage                                          = var.stage
  name                                           = var.name
  master_allowed_security_groups                 = [module.vpc.vpc_default_security_group_id]
  slave_allowed_security_groups                  = [module.vpc.vpc_default_security_group_id]
  region                                         = var.region
  vpc_id                                         = module.vpc.vpc_id
  subnet_id                                      = module.subnets.private_subnet_ids[0]
  route_table_ids                                = module.subnets.private_route_table_ids
  subnet_type                                    = "private"
  ebs_root_volume_size                           = var.ebs_root_volume_size
  visible_to_all_users                           = var.visible_to_all_users
  release_label                                  = var.release_label
  applications                                   = var.applications
  configurations_json                            = var.configurations_json
  core_instance_group_instance_type              = var.core_instance_group_instance_type
  core_instance_group_instance_count             = var.core_instance_group_instance_count
  core_instance_group_ebs_size                   = var.core_instance_group_ebs_size
  core_instance_group_ebs_type                   = var.core_instance_group_ebs_type
  core_instance_group_ebs_volumes_per_instance   = var.core_instance_group_ebs_volumes_per_instance
  master_instance_group_instance_type            = var.master_instance_group_instance_type
  master_instance_group_instance_count           = var.master_instance_group_instance_count
  master_instance_group_ebs_size                 = var.master_instance_group_ebs_size
  master_instance_group_ebs_type                 = var.master_instance_group_ebs_type
  master_instance_group_ebs_volumes_per_instance = var.master_instance_group_ebs_volumes_per_instance
  create_task_instance_group                     = var.create_task_instance_group
  log_uri                                        = format("s3://%s", module.s3_log_storage.bucket_id)
  key_name                                       = module.aws_key_pair.key_name
}
```






## Makefile Targets
```
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint terraform code

```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional_info | A JSON string for selecting additional features such as adding proxy information. Note: Currently there is no API to retrieve the value of this argument after EMR cluster creation from provider, therefore Terraform cannot detect drift from the actual EMR cluster if its value is changed outside Terraform | string | `null` | no |
| applications | A list of applications for the cluster. Valid values are: Flink, Ganglia, Hadoop, HBase, HCatalog, Hive, Hue, JupyterHub, Livy, Mahout, MXNet, Oozie, Phoenix, Pig, Presto, Spark, Sqoop, TensorFlow, Tez, Zeppelin, and ZooKeeper (as of EMR 5.25.0). Case insensitive | list(string) | - | yes |
| attributes | Additional attributes (_e.g._ "1") | list(string) | `<list>` | no |
| bootstrap_action | List of bootstrap actions that will be run before Hadoop is started on the cluster nodes | object | `<list>` | no |
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
| region | AWS region | string | - | yes |
| release_label | The release label for the Amazon EMR release. https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-5x.html | string | `emr-5.25.0` | no |
| scale_down_behavior | The way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized | string | `null` | no |
| security_configuration | The security configuration name to attach to the EMR cluster. Only valid for EMR clusters with `release_label` 4.8.0 or greater. See https://www.terraform.io/docs/providers/aws/r/emr_security_configuration.html for more info | string | `null` | no |
| slave_allowed_cidr_blocks | List of CIDR blocks to be allowed to access the slave instances | list(string) | `<list>` | no |
| slave_allowed_security_groups | List of security groups to be allowed to connect to the slave instances | list(string) | `<list>` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | `` | no |
| subnet_id | VPC subnet ID where you want the job flow to launch. Cannot specify the `cc1.4xlarge` instance type for nodes of a job flow launched in a Amazon VPC | string | - | yes |
| subnet_type | Type of VPC subnet ID where you want the job flow to launch. Supported values are `private` or `public` | string | `private` | no |
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




## Share the Love 

Like this project? Please give it a ★ on [our GitHub](https://github.com/cloudposse/terraform-aws-emr-cluster)! (it helps us **a lot**) 

Are you using this project or any of our other projects? Consider [leaving a testimonial][testimonial]. =)


## Related Projects

Check out these related projects.

- [terraform-aws-rds-cluster](https://github.com/cloudposse/terraform-aws-rds-cluster) - Terraform module to provision an RDS Aurora cluster for MySQL or Postgres
- [terraform-aws-rds](https://github.com/cloudposse/terraform-aws-rds) - Terraform module to provision AWS RDS instances
- [terraform-aws-rds-cloudwatch-sns-alarms](https://github.com/cloudposse/terraform-aws-rds-cloudwatch-sns-alarms) - Terraform module that configures important RDS alerts using CloudWatch and sends them to an SNS topic



## Help

**Got a question?**

File a GitHub [issue](https://github.com/cloudposse/terraform-aws-emr-cluster/issues), send us an [email][email] or join our [Slack Community][slack].

[![README Commercial Support][readme_commercial_support_img]][readme_commercial_support_link]

## Commercial Support

Work directly with our team of DevOps experts via email, slack, and video conferencing. 

We provide [*commercial support*][commercial_support] for all of our [Open Source][github] projects. As a *Dedicated Support* customer, you have access to our team of subject matter experts at a fraction of the cost of a full-time engineer. 

[![E-Mail](https://img.shields.io/badge/email-hello@cloudposse.com-blue.svg)][email]

- **Questions.** We'll use a Shared Slack channel between your team and ours.
- **Troubleshooting.** We'll help you triage why things aren't working.
- **Code Reviews.** We'll review your Pull Requests and provide constructive feedback.
- **Bug Fixes.** We'll rapidly work to fix any bugs in our projects.
- **Build New Terraform Modules.** We'll [develop original modules][module_development] to provision infrastructure.
- **Cloud Architecture.** We'll assist with your cloud strategy and design.
- **Implementation.** We'll provide hands-on support to implement our reference architectures. 



## Terraform Module Development

Are you interested in custom Terraform module development? Submit your inquiry using [our form][module_development] today and we'll get back to you ASAP.


## Slack Community

Join our [Open Source Community][slack] on Slack. It's **FREE** for everyone! Our "SweetOps" community is where you get to talk with others who share a similar vision for how to rollout and manage infrastructure. This is the best place to talk shop, ask questions, solicit feedback, and work together as a community to build totally *sweet* infrastructure.

## Newsletter

Signup for [our newsletter][newsletter] that covers everything on our technology radar.  Receive updates on what we're up to on GitHub as well as awesome new projects we discover. 

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-aws-emr-cluster/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or [help out](https://cpco.io/help-out) with our other projects, we would love to hear from you! Shoot us an [email][email].

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!


## Copyright

Copyright © 2017-2019 [Cloud Posse, LLC](https://cpco.io/copyright)



## License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.









## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained and funded by [Cloud Posse, LLC][website]. Like it? Please let us know by [leaving a testimonial][testimonial]!

[![Cloud Posse][logo]][website]

We're a [DevOps Professional Services][hire] company based in Los Angeles, CA. We ❤️  [Open Source Software][we_love_open_source].

We offer [paid support][commercial_support] on all of our projects.  

Check out [our other projects][github], [follow us on twitter][twitter], [apply for a job][jobs], or [hire us][hire] to help with your cloud strategy and implementation.



### Contributors

|  [![Erik Osterman][osterman_avatar]][osterman_homepage]<br/>[Erik Osterman][osterman_homepage] | [![Andriy Knysh][aknysh_avatar]][aknysh_homepage]<br/>[Andriy Knysh][aknysh_homepage] | [![Igor Rodionov][goruha_avatar]][goruha_homepage]<br/>[Igor Rodionov][goruha_homepage] |
|---|---|---|

  [osterman_homepage]: https://github.com/osterman
  [osterman_avatar]: https://github.com/osterman.png?size=150
  [aknysh_homepage]: https://github.com/aknysh
  [aknysh_avatar]: https://github.com/aknysh.png?size=150
  [goruha_homepage]: https://github.com/goruha
  [goruha_avatar]: https://github.com/goruha.png?size=150



[![README Footer][readme_footer_img]][readme_footer_link]
[![Beacon][beacon]][website]

  [logo]: https://cloudposse.com/logo-300x69.svg
  [docs]: https://cpco.io/docs
  [website]: https://cpco.io/homepage
  [github]: https://cpco.io/github
  [jobs]: https://cpco.io/jobs
  [hire]: https://cpco.io/hire
  [slack]: https://cpco.io/slack
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://cpco.io/twitter
  [testimonial]: https://cpco.io/leave-testimonial
  [newsletter]: https://cpco.io/newsletter
  [email]: https://cpco.io/email
  [commercial_support]: https://cpco.io/commercial-support
  [we_love_open_source]: https://cpco.io/we-love-open-source
  [module_development]: https://cpco.io/module-development
  [terraform_modules]: https://cpco.io/terraform-modules
  [readme_header_img]: https://cloudposse.com/readme/header/img?repo=cloudposse/terraform-aws-emr-cluster
  [readme_header_link]: https://cloudposse.com/readme/header/link?repo=cloudposse/terraform-aws-emr-cluster
  [readme_footer_img]: https://cloudposse.com/readme/footer/img?repo=cloudposse/terraform-aws-emr-cluster
  [readme_footer_link]: https://cloudposse.com/readme/footer/link?repo=cloudposse/terraform-aws-emr-cluster
  [readme_commercial_support_img]: https://cloudposse.com/readme/commercial-support/img?repo=cloudposse/terraform-aws-emr-cluster
  [readme_commercial_support_link]: https://cloudposse.com/readme/commercial-support/link?repo=cloudposse/terraform-aws-emr-cluster
  [share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-emr-cluster&url=https://github.com/cloudposse/terraform-aws-emr-cluster
  [share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-emr-cluster&url=https://github.com/cloudposse/terraform-aws-emr-cluster
  [share_reddit]: https://reddit.com/submit/?url=https://github.com/cloudposse/terraform-aws-emr-cluster
  [share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/cloudposse/terraform-aws-emr-cluster
  [share_googleplus]: https://plus.google.com/share?url=https://github.com/cloudposse/terraform-aws-emr-cluster
  [share_email]: mailto:?subject=terraform-aws-emr-cluster&body=https://github.com/cloudposse/terraform-aws-emr-cluster
  [beacon]: https://ga-beacon.cloudposse.com/UA-76589703-4/cloudposse/terraform-aws-emr-cluster?pixel&cs=github&cm=readme&an=terraform-aws-emr-cluster
