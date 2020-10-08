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
variable "elb_name" {}
variable "listener_instance_port" {}
variable "listener_instance_protocol" {}
variable "listener_lb_port" {}
variable "listener_lb_protocol" {}
variable "health_check_healthy_threshold" {}
variable "health_check_unhealthy_threshold" {}
variable "health_check_timeout" {}
variable "health_check_target" {}
variable "health_check_interval" {}
variable "elb_tag_name" {}
variable "elb_security_group_name" {}
variable "elb_security_group_description" {}
variable "elb_security_group_tag_name" {}

