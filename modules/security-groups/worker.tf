
resource "aws_security_group" "worker" {
  name        = "${var.name_prefix}-worker-sg"
  description = "Security group for Kubernetes worker nodes"
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-worker-sg"
  })
}

# Worker-to-worker communication
resource "aws_vpc_security_group_ingress_rule" "worker_internal" {
  security_group_id            = aws_security_group.worker.id
  referenced_security_group_id = aws_security_group.worker.id

  ip_protocol = "-1"

  description = "Worker internal communication"
}

# Control-plane to worker communication
# Kubelet communication from control-plane nodes
resource "aws_vpc_security_group_ingress_rule" "worker_from_control_plane" {
  security_group_id            = aws_security_group.worker.id
  referenced_security_group_id = aws_security_group.control_plane.id

  ip_protocol = "tcp"
  from_port   = 10250
  to_port     = 10250

  description = "Kubelet communication from control-plane nodes"
}

# Calico VXLAN from control-plane nodes
resource "aws_vpc_security_group_ingress_rule" "calico_vxlan_from_control_plane" {
  security_group_id            = aws_security_group.worker.id
  referenced_security_group_id = aws_security_group.control_plane.id

  ip_protocol = "udp"
  from_port   = 4789
  to_port     = 4789

  description = "Calico VXLAN from control plane"
}

resource "aws_vpc_security_group_egress_rule" "worker_all" {
  security_group_id = aws_security_group.worker.id

  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"

  description = "Outbound traffic"
}
