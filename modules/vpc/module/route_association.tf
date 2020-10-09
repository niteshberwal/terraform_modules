# route associations public
resource "aws_route_table_association" "main-public-1-a" {
count = length(var.public_subnets)
subnet_id = aws_subnet.main-public[count.index].id
route_table_id = aws_route_table.main-public.id
}

