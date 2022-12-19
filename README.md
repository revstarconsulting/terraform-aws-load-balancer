This module creates following resources:
1. Application Load Balancer
2. Gateway Load Balancer
3. Network Load Balancer

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.29.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb.glb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb.nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.alb_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.alb_http_redirect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.alb_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.glb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.nlb_ssl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.glb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.glb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_security_group.load_balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_listener_rules"></a> [alb\_listener\_rules](#input\_alb\_listener\_rules) | map of listener rules | `any` | `{}` | no |
| <a name="input_alb_ssl_policy"></a> [alb\_ssl\_policy](#input\_alb\_ssl\_policy) | ALB SSL Policy for secure listener | `string` | `"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"` | no |
| <a name="input_alb_target_groups"></a> [alb\_target\_groups](#input\_alb\_target\_groups) | map of target groups to be attached to alb | `any` | `{}` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | AWS Certificate Manager ARN for validated domain | `string` | `""` | no |
| <a name="input_create_alb"></a> [create\_alb](#input\_create\_alb) | Set to true for Application Load Balancer | `bool` | `false` | no |
| <a name="input_create_glb"></a> [create\_glb](#input\_create\_glb) | Set to true for Gateway Load Balancer | `bool` | `false` | no |
| <a name="input_create_nlb"></a> [create\_nlb](#input\_create\_nlb) | Set to true for Network Load Balancer | `bool` | `false` | no |
| <a name="input_enable_cross_zone_load_balancing"></a> [enable\_cross\_zone\_load\_balancing](#input\_enable\_cross\_zone\_load\_balancing) | Whether or not to enable cross zone load balancing. Valid only for NLB | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Provide appropriate environment name | `string` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Health check path for the default target group | `string` | `"/"` | no |
| <a name="input_health_check_port"></a> [health\_check\_port](#input\_health\_check\_port) | Health check port | `string` | `"traffic-port"` | no |
| <a name="input_health_check_protocol"></a> [health\_check\_protocol](#input\_health\_check\_protocol) | Health check protocol | `string` | `"TCP"` | no |
| <a name="input_http_redirect"></a> [http\_redirect](#input\_http\_redirect) | whether redirect http to https | `string` | `"yes"` | no |
| <a name="input_is_internal"></a> [is\_internal](#input\_is\_internal) | Creates external or internal load balancer | `string` | `"no"` | no |
| <a name="input_lb_access_logs_prefix"></a> [lb\_access\_logs\_prefix](#input\_lb\_access\_logs\_prefix) | Load Balancer access logs prefix | `string` | `"ALB"` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | Load Balancer Name | `string` | `""` | no |
| <a name="input_lb_subnets"></a> [lb\_subnets](#input\_lb\_subnets) | List of Subnet IDs for Load Balancer | `list(string)` | `[]` | no |
| <a name="input_logging_lb_bucket_name"></a> [logging\_lb\_bucket\_name](#input\_logging\_lb\_bucket\_name) | Load Balancer access logs bucket | `string` | `""` | no |
| <a name="input_nlb_listener_port"></a> [nlb\_listener\_port](#input\_nlb\_listener\_port) | NLB Listener port | `string` | `"443"` | no |
| <a name="input_nlb_listener_protocol"></a> [nlb\_listener\_protocol](#input\_nlb\_listener\_protocol) | NLB Listener Protocol | `string` | `"TLS"` | no |
| <a name="input_nlb_ssl_policy"></a> [nlb\_ssl\_policy](#input\_nlb\_ssl\_policy) | NLB SSL policy for TLS protocol | `string` | `"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"` | no |
| <a name="input_target_group_name"></a> [target\_group\_name](#input\_target\_group\_name) | Name of the Load Balancer Target Group | `string` | `""` | no |
| <a name="input_target_group_port"></a> [target\_group\_port](#input\_target\_group\_port) | Port on which targets receive traffic | `number` | `3000` | no |
| <a name="input_target_group_protocol"></a> [target\_group\_protocol](#input\_target\_group\_protocol) | Protocol to use for routing traffic to the targets. | `string` | `"HTTP"` | no |
| <a name="input_target_group_resource_ids"></a> [target\_group\_resource\_ids](#input\_target\_group\_resource\_ids) | IDs of the target to attach with target group. | `list(string)` | `[]` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Type of target to register targets with target group. Valid values are `instance` or `ip`. | `string` | `"ip"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | vpc\_id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_arn"></a> [alb\_arn](#output\_alb\_arn) | Application Load Balancer ARN |
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | ALB DNS Name |
| <a name="output_alb_security_group_id"></a> [alb\_security\_group\_id](#output\_alb\_security\_group\_id) | ALB Security Group ID |
| <a name="output_alb_target_group_arn"></a> [alb\_target\_group\_arn](#output\_alb\_target\_group\_arn) | ALB Target Group ARN |
| <a name="output_alb_zone_id"></a> [alb\_zone\_id](#output\_alb\_zone\_id) | ALB Zone id for Route53 record |
| <a name="output_glb_arn"></a> [glb\_arn](#output\_glb\_arn) | Gateway Load Balancer ARN |
| <a name="output_nlb_arn"></a> [nlb\_arn](#output\_nlb\_arn) | Network Load Balancer ARN |
| <a name="output_nlb_target_group_arn"></a> [nlb\_target\_group\_arn](#output\_nlb\_target\_group\_arn) | NLB Target Group ARN |
