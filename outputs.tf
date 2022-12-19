output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = aws_lb.alb.*.arn
}
output "alb_target_group_arn" {
  description = "ALB Target Group ARN"
  value       = aws_lb_target_group.alb.*.id
}

output "alb_security_group_id" {
  description = "ALB Security Group ID"
  value       = aws_security_group.load_balancer.*.id
}

output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = aws_lb.alb.*.dns_name
}

output "alb_zone_id" {
  description = "ALB Zone id for Route53 record"
  value       = aws_lb.alb.*.zone_id
}

output "nlb_arn" {
  description = "Network Load Balancer ARN"
  value       = aws_lb.nlb.*.arn
}
output "nlb_target_group_arn" {
  description = "NLB Target Group ARN"
  value       = one(aws_lb_target_group.nlb.*.arn)
}

output "glb_arn" {
  description = "Gateway Load Balancer ARN"
  value       = aws_lb.glb.*.arn
}
/*
output "glb_target_group_arn" {
  description = "GLB Target Group ARN"
  value       = aws_lb_target_group.glb.arn
}
*/