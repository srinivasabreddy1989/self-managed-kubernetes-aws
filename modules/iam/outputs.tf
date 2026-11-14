
output "iam_role_name" {
  description = "Kubernetes EC2 IAM role name"
  value       = aws_iam_role.k8s_node_role.name
}

output "iam_role_arn" {
  description = "Kubernetes EC2 IAM role ARN"
  value       = aws_iam_role.k8s_node_role.arn
}

output "instance_profile_name" {
  description = "EC2 instance profile name"
  value       = aws_iam_instance_profile.k8s_node_profile.name
}

output "instance_profile_arn" {
  description = "EC2 instance profile ARN"
  value       = aws_iam_instance_profile.k8s_node_profile.arn
}
