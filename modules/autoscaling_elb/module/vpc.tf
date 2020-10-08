# Internet VPC
resource "aws_vpc" "main" {
cidr_block = var.cidr
instance_tenancy = "default"
tags = {
Name = var.vpc_name
}
}

# Subnets
resource "aws_subnet" "main-public" {
count = 3
vpc_id = aws_vpc.main.id
cidr_block = var.public_subnets[count.index]
map_public_ip_on_launch = "true"
availability_zone = var.azs_subnets[count.index]

 tags = {
Name = "main-public-${count.index}"
}
}
resource "aws_subnet" "main-private" {
count = 3
vpc_id = aws_vpc.main.id
cidr_block = var.private_subnets[count.index]
map_public_ip_on_launch = "false"
availability_zone = var.azs_subnets[count.index]

 tags = {
Name = "main-private-${count.index}"
}
}

# Internet GW
resource "aws_internet_gateway" "main-gw" {
vpc_id = aws_vpc.main.id

 tags = {
Name = "main"
}
}

# route tables
resource "aws_route_table" "main-public" {
vpc_id = aws_vpc.main.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.main-gw.id
}

 tags = {
Name = "main-public-1"
}
}

# route associations public
resource "aws_route_table_association" "main-public-1-a" {
count = 3
subnet_id = aws_subnet.main-public[count.index].id
route_table_id = aws_route_table.main-public.id
}
