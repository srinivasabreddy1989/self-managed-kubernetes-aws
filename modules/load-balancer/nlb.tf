
resource "aws_lb" "kubernetes_api" {
  name               = "${var.name_prefix}-api-nlb"
  internal           = true
  load_balancer_type = "network"

  subnets = values(var.private_subnet_ids)

  security_groups = [
    var.load_balancer_sg_id
  ]

  enable_cross_zone_load_balancing = true

  enable_deletion_protection = true

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-api-nlb"
  })
}
