
variable "name_prefix" {
  description = "Prefix used for load balancer resource names"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the NLB will be created"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs across Availability Zones"
  type        = map(string)
}

variable "load_balancer_sg_id" {
  description = "Security group ID attached to the NLB"
  type        = string
}

variable "control_plane_instance_ids" {
  description = "Control-plane EC2 instance IDs mapped by AZ"
  type        = map(string)
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}
