
output "control_plane_sg_id" {
  description = "Control-plane security group ID"
  value       = aws_security_group.control_plane.id
}

output "worker_sg_id" {
  description = "Worker security group ID"
  value       = aws_security_group.worker.id
}

output "load_balancer_sg_id" {
  description = "NLB security group ID"
  value       = aws_security_group.load_balancer.id
}
