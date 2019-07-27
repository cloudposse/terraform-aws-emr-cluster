region = "us-east-2"

availability_zones = ["us-east-2a"]

namespace = "eg"

stage = "test"

name = "emr-cluster"

ebs_root_volume_size = 5

visible_to_all_users = false

release_label = "emr-5.25.0"

applications = ["Hadoop", "Hive", "Presto"]

bootstrap_name = "runif"

bootstrap_path = "s3://elasticmapreduce/bootstrap-actions/run-if"

bootstrap_args = ["instance.isMaster=true", "echo running on master node"]

core_instance_group_instance_type = "m4.large"

core_instance_group_instance_count = 1

core_instance_group_ebs_size = 5

core_instance_group_ebs_type = "gp2"

core_instance_group_ebs_iops = 10

core_instance_group_ebs_volumes_per_instance = 1

master_instance_group_instance_type = "m4.large"

master_instance_group_instance_count = 1

master_instance_group_ebs_size = 5

master_instance_group_ebs_type = "gp2"

master_instance_group_ebs_iops = 10

master_instance_group_ebs_volumes_per_instance = 1

create_task_instance_group = false

ssh_public_key_path = "/secrets"

generate_ssh_key = true

# https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html
configurations_json = <<EOF
  [
    {
      "Classification": "hadoop-env",
      "Configurations": [
        {
          "Classification": "export",
          "Properties": {
            "JAVA_HOME": "/usr/lib/jvm/java-1.8.0"
          }
        }
      ],
      "Properties": {}
    }
  ]
EOF
