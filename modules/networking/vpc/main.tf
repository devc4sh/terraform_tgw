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
# Transit Gateway
###########################################

#resource "aws_ec2_transit_gateway" "tgw" {
#  count = var.enable_tgw ? 1 : 0
#
#  vpc_attachments = {
#    vpc = {
#      vpc_id = aws_vpc.vpc.id
#      subnets_ids = var.subnets_ids
#      dns_support = true
#      ipv6_support = true
#
#      tgw_routes = [
#        {
#          destination_cidr_block = aws_vpc.vpc.id
#        },
#        {
#          blackhole = true
#          destination_cidr_block = var.conn_cidr
#        }
#      ]
#    }
#  }
#  ram_allow_external_principals = true
#  ram_principals = var.tgw_arn
#
#  tags = {
#    Name    = "${local.name_tag}-vgw",
#    Managed = var.managed
#  }
#}

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