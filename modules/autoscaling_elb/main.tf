module "autoscaling_elb" {
source = "./module/"

vpc_name = "main"
cidr = "10.0.0.0/16"

 
azs_subnets = ["us-east-2a", "us-east-2b", "us-east-2c"]
public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
 

AMI = "ami-04fcd96153cb57194"
instance_type = "t2.micro"
 

security_group_name = "myinstance"
sg_description = "security group for my instance"
ingress_cidr_blocks = "0.0.0.0/0"
sg_tag_name = "myinstance"

elb_security_group_name = "elb"
elb_security_group_description = "security group for load balancer"
elb_security_group_tag_name = "elb"


launch_config_name_prefix = "example-launchconfig"
key_name = "mykeypair"
autoscaling_group_name = "example-autoscaling"
min_size  = "1"
max_size  = "2"
health_check_grace_period = "300"
health_check_type = "ELB"
force_delete = "true"
tag_name = "Name"
tag_value = "ec2 instance"

elb_name = "my-elb"
listener_instance_port = "30"
listener_instance_protocol = "http"
listener_lb_port = "80"
listener_lb_protocol = "http"
health_check_healthy_threshold = "2"
health_check_unhealthy_threshold = "2"
health_check_timeout = "3"
health_check_target = "HTTP:80/"
health_check_interval = "30"
elb_tag_name = "my-elb"

}
