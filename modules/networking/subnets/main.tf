locals {
  name_tag = "${var.project}-${var.env}-${var.vpc_name}"
}

###########################################
# Subnets
###########################################

resource "aws_subnet" "subnet" {
  count             = length(var.subnet_cidrs)
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  vpc_id            = var.vpc_id

  tags = {
    Name    = "${local.name_tag}-subnet",
    Managed = var.managed
  }
}

###########################################
# Route Table
###########################################

resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  tags = {
    Name    = "${local.name_tag}-rt",
    Managed = var.managed
  }
}

###########################################
# Route table association
###########################################

resource "aws_route_table_association" "rt_asso" {
  count          = length(var.subnet_cidrs)
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.rt.id
}