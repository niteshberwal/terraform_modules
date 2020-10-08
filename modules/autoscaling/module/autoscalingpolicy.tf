# scale up alarm

resource "aws_autoscaling_policy" "example-cpu-policy" {
  name                   = var.aws_autoscaling_scale_up_policy_name
  autoscaling_group_name = aws_autoscaling_group.example-autoscaling.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "example-cpu-alarm" {
  alarm_name          = var.alarm_name_scale_up
  alarm_description   = var.alarm_description_scale_up
  comparison_operator = var.comparison_operator_scale_up
  evaluation_periods  = var.evaluation_periods_scale_up
  metric_name         = var.metric_name_scale_up
  namespace           = "AWS/EC2"
  period              = var.period_scale_up
  statistic           = "Average"
  threshold           = var.threshold_scale_up

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.example-autoscaling.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.example-cpu-policy.arn]
}

# scale down alarm
resource "aws_autoscaling_policy" "example-cpu-policy-scaledown" {
  name                   = var.autoscaling_scaledown_policy_name
  autoscaling_group_name = aws_autoscaling_group.example-autoscaling.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = var.scaling_adjustment_scaledown
  cooldown               = var.cooldown_scaledown
  policy_type            = var.policy_type_scaledown
}

resource "aws_cloudwatch_metric_alarm" "example-cpu-alarm-scaledown" {
  alarm_name          = var.alarm_name_scaledown
  alarm_description   = var.alarm_description_scaledown
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods_scaledown
  metric_name         = var.metric_name_scaledown
  namespace           = "AWS/EC2"
  period              = var.period_scaledown
  statistic           = "Average"
  threshold           = var.threshold_scaledown

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.example-autoscaling.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.example-cpu-policy-scaledown.arn]
}

