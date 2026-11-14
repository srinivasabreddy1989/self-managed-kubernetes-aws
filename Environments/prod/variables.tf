
variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "name_prefix" {
  type        = string
  description = "Resource naming prefix"
}

variable "vpc_cidr" {
  type        = string
  description = "Production VPC CIDR"
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}


variable "control_plane_instance_type" {
  description = "Instance type for Kubernetes control-plane nodes"
  type        = string
  default     = "t3.large"
}

variable "worker_instance_type" {
  description = "Instance type for Kubernetes worker nodes"
  type        = string
  default     = "t3.large"
}

variable "control_plane_volume_size" {
  description = "Control-plane root volume size"
  type        = number
  default     = 50
}

variable "worker_volume_size" {
  description = "Worker root volume size"
  type        = number
  default     = 100
}
