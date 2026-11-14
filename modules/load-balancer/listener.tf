
resource "aws_lb_listener" "kubernetes_api" {
  load_balancer_arn = aws_lb.kubernetes_api.arn

  port     = 6443
  protocol = "TCP"

  default_action {
    type = "forward"

    target_group_arn = aws_lb_target_group.kubernetes_api.arn
  }
}
