resource "aws_launch_template" "this" {
  name_prefix            = "flask-app-"
  image_id               = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.ec2_sg_id]

  user_data = base64encode(templatefile("${path.module}/../../templates/flask-userdata.sh", {}))
}

resource "aws_autoscaling_group" "this" {
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  vpc_zone_identifier = var.private_subnet_ids

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]

  tag {
    key                 = "Name"
    value               = "flask-app"
    propagate_at_launch = true
  }
}
