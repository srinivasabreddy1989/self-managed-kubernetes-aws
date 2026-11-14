
output "vpc_id" {
  description = "Production VPC ID"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "Production VPC CIDR"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "Public subnet IDs grouped by AZ"
  value = {
    for az, subnet in aws_subnet.public :
    az => subnet.id
  }
}

output "private_subnet_ids" {
  description = "Private subnet IDs grouped by AZ"
  value = {
    for az, subnet in aws_subnet.private :
    az => subnet.id
  }
}

output "nat_gateway_ids" {
  description = "NAT Gateway IDs grouped by AZ"
  value = {
    for az, nat in aws_nat_gateway.main :
    az => nat.id
  }
}

output "availability_zones" {
  description = "Availability Zones used by networking"
  value       = var.availability_zones
}
