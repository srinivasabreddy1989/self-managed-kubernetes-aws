
resource "aws_security_group" "load_balancer" {
  name        = "${var.name_prefix}-nlb-sg"
  description = "Security group for internal Kubernetes API NLB"
  vpc_id      = var.vpc_id


  tags = merge(var.tags, {
    Name = "${var.name_prefix}-nlb-sg"
  })
}

# API access from within the VPC
resource "aws_vpc_security_group_ingress_rule" "nlb_api" {
  security_group_id = aws_security_group.load_balancer.id

  cidr_ipv4 = var.vpc_cidr
  ip_protocol = "tcp"
  from_port   = 6443
  to_port     = 6443

  description = "Kubernetes API access from VPC"
}

resource "aws_vpc_security_group_egress_rule" "nlb_to_control_plane" {
  security_group_id            = aws_security_group.load_balancer.id
  referenced_security_group_id = aws_security_group.control_plane.id

  ip_protocol = "tcp"
  from_port   = 6443
  to_port     = 6443

  description = "NLB to control-plane API servers"
}
