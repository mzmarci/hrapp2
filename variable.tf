variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  // type = list(string)
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
  default = [
    "marci123"
  ]
}

variable "rds_username" {
  default = [
    "hr_project"
  ]
}

variable "db_name" {
  default = [
    "projects"
  ]
}

variable "vpc_security_group_ids" {}

variable "private_subnets_id" {
  type        = list(string)
  description = "subnet to create for private subnet"

}

variable "vpc_id" {}