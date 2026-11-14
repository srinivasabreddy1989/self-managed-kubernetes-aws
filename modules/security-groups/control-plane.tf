
resource "aws_security_group" "control_plane" {
  name        = "${var.name_prefix}-control-plane-sg"
  description = "Security group for Kubernetes control-plane nodes"
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-control-plane-sg"
  })
}

# Kubernetes API server: NLB to control plane
resource "aws_vpc_security_group_ingress_rule" "api_server" {
  security_group_id            = aws_security_group.control_plane.id
  referenced_security_group_id = aws_security_group.load_balancer.id

  ip_protocol = "tcp"
  from_port   = 6443
  to_port     = 6443

  description = "Kubernetes API from internal NLB"
}

# etcd client communication
resource "aws_vpc_security_group_ingress_rule" "etcd_client" {
  security_group_id            = aws_security_group.control_plane.id
  referenced_security_group_id = aws_security_group.control_plane.id

  ip_protocol = "tcp"
  from_port   = 2379
  to_port     = 2379

  description = "etcd client communication"
}

# etcd peer communication
resource "aws_vpc_security_group_ingress_rule" "etcd_peer" {
  security_group_id            = aws_security_group.control_plane.id
  referenced_security_group_id = aws_security_group.control_plane.id

  ip_protocol = "tcp"
  from_port   = 2380
  to_port     = 2380

  description = "etcd peer communication"
}

# Kubelet communication from cluster nodes
resource "aws_vpc_security_group_ingress_rule" "kubelet" {
  security_group_id            = aws_security_group.control_plane.id
  referenced_security_group_id = aws_security_group.worker.id

  ip_protocol = "tcp"
  from_port   = 10250
  to_port     = 10250

  description = "Kubelet communication from workers"
}

# Control-plane internal communication
resource "aws_vpc_security_group_ingress_rule" "control_plane_internal" {
  security_group_id            = aws_security_group.control_plane.id
  referenced_security_group_id = aws_security_group.control_plane.id

  ip_protocol = "-1"

  description = "Control-plane internal communication"
}

# Calico VXLAN from Kubernetes nodes
resource "aws_vpc_security_group_ingress_rule" "calico_vxlan" {
  security_group_id            = aws_security_group.control_plane.id
  referenced_security_group_id = aws_security_group.worker.id

  ip_protocol = "udp"
  from_port   = 4789
  to_port     = 4789

  description = "Calico VXLAN from workers"
}

resource "aws_vpc_security_group_egress_rule" "control_plane_all" {
  security_group_id = aws_security_group.control_plane.id

  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"

  description = "Outbound traffic"
}
