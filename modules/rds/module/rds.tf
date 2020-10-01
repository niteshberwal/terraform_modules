resource "aws_db_subnet_group" "mariadb-subnet" {
  name        = var.db_subnet_group_name
  description = var.db_subnet_group_description
  subnet_ids  = [aws_subnet.main-private[0].id, aws_subnet.main-private[1].id]
}

resource "aws_db_parameter_group" "mariadb-parameters" {
  name        = var.db_parameter_group_name
  family      = var.db_parameter_group_family
  description = var.db_parameter_group_description

  parameter {
    name  = var.parameter_name
    value = var.parameter_value
  }
}

resource "aws_db_instance" "mariadb" {
  allocated_storage       = var.db_instance_allocated_storage
  engine                  = var.db_instance_engine
  engine_version          = var.db_instance_engine_version
  instance_class          = var.db_instance_class
  identifier              = var.db_instance_identifier
  name                    = var.db_instance_name
  username                = var.db_instance_username
  password                = var.db_instance_password
  db_subnet_group_name    = aws_db_subnet_group.mariadb-subnet.name
  parameter_group_name    = aws_db_parameter_group.mariadb-parameters.name
  multi_az                = "false"
  vpc_security_group_ids  = [aws_security_group.allow-mariadb.id]
  storage_type            = var.db_instance_storage_type
  backup_retention_period = var.db_instance_backup_retention_period
  availability_zone       = aws_subnet.main-private[0].availability_zone # prefered AZ
  skip_final_snapshot     = true                                        # skip final snapshot when doing terraform destroy
  tags = {
    Name = var.db_instance_tag_name
  }
}

