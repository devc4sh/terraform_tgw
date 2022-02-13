resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.project}-${var.env}-${var.vpc_name}-rt"
    Managed = var.managed
  }
}

resource "aws_subnet" "subnet" {
  count             = length(var.subnet_cidrs)
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  vpc_id            = var.vpc_id

  tags = {
    Name = "${var.project}-${var.env}-${var.vpc_name}-subnet",
    Managed = var.managed
  }
}

resource "aws_route_table_association" "rt_asso" {
  count          = length(var.subnet_cidrs)
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.rt.id
}