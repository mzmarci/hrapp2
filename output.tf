output "Subnet" {
  value = module.mainvpc.public_subnets[*].id
}