# Kubernetes node security group

resource "aws_security_group" "k8s_nodes" {
  name        = "${var.project_name}-nodes-sg"
  description = "Security group for Kubernetes nodes"
  vpc_id      = aws_vpc.k8s_vpc.id

  tags = {
    Name = "${var.project_name}-nodes-sg"
  }
}

# Allow Kubernetes API access from administrator

resource "aws_vpc_security_group_ingress_rule" "api_server" {
  security_group_id = aws_security_group.k8s_nodes.id

  description = "Kubernetes API access from administrator"

  cidr_ipv4   = var.admin_cidr
  ip_protocol = "tcp"
  from_port   = 6443
  to_port     = 6443
}

# Allow communication between Kubernetes nodes

resource "aws_vpc_security_group_ingress_rule" "node_internal" {
  security_group_id = aws_security_group.k8s_nodes.id

  description = "Allow communication between cluster nodes"

  referenced_security_group_id = aws_security_group.k8s_nodes.id
  ip_protocol                  = "-1"
}

# Allow outbound traffic

resource "aws_vpc_security_group_egress_rule" "outbound" {
  security_group_id = aws_security_group.k8s_nodes.id

  description = "Allow outbound traffic"

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}