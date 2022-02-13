locals {
  region = "ap-northeast-2"
  azs    = ["${local.region}a", "${local.region}c"]

  # Security Group Rule Managed by csv
  sg_csvs = fileset("./sg_csv/", "*.csv")
  sg      = toset([for f in local.sg_csvs : trimsuffix(f, ".csv")])

  # Subnet Info
  subnet_info = {

    pub   = [cidrsubnet(var.vpc_cidr, 8, 0), cidrsubnet(var.vpc_cidr, 8, 1)],
    web = [cidrsubnet(var.vpc_cidr, 8, 2), cidrsubnet(var.vpc_cidr, 8, 3)],
    was   = [cidrsubnet(var.vpc_cidr, 8, 4), cidrsubnet(var.vpc_cidr, 8, 5)],
    db    = [cidrsubnet(var.vpc_cidr, 8, 6), cidrsubnet(var.vpc_cidr, 8, 7)],
  }
}