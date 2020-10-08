resource "aws_elb" "my-elb" {
  name            = var.elb_name
  subnets         = [aws_subnet.main-public[1].id, aws_subnet.main-public[2].id]
  security_groups = [aws_security_group.elb-securitygroup.id]
  listener {
    instance_port     = var.listener_instance_port
    instance_protocol = var.listener_instance_protocol
    lb_port           = var.listener_lb_port
    lb_protocol       = var.listener_lb_protocol
  }
  health_check {
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    timeout             = var.health_check_timeout
    target              = var.health_check_target
    interval            = var.health_check_interval
  }

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = var.elb_tag_name
  }
}

