locals {
  name_tag = "${var.project}-${var.env}"
}

###########################################
# VPC
###########################################

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "${local.name_tag}-vpc",
    Managed = var.managed
  }
}

###########################################
# Internet Gateway
###########################################

resource "aws_internet_gateway" "igw" {
  count  = var.enable_igw ? 1 : 0
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "${local.name_tag}-igw",
    Managed = var.managed
  }
}

###########################################
# VPN Gateway
###########################################

resource "aws_vpn_gateway" "vgw" {
  count           = var.enable_vgw ? 1 : 0
  vpc_id          = aws_vpc.vpc.id
  amazon_side_asn = var.vpn_gateway_asn

  tags = {
    Name    = "${local.name_tag}-vgw",
    Managed = var.managed
  }
}

###########################################
# Network Access Control List
###########################################

#resource "aws_default_network_acl" "vpc_acl" {
#  default_network_acl_id = aws_vpc.vpc.default_network_acl_id
#
#  egress {
#    rule_no    = 100
#    protocol   = "all"
#    action     = "allow"
#    cidr_block = "0.0.0.0/0"
#    from_port  = 0
#    to_port    = 0
#  }
#
#  ingress {
#    rule_no    = 100
#    protocol   = "all"
#    action     = "allow"
#    cidr_block = "0.0.0.0/0"
#    from_port  = 0
#    to_port    = 0
#  }
#
#  tags = {
#    Name    = "${local.name_tag}-nacl",
#    Managed = var.managed
#  }
#}