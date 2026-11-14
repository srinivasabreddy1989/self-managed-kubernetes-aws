
output "nlb_arn" {
  description = "Kubernetes API NLB ARN"
  value       = aws_lb.kubernetes_api.arn
}

output "nlb_dns_name" {
  description = "Private DNS name of Kubernetes API NLB"
  value       = aws_lb.kubernetes_api.dns_name
}

output "nlb_zone_id" {
  description = "Route 53 hosted zone ID for the NLB"
  value       = aws_lb.kubernetes_api.zone_id
}

output "target_group_arn" {
  description = "Kubernetes API target group ARN"
  value       = aws_lb_target_group.kubernetes_api.arn
}
