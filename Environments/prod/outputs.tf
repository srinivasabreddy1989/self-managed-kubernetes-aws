
output "kubernetes_api_endpoint" {
  description = "Internal Kubernetes API endpoint"
  value       = module.load_balancer.nlb_dns_name
}
