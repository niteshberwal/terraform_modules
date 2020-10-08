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
variable "sg_name_db" {}
variable "sg_db_description" {}
variable "sg_db_tag_name" {}
variable "db_subnet_group_name" {}
variable "db_subnet_group_description" {}
variable "db_parameter_group_name" {}
variable "db_parameter_group_description" {}
variable "db_parameter_group_family" {}
variable "parameter_name" {}
variable "parameter_value" {}
variable "db_instance_allocated_storage" {}
variable "db_instance_engine" {}
variable "db_instance_engine_version" {}
variable "db_instance_class" {}
variable "db_instance_identifier" {}
variable "db_instance_name" {}
variable "db_instance_username" {}
variable "db_instance_password" {
  default = "testing1"
}
variable "db_instance_storage_type" {}
variable "db_instance_backup_retention_period" {}
variable "db_instance_tag_name" {}





