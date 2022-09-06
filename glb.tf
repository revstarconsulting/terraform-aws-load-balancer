resource "aws_lb" "glb" {
  count              = var.create_glb ? 1 : 0
  name               = var.lb_name
  load_balancer_type = "gateway"
  #tfsec:ignore:AWS005
  internal = local.access_mode
  subnets  = var.lb_subnets


  tags = local.common_tags
}


# Target group
resource "aws_lb_target_group" "glb" {
  count       = var.create_glb ? 1 : 0
  name        = var.target_group_name
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  tags       = local.common_tags
  depends_on = [aws_lb.glb]

  health_check {
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    healthy_threshold   = 3
    unhealthy_threshold = 3

    interval = 7

  }
}

resource "aws_lb_listener" "glb" {
  count             = var.create_glb ? 1 : 0
  load_balancer_arn = aws_lb.glb[0].id
  #tfsec:ignore:AWS004
  depends_on = [aws_lb_target_group.nlb]

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.glb[0].arn
  }
}

resource "aws_lb_target_group_attachment" "glb" {
  count = var.create_glb ? length(var.target_group_resource_ids) : 0

  target_group_arn = aws_lb_target_group.glb[0].arn
  target_id        = element(var.target_group_resource_ids, count.index)
  port             = var.target_group_port

}
