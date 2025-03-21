output "control_tower_admin_role_arn" {
  description = "ARN of the Control Tower admin role."
  value       = aws_iam_role.control_tower_admin.arn
}

output "region_restriction_policy_id" {
  description = "ID of the region restriction policy."
  value       = aws_organizations_policy.region_restriction.id
}

output "vpn_configuration_details" {
  description = "Details of the VPN configuration."
  value       = var.vpn_configuration
}

output "data_residency_policy" {
  description = "Data residency policy enforced."
  value       = var.data_residency
}