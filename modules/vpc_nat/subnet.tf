module "subnet" {
  source = "./module/"
  
  name = "my_test_vpc_1"
  cidr = ""
 
  azs = 
  public_subnets =

  
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


