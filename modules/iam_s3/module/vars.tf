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
variable "IAM_role_name" {}
variable "IAM_instance_profile_name" {}
variable "IAM_role_policy_name" {}
variable "AMI" {}
variable "instance_type" {}
variable "bucket_name" {}
variable "bucket_acl" {}
variable "bucket_tag_name" {}
variable "security_group_name" {}
variable "sg_description" {}
variable "ingress_cidr_blocks" {}
variable "sg_tag_name" {}


