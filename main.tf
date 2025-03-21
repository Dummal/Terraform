module "iam" {
  source              = "./modules/iam"
  master_account_id   = var.master_account_id
}

module "control_tower" {
  source                   = "./modules/control_tower"
  enable_control_tower     = var.enable_control_tower
  master_account_email     = var.master_account_email
  organizational_units     = var.organizational_units
  aws_region               = var.aws_region
}

module "resources" {
  source                = "./modules/resources"
  aft_logs_bucket_name  = var.aft_logs_bucket_name
  aws_region            = var.aws_region
  master_account_id     = var.master_account_id
}

module "vpc" {
  source                    = "./modules/vpc"
  public_vpc_cidr           = var.public_vpc_cidr
  public_subnet_cidr        = var.public_subnet_cidr
  private_vpc_cidr          = var.private_vpc_cidr
  private_subnet_cidr       = var.private_subnet_cidr
  aws_availability_zone     = var.aws_availability_zone
}

module "subnet" {
  source                     = "./modules/subnet"
  vpc_id                     = var.vpc_id
  cidr_block                 = var.cidr_block
  availability_zone          = var.availability_zone
  map_public_ip_on_launch    = var.map_public_ip_on_launch
  tags                       = var.tags
}

resource "aws_organizations_account" "development_account" {
  name             = "Development Account"
  email            = "development@thu.io"
  parent_id        = module.control_tower.organizational_units["development"]
  role_name        = "OrganizationAccountAccessRole"
}