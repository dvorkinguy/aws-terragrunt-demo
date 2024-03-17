# Inside ./modules/load_balancers/main.tf

resource "aws_lb" "alb" {
  name               = "alb-example"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.alb_security_groups
  subnets            = var.alb_subnets
  enable_deletion_protection = false

  tags = {
    Name = "example-alb"
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name     = "alb-example-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
  }

  tags = {
    Name = "example-alb-tg"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}
