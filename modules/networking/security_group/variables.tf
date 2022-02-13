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

variable "vpc_name" {
  description = "The Name of the VPC"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID you want to use"
  type        = string
}

variable "sg_rules" {
  description = "The Rule Set List of the Security Group"
  type        = list(any)
}
