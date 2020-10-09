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


