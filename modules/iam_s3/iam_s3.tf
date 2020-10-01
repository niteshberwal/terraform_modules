module "iam_role_s3" {
source = "./module/"

vpc_name = "main"
cidr = "10.0.0.0/16"

azs_subnets = ["us-east-2a", "us-east-2b", "us-east-2c"]
public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

IAM_role_name = "s3-mybucket-role"
IAM_instance_profile_name = "s3-mybucket-role"
IAM_role_policy_name = "s3-mybucket-role-policy"

AMI = "ami-04fcd96153cb57194"
instance_type = "t2.micro"

bucket_name = "mybucket-c29df1test"
bucket_acl = "private"
bucket_tag_name = "mybucket-c29df1test_tag"

security_group_name = "allow-ssh"
sg_description = "security group that allows ssh and all egress traffic"
ingress_cidr_blocks = "0.0.0.0/0"
sg_tag_name = "example-instance"

}
