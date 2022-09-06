resource "aws_lb" "nlb" {
  count              = var.create_nlb ? 1 : 0
  name               = var.lb_name
  load_balancer_type = "network"
  #tfsec:ignore:AWS005
  internal                         = local.access_mode
  subnets                          = var.lb_subnets
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing

  access_logs {
    bucket  = var.logging_lb_bucket_name
    prefix  = var.lb_access_logs_prefix
    enabled = true
  }
  tags = local.common_tags
}

# Target group
resource "aws_lb_target_group" "nlb" {
  count       = var.create_nlb ? 1 : 0
  name        = var.target_group_name
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  tags       = local.common_tags
  depends_on = [aws_lb.nlb]

  health_check {
    path                = var.health_check_path
    port                = var.health_check_port
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 10
    interval            = 30
    matcher             = "200,403,404,400,401,301,302"
  }
}

resource "aws_lb_listener" "nlb_ssl" {
  count             = var.create_nlb ? 1 : 0
  load_balancer_arn = aws_lb.nlb[0].id
  port              = var.nlb_listener_port
  protocol          = var.nlb_listener_protocol
  ssl_policy        = var.nlb_ssl_policy
  certificate_arn   = var.certificate_arn
  depends_on        = [aws_lb_target_group.nlb]

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb[0].arn
  }
}
