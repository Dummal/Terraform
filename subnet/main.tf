module "subnets" {
  source = "./modules/subnets"

  vpc_id              = var.vpc_id
  cidr_block          = var.cidr_block
  ipv6_enabled        = var.ipv6_enabled
  ipv6_cidr_block     = var.ipv6_cidr_block
  type                = var.type
  availability_zones  = var.availability_zones
  subnet_count        = var.subnet_count
  elastic_ip_count    = var.elastic_ip_count
  nat_gateway_enabled = var.nat_gateway_enabled
  common_tags         = var.common_tags
  network_acl_id      = var.network_acl_id
}

resource "aws_subnet" "subnet" {
  for_each = { for az, cidr in zip(var.availability_zones, var.cidr_block) : az => cidr }

  vpc_id            = var.vpc_id
  cidr_block        = each.value
  availability_zone = each.key
}