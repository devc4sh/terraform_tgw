variable "project" {
  description = "Project Name"
  type        = string
}

variable "env" {
  description = "Project Environment"
  type        = string
}

variable "managed" {
  description = "How it's managed"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR Block to be used"
  type = string
}

variable "enable_igw" {
  description = "If you want to create Internet Gateway?"
  type        = bool
  default     = true
}

variable "enable_vgw" {
  description = "If you want to create Virtual Gateway?"
  type        = bool
  default     = false
}

variable "vpn_gateway_asn" {
  description = "VGW ASN"
  type        = string
  default     = "64512"
}

variable "tgw_arn" {
  description = "ARN to be used"
  type = list
}
