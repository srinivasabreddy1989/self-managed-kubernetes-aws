aws_region  = "us-east-1"
name_prefix = "prod-k8s"

vpc_cidr = "10.30.0.0/16"

availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]

public_subnet_cidrs = [
  "10.30.1.0/24",
  "10.30.2.0/24",
  "10.30.3.0/24"
]

private_subnet_cidrs = [
  "10.30.11.0/24",
  "10.30.12.0/24",
  "10.30.13.0/24"
]
