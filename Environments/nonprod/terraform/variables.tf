variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "self-managed-k8s"
}

variable "vpc_cidr" {
  description = "Kubernetes VPC CIDR"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)

  default = [
    "10.20.1.0/24",
    "10.20.2.0/24",
    "10.20.3.0/24"
  ]
}

variable "admin_cidr" {
  description = "Your trusted public IPv4 address in CIDR notation"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.admin_cidr))
    error_message = "Provide a valid IPv4 CIDR, preferably your public IP with /32."
  }
}

variable "instance_type" {
  description = "EC2 instance type for Kubernetes nodes"
  type        = string
  default     = "t3.medium"
}

variable "root_volume_size" {
  description = "EC2 root EBS volume size in GB"
  type        = number
  default     = 30
}