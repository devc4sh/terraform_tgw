output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "igw_id" {
  value = try(aws_internet_gateway.igw.*.id[0], null)
}

output "vgw_id" {
  value = try(aws_vpn_gateway.vgw.*.id[0], null)
}