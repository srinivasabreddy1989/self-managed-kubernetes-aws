
variable "name_prefix" {
  description = "Prefix used for EC2 instance names"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs mapped by Availability Zone"
  type        = map(string)
}

variable "control_plane_sg_id" {
  description = "Security group ID for control-plane instances"
  type        = string
}

variable "worker_sg_id" {
  description = "Security group ID for worker instances"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile attached to EC2 nodes"
  type        = string
}

variable "control_plane_instance_type" {
  description = "EC2 instance type for control-plane nodes"
  type        = string
  default     = "t3.large"
}

variable "worker_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.large"
}

variable "control_plane_volume_size" {
  description = "Root EBS volume size for control-plane nodes"
  type        = number
  default     = 50
}

variable "worker_volume_size" {
  description = "Root EBS volume size for worker nodes"
  type        = number
  default     = 100
}

variable "tags" {
  description = "Common tags for EC2 resources"
  type        = map(string)
  default     = {}
}
