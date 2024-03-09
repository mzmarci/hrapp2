# create application load balancer
resource "aws_lb" "hr_app_load_balancer" {
  name                       = "hr-app-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [module.security_group.hr_app_security_group_id]
  subnets                    = module.mainvpc.public_subnets_id[*]
  enable_deletion_protection = false

  tags = {
    Name = "hr-app-alb"
  }
}

# create target group
resource "aws_lb_target_group" "hr_app_target_group" {
  name        = "hr-app-tg"
  target_type = "ip"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.mainvpc.vpc_id

  health_check {
    enabled             = true
    interval            = 300
    path                = "/"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }
}

# create a listener on port 80 with forward action
resource "aws_lb_listener" "hr_app_https_listener2" {
  load_balancer_arn = aws_lb.hr_app_load_balancer.arn
  port              = 80
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hr_app_target_group.arn
  }
}

# create network load balancer
resource "aws_lb" "hr_app_network_loadbalancer" {
  name                       = "hr-app-network_lb"
  internal                   = false
  load_balancer_type         = "network"
  security_groups            = [module.security_group.hr_app_security_group_id]
  subnets                    = module.mainvpc.public_subnets_id[*]
  enable_deletion_protection = false

  tags = {
    Name = "hr-app-network_alb"
  }
}

# create a target group for the network load balancer
resource "aws_lb_target_group" "network_target_group" {

  name                 = "hr-app-network_lb"
  deregistration_delay = var.deregistration_delay
  port                 = "80"
  preserve_client_ip   = var.preserve_client_ip
  protocol             = "TCP"
  vpc_id               = module.mainvpc.vpc_id

  health_check {
    interval            = var.health_check_interval
    port                = "80"
    protocol            = "TCP"
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }
}

# create a listener on port 80 with forward action
resource "aws_lb_listener" "hr_app_https_listener2" {
  load_balancer_arn = aws_lb.hr_app_network_loadbalancer.arn
  port              = 80
  protocol          = "TCP"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.network_target_group.arn
  }
}


# # create a listener on port 80 with redirect action
# resource "aws_lb_listener" "hr_app_http_listener" {
#   load_balancer_arn = aws_lb.hr_app_load_balancer.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type = "redirect"

#     redirect {
#       port        = 443
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
#   }
# }

# # create a listener on port 443 with forward action
# resource "aws_lb_listener" "hr_app_https_listener" {
#   load_balancer_arn = aws_lb.hr_app_load_balancer.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.hr_app_target_group.arn
#   }
# }


