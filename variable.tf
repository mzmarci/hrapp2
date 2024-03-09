variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public Subnet CIDR values"
  default = [
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]
}

variable "tags" {
  default = [
    "Publicsubnet1",
    "Publicsubnet2"
  ]
}

variable "private_subnet_cidrs" {
  default = [
    "10.0.5.0/24",
    "10.0.6.0/24"
  ]
}

variable "rds_password" {
  type    = string
  default = "marci123"

}

variable "rds_username" {
  type    = string
  default = "hr_project"

}

variable "db_name" {
  type    = string
  default = "projects"
}

variable "public_subnets_id" {
  description = "this is a vraible to manage subnet_id in module"
  type        = list(string)
  default     = []
}



variable "ec2_key_name" {
  description = "this is a variable to manage ec2_key_name"
  type        = string
  //default     = "test100"
  default = "prod"
}

/* variable "ec2_key_name1" {
  description = "this is a variable to manage ec2_key_name"
  type        = string
  //default     = "test100"
  default = "dev"
} */

variable "ec2_instance_type" {
  description = "this is a variable to manage ec2_instance_type"
  type        = string
  //default     = "t2.micro"
  default = "prod"

}

variable "deregistration_delay" {
  description = "The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused"
  default     = "300"
}

variable "health_check_interval" {
  description = "The interval between performing a health check"
  default     = "30"
}

variable "healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
  default     = "3"
}

variable "unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy"
  default     = "3"
}


variable "preserve_client_ip" {
  description = "Whether to preserve the client (source) IP - false will regard all traffic as originating from the eni, for example"
  default     = true
}

/* variable "private_subnets_id" {
  type        = list(string)
  description = "subnet to create for private subnet"

} */

//variable "vpc_id" {}