output "cluster_id" {
  value = join("", aws_emr_cluster.default.*.id)
}

output "cluster_name" {
  value = join("", aws_emr_cluster.default.*.name)
}

output "master_public_dns" {
  value = join("", aws_emr_cluster.default.*.master_public_dns)
}

output "master_security_group_id" {
  value = join("", aws_security_group.master.*.id)
}

output "slave_security_group_id" {
  value = join("", aws_security_group.slave.*.id)
}

output "master_host" {
  value       = module.dns_master.hostname
  description = "DB Master hostname"
}
