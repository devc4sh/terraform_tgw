variable "project" {
  description = "Project Name"
  default     = "transit"
}

variable "env" {
  description = "Enviornment Name"
  default     = "dev"
}

variable "managed" {
  description = "How it's managed"
  default     = "Managed by Terraform"
}

variable "vpc_cidr" {
  description = "VPC CIDR Block to be used"
  default     = "210.0.0.0/16"
}

variable "vpc_name" {
  description = "VPC Name"
  default = "tgw-test-vpc"
}

