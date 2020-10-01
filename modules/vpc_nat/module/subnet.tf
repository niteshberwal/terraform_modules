# Public Subnet
resource "aws_subnet" "terraform_subnet_test_1" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnets[count.index]
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone

  tags = {
    Name = "First Test Subnet Terraform"
  }
}

# Private Subnet
resource "aws_subnet" "terraform_subnet_test_1" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnets[count.index]
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone

  tags = {
    Name = "First Test Subnet Terraform"
  }
}


# Internet Gateway
resource "aws_internet_gateway" "terraform_gw_test_1" {
  vpc_id = var.vpc_id


  tags = {
    Name = "First Test IGW Terraform"
  }
}

# Route Table
resource "aws_route_table" "terraform_r_test_1" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.route_table_cidr
    gateway_id = "${aws_internet_gateway.terraform_gw_test_1.id}"
  }

  tags = {
    Name = "First Test Route Table Terraform"
  }
}

# Route Table Association
resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.terraform_subnet_test_1.id}"
  route_table_id = "${aws_route_table.terraform_r_test_1.id}"
}

