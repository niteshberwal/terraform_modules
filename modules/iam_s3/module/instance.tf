resource "aws_instance" "example" {
  ami           = var.AMI
  instance_type = var.instance_type

  # the VPC subnet
  subnet_id = aws_subnet.main-public[0].id

  # the security group
  vpc_security_group_ids = [aws_security_group.example-instance.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # role:
  iam_instance_profile = aws_iam_instance_profile.s3-mybucket-role-instanceprofile.name
}

