provider "aws" {
  region = var.aws_region
}

module "control_tower" {
  source = "./modules/control_tower"

  naming_prefix            = var.naming_prefix
  allowed_regions          = var.allowed_regions
  data_residency           = var.data_residency
  vpn_configuration        = var.vpn_configuration
  siem_integration         = var.siem_integration
  compliance_monitoring    = var.compliance_monitoring
  patch_management         = var.patch_management
  data_retention_policy    = var.data_retention_policy
  resource_quotas_management = var.resource_quotas_management
  infrastructure_compliance = var.infrastructure_compliance
  software_licensing       = var.software_licensing
  secrets_management       = var.secrets_management
  dns_management           = var.dns_management
  resource_tagging         = var.resource_tagging
  data_lifecycle_management = var.data_lifecycle_management
  compliance_frameworks    = var.compliance_frameworks
  sns_alerts               = var.sns_alerts
  encryption               = var.encryption
}

resource "aws_organizations_policy" "region_restriction" {
  name        = "RegionRestrictionPolicy"
  description = "Restrict resource creation to specific regions."
  content     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "RestrictRegions",
      "Effect": "Deny",
      "Action": "*",
      "Resource": "*",
      "Condition": {
        "StringNotEquals": {
          "aws:RequestedRegion": ${jsonencode(var.allowed_regions)}
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role" "control_tower_admin" {
  name               = "${var.naming_prefix}-control-tower-admin"
  assume_role_policy = data.aws_iam_policy_document.control_tower_admin_assume_role_policy.json
}

resource "aws_iam_policy" "control_tower_admin_policy" {
  name        = "${var.naming_prefix}-control-tower-admin-policy"
  description = "Policy for Control Tower administration."
  policy      = data.aws_iam_policy_document.control_tower_admin_policy.json
}

resource "aws_iam_role_policy_attachment" "control_tower_admin_attachment" {
  role       = aws_iam_role.control_tower_admin.name
  policy_arn = aws_iam_policy.control_tower_admin_policy.arn
}

output "control_tower_admin_role_arn" {
  description = "ARN of the Control Tower admin role."
  value       = aws_iam_role.control_tower_admin.arn
}