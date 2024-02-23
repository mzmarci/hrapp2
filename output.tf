output "Subnet" {
  value = module.mainvpc.public_subnets[*].id
}

output "Hr_app_ip" {
  value = module.hrapp.id
}