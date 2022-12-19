variable "create_alb" {
  description = "Set to true for Application Load Balancer"
  type        = bool
  default     = false
}

variable "create_nlb" {
  description = "Set to true for Network Load Balancer"
  type        = bool
  default     = false
}

variable "create_glb" {
  description = "Set to true for Gateway Load Balancer"
  type        = bool
  default     = false
}

variable "lb_name" {
  type        = string
  description = "Load Balancer Name"
  default     = ""

}

variable "is_internal" {
  type        = string
  description = "Creates external or internal load balancer"
  default     = "no"
}

variable "target_group_name" {
  type        = string
  description = "Name of the Load Balancer Target Group"
  default     = ""

}

variable "alb_ssl_policy" {
  type        = string
  description = "ALB SSL Policy for secure listener"
  default     = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
}

variable "nlb_ssl_policy" {
  type        = string
  description = "NLB SSL policy for TLS protocol"
  default     = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
}

variable "health_check_path" {
  description = "Health check path for the default target group"
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "Health check port"
  type        = string
  default     = "traffic-port"
}

variable "health_check_protocol" {
  description = "Health check protocol"
  type        = string
  default     = "TCP"

}

variable "vpc_id" {
  description = "vpc_id"
  type        = string
}

variable "lb_subnets" {
  type        = list(string)
  description = "List of Subnet IDs for Load Balancer"
  default     = []
}

variable "certificate_arn" {
  description = "AWS Certificate Manager ARN for validated domain"
  type        = string
  default     = ""

}

variable "enable_cross_zone_load_balancing" {
  description = "Whether or not to enable cross zone load balancing. Valid only for NLB"
  type        = bool
  default     = false
}

variable "logging_lb_bucket_name" {
  description = "Load Balancer access logs bucket"
  type        = string
  default     = ""
}

variable "lb_access_logs_prefix" {
  description = "Load Balancer access logs prefix"
  type        = string
  default     = "ALB"

}
variable "nlb_listener_port" {
  description = "NLB Listener port"
  type        = string
  default     = "443"

}

variable "nlb_listener_protocol" {
  description = "NLB Listener Protocol"
  type        = string
  default     = "TLS"
}

variable "target_group_protocol" {
  description = "Protocol to use for routing traffic to the targets."
  type        = string
  default     = "HTTP"
}

variable "target_group_port" {
  description = "Port on which targets receive traffic"
  type        = number
  default     = 3000
}

variable "target_type" {
  description = "Type of target to register targets with target group. Valid values are `instance` or `ip`."
  type        = string
  default     = "ip"
}

variable "target_group_resource_ids" {
  description = "IDs of the target to attach with target group."
  type        = list(string)
  default     = []
}

variable "http_redirect" {
  description = "whether redirect http to https"
  type        = string
  default     = "yes"
}

variable "environment" {
  description = "Provide appropriate environment name"
  type        = string
}

variable "alb_target_groups" {
  type        = any
  description = "map of target groups to be attached to alb"
  default     = {}
}

variable "alb_listener_rules" {
  type        = any
  description = "map of listener rules"
  default     = {}
}

locals {
  common_tags = {
    environment = var.environment
  }
}