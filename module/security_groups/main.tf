locals {
 ports = [443, 80, 5432, 22, 9100, 9090, 3000]
}



resource "aws_security_group" "hr_app_security_group" {
  name        = "hr_app_security_group"
  description = "Allow SSH and HTTP Connection"
  vpc_id      = var.vpc_id



    
  dynamic "ingress" {
    for_each = local.ports //["443", "80", "5432", "22", "9100", "9090", "3000"]
    content {
      description   = "allow port for different sources"
      from_port     = ingress.value
      to_port       = ingress.value
      protocol      = "tcp"
      cidr_blocks   = ["0.0.0.0/0"]
    }
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "hr_app"
  }
}


  # ingress {
  #   description = "Allow inbound and outbound connection"
  #   from_port   = 443
  #   to_port     = 443
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]

  # }

  # ingress {
  #   description = "postgres"
  #   from_port   = 5432
  #   to_port     = 5432
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # ingress {
  #   description = "Allow inbound and outbound connection"
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]

  # }

  # ingress {
  #   description = "Allow SSH inbound and outbound connection"
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]

  # }


  # ingress {
  #   description = "Allow port 9090 inbound"
  #   from_port   = 9100
  #   to_port     = 9100
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # ingress {
  #   description = "Allow port 9090 inbound"
  #   from_port   = 9090
  #   to_port     = 9090
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # ingress {
  #   description = "Allow port 3000 inbound"
  #   from_port   = 3000
  #   to_port     = 3000
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }


