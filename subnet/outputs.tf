output "subnet_ids" {
  description = "The IDs of the created subnets."
  value       = aws_subnet.subnet[*].id
}

output "subnet_cidr_blocks" {
  description = "The CIDR blocks of the created subnets."
  value       = aws_subnet.subnet[*].cidr_block
}

output "subnet_availability_zones" {
  description = "The availability zones of the created subnets."
  value       = aws_subnet.subnet[*].availability_zone
}