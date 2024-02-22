variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = [
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]
}

variable "tags" {
  default = [
    "Public subnet1",
    "Public subnet2"
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