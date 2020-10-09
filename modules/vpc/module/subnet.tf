# Subnets
resource "aws_subnet" "main-public" {
count = length(var.public_subnets)
vpc_id = aws_vpc.main.id
cidr_block = var.public_subnets[count.index]
map_public_ip_on_launch = "true"
availability_zone = var.azs_subnets[count.index]

 tags = {
Name = "main-public-${count.index}"
}
}
resource "aws_subnet" "main-private" {
count = length(var.private_subnets)
vpc_id = aws_vpc.main.id
cidr_block = var.private_subnets[count.index]
map_public_ip_on_launch = "false"
availability_zone = var.azs_subnets[count.index]

 tags = {
Name = "main-private-${count.index}"
}
}

