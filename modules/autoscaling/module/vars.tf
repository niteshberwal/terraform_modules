variable "AWS_REGION" {
  default = "us-east-2"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/id_rsa"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "~/.ssh/id_rsa.pub"
}

variable "public_subnets" {}
variable "private_subnets" {}
variable "azs_subnets" {}
variable "cidr" {}
variable "vpc_name" {}
variable "AMI" {}
variable "instance_type" {}
variable "security_group_name" {}
variable "sg_description" {}
variable "ingress_cidr_blocks" {}
variable "sg_tag_name" {}
variable "launch_config_name_prefix" {}
variable "key_name" {}
variable "autoscaling_group_name" {}
variable "min_size" {}
variable "max_size" {}
variable "health_check_grace_period" {}
variable "health_check_type" {}
variable "force_delete" {}
variable "tag_name" {}
variable "tag_value" {}
variable "aws_autoscaling_scale_up_policy_name" {}
variable "alarm_name_scale_up" {}
variable "alarm_description_scale_up" {}
variable "comparison_operator_scale_up" {}
variable "evaluation_periods_scale_up" {}
variable "metric_name_scale_up" {}
variable "period_scale_up" {}
variable "threshold_scale_up" {}
variable "autoscaling_scaledown_policy_name" {}
variable "scaling_adjustment_scaledown" {}
variable "cooldown_scaledown" {}
variable "policy_type_scaledown" {}
variable "alarm_name_scaledown" {}
variable "alarm_description_scaledown" {}
variable "evaluation_periods_scaledown" {}
variable "metric_name_scaledown" {}
variable "period_scaledown" {}
variable "threshold_scaledown" {}

