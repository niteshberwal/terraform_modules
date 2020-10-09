module "RDS" {
source = "./module/"

vpc_name = "main"
cidr = "10.0.0.0/16"

azs_subnets = ["us-east-2a", "us-east-2b", "us-east-2c"]
public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

AMI = "ami-04fcd96153cb57194"
instance_type = "t2.micro"

security_group_name = "allow-ssh"
sg_description = "security group that allows ssh and all egress traffic"
ingress_cidr_blocks = "0.0.0.0/0"
sg_tag_name = "example-instance"

sg_name_db = "allow-mariadb"
sg_db_description = "allow-mariadb_testing_terraform"
sg_db_tag_name = "allow-mariadb"

db_subnet_group_name = "mariadb-subnet"
db_subnet_group_description = "RDS subnet group"

db_parameter_group_name = "mariadb-parameters"
db_parameter_group_description = "MariaDB parameter group"
db_parameter_group_family = "mariadb10.4"
parameter_name = "max_allowed_packet"
parameter_value = "16777216"

db_instance_allocated_storage = "20"
db_instance_engine = "mariadb"
db_instance_engine_version = "10.4.8"
db_instance_class = "db.t2.micro"
db_instance_identifier = "mariadb"
db_instance_name = "mariadb"
db_instance_username = "root"
db_instance_password = "testing1"
db_instance_storage_type = "gp2"
db_instance_backup_retention_period = "30"
db_instance_tag_name = "mariadb-instance"

}

