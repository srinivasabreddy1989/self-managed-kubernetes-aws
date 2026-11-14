
resource "aws_lb_target_group" "kubernetes_api" {
  name        = "${var.name_prefix}-api-tg"
  port        = 6443
  protocol    = "TCP"
  target_type = "instance"

  vpc_id = var.vpc_id

  health_check {
    enabled  = true
    protocol = "TCP"
    port     = "traffic-port"

    interval            = 30
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-api-tg"
  })
}


# Register the three control-plane EC2 instances

resource "aws_lb_target_group_attachment" "control_plane" {
  for_each = var.control_plane_instance_ids

  target_group_arn = aws_lb_target_group.kubernetes_api.arn

  target_id = each.value
  port      = 6443
}
