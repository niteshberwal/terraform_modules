module "autoscaling" {
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

 


launch_config_name_prefix = "example-launchconfig"
key_name = "mykeypair"
autoscaling_group_name = "example-autoscaling"
min_size  = "1"
max_size  = "2"
health_check_grace_period = "300"
health_check_type = "EC2"
force_delete = "true"
tag_name = "Name"
tag_value = "ec2 instance"

 


aws_autoscaling_scale_up_policy_name = "example-cpu-policy"
alarm_name_scale_up = "example-cpu-alarm"
alarm_description_scale_up = "example-cpu-alarm"
comparison_operator_scale_up = "GreaterThanOrEqualToThreshold"
evaluation_periods_scale_up = "2"
metric_name_scale_up = "CPUUtilization"
period_scale_up = "120"
threshold_scale_up = "30"
autoscaling_scaledown_policy_name = "example-cpu-policy-scaledown"
scaling_adjustment_scaledown = "-1"
cooldown_scaledown = "300"
policy_type_scaledown = "SimpleScaling"
alarm_name_scaledown = "example-cpu-alarm-scaledown"
alarm_description_scaledown = "example-cpu-alarm-scaledown"
evaluation_periods_scaledown = "2"
metric_name_scaledown = "CPUUtilization"
period_scaledown = "120"
threshold_scaledown = "5"

 


}
