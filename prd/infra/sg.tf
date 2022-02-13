module "sg" {
  source   = "../../modules/networking/security_group"
  for_each = local.sg

  project  = var.project
  env      = var.env
  managed = var.managed
  vpc_name = regexall("[a-z]+", each.key).0
  vpc_id   = module.vpc.vpc_id
  sg_rules = csvdecode(file("./sg_csv/${each.key}.csv"))
}