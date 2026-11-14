
output "control_plane_instance_ids" {
  description = "Control-plane EC2 instance IDs"
  value = {
    for az, instance in aws_instance.control_plane :
    az => instance.id
  }
}

output "control_plane_private_ips" {
  description = "Control-plane private IP addresses"
  value = {
    for az, instance in aws_instance.control_plane :
    az => instance.private_ip
  }
}

output "worker_instance_ids" {
  description = "Worker EC2 instance IDs"
  value = {
    for az, instance in aws_instance.worker :
    az => instance.id
  }
}

output "worker_private_ips" {
  description = "Worker private IP addresses"
  value = {
    for az, instance in aws_instance.worker :
    az => instance.private_ip
  }
}
