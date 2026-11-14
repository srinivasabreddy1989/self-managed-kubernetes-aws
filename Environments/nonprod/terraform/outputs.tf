output "vpc_id" {
  value = aws_vpc.k8s_vpc.id
}

output "public_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.public :
    key => subnet.id
  }
}

output "control_plane_api_endpoint" {
  description = "Public Kubernetes API endpoint for administrator access"
  value       = "${aws_eip.control_plane.public_ip}:6443"
}

output "control_plane_internal_api_endpoint" {
  description = "Private Kubernetes API endpoint for cluster nodes"
  value       = "${aws_instance.nodes["control-plane"].private_ip}:6443"
}

output "nodes" {
  value = {
    for name, instance in aws_instance.nodes :
    name => {
      instance_id = instance.id
      private_ip  = instance.private_ip

      public_ip = name == "control-plane" ? (
        aws_eip.control_plane.public_ip
      ) : instance.public_ip
    }
  }
}

output "ansible_ssm_bucket_name" {
  description = "Private, short-retention bucket used by Ansible SSM file transfers"
  value       = aws_s3_bucket.ansible_ssm.id
}