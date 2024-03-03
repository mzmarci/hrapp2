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
  default     = "test100"
  //default = "prod"
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

/* variable "private_subnets_id" {
  type        = list(string)
  description = "subnet to create for private subnet"

} */

//variable "vpc_id" {}