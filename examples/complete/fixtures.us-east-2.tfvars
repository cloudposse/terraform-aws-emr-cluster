region = "us-east-2"

availability_zones = ["us-east-2a"]

namespace = "eg"

stage = "test"

name = "emr"

ebs_root_volume_size = 10

visible_to_all_users = true

# https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-components.html
# https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-670-release.html
release_label = "emr-6.7.0"

# https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-ha-applications.html
# https://github.com/hashicorp/terraform-provider-aws/issues/23226
applications = ["Hive", "Presto", "JupyterEnterpriseGateway", "JupyterHub"]

core_instance_group_instance_type = "m4.large"

core_instance_group_instance_count = 1

core_instance_group_ebs_size = 10

core_instance_group_ebs_type = "gp2"

core_instance_group_ebs_volumes_per_instance = 1

master_instance_group_instance_type = "m4.large"

master_instance_group_instance_count = 1

master_instance_group_ebs_size = 10

master_instance_group_ebs_type = "gp2"

master_instance_group_ebs_volumes_per_instance = 1

create_task_instance_group = false

ssh_public_key_path = "/secrets"

generate_ssh_key = true
