resource "aws_security_group" "example-instance" {
  vpc_id      = aws_vpc.main.id
  name        = var.security_group_name
  description = var.sg_description
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks]
  }
  tags = {
    Name = var.sg_tag_name
  }
}

