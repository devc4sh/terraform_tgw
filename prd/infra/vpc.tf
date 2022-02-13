module "vpc" {
  source = "../../modules/networking/vpc"

  project    = var.project
  env        = var.env
  vpc_cidr   = var.vpc_cidr
  managed = var.managed
  enable_igw = true
  enable_vgw = false
}

module "subnet" {
  source   = "../../modules/networking/subnets"
  for_each = local.subnet_info

  project      = var.project
  env          = var.env
  managed      = var.managed
  vpc_id       = module.vpc.vpc_id
  vpc_name     = each.key
  subnet_cidrs = each.value
  azs = local.azs
}