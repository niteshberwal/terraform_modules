resource "aws_launch_configuration" "example-launchconfig" {
  name_prefix     = var.launch_config_name_prefix
  image_id        = var.AMI
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.allow-ssh.id]
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                      = var.autoscaling_group_name
  vpc_zone_identifier       = [aws_subnet.main-public[1].id, aws_subnet.main-public[2].id]
  launch_configuration      = aws_launch_configuration.example-launchconfig.name
  min_size                  = var.min_size
  max_size                  = var.max_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  force_delete              = var.force_delete

  tag {
    key                 = var.tag_name
    value               = var.tag_value
    propagate_at_launch = true
  }
}

