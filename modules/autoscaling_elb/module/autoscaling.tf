resource "aws_launch_configuration" "example-launchconfig" {
  name_prefix     = var.launch_config_name_prefix
  image_id        = var.AMI
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.mykeypair.key_name
  security_groups = [aws_security_group.myinstance.id]
  user_data       = "#!/bin/bash\nyum update\nyum -y install net-tools nginx\nMYIP='MYIP'\necho 'this is: '$MYIP > /var/www/html/index.html"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                      = var.autoscaling_group_name
  vpc_zone_identifier       = [aws_subnet.main-public[1].id, aws_subnet.main-public[2].id]
  launch_configuration      = aws_launch_configuration.example-launchconfig.name
  min_size                  = var.min_size
  max_size                  = var.max_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  load_balancers            = [aws_elb.my-elb.name]
  force_delete              = true

  tag {
    key                 = var.tag_name
    value               = var.tag_value
    propagate_at_launch = true
  }
}

