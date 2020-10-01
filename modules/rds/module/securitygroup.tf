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

resource "aws_security_group" "allow-mariadb" {
  vpc_id      = aws_vpc.main.id
  name        = var.sg_name_db
  description = var.sg_db_description
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.example-instance.id] # allowing access from our example instance
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }
  tags = {
    Name = var.sg_db_tag_name
  }
}

