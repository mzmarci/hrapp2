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
  default =    [
    "10.0.5.0/24",
    "10.0.6.0/24"
  ]
}

variable "rds_password" {
  type = string
  default = "marci123"

}

variable "rds_username" {
  type = string
  default = "hr_project"
  
}

variable "db_name" {
  type = string
  default = "projects"
}

variable "public_subnets_id" {
  description = "this is a vraible to manage subnet_id in module"
  type =list(string)
  default = []
}



/* variable "private_subnets_id" {
  type        = list(string)
  description = "subnet to create for private subnet"

} */

//variable "vpc_id" {}