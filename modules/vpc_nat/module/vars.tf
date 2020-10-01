variable "AWS_REGION" {
  default = "us-east-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-2 = "ami-13be557e"
    us-east-1 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "test_user_1"
}

variable "vpc_id"{
  default = "vpc-08b5cee722cb3f3b9"
}
variable "cidr_block"{
  default = "10.0.0.0/24"
}
variable "availability_zone"{
  default = "us-east-2a"
}
variable "route_table_cidr"{
  default = "0.0.0.0/0"
}




