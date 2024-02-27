
output "Hr_app_ip" {
  value = module.hrapp.Hr_App_ip
}

output "public_subnets_id" {
  value = module.mainvpc.public_subnets_id
}

output "private_subnets_id" {
  value = module.mainvpc.private_subnets_id
}

output "vpc_id" {
  value = module.mainvpc.vpc_id
}

output "security_group" {
  value = module.security_group.hr_app_security_group_id
}