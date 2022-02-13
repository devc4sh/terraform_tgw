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

variable "vpc_id" {
  description = "The VPC ID you want to use"
  type = string
}

variable "vpc_name" {
  description = "THE VPC NAME"
  type = string
}

variable "subnet_cidrs" {
  description = "The Subnet CIDR Block"
  type = list
}

variable "azs" {
  description = "The List of Availability Zone"
  type = list(string)
}
