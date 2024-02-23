output "public_subnet" {
  value = aws_subnet.public_subnets[*].id
}

output "public_subnet" {
  value = aws_subnet.private_subnets[*].id
}