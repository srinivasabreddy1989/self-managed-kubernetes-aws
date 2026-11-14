
variable "name_prefix" {
  description = "Prefix used for IAM resource names"
  type        = string
}

variable "tags" {
  description = "Common tags for IAM resources"
  type        = map(string)
  default     = {}
}
