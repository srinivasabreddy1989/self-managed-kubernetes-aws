
output "kubernetes_api_endpoint" {
  description = "Internal Kubernetes API endpoint"
  value       = module.load_balancer.nlb_dns_name
}

output "ansible_ssm_bucket_name" {
  description = "Private, short-retention bucket used by Ansible SSM file transfers"
  value       = aws_s3_bucket.ansible_ssm.id
}
