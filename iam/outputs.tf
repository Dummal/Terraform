output "control_tower_admin_role_arn" {
  description = "ARN of the Control Tower Admin IAM Role"
  value       = aws_iam_role.control_tower_admin_role.arn
}

output "aft_execution_role_arn" {
  description = "ARN of the AFT Execution IAM Role"
  value       = aws_iam_role.aft_execution_role.arn
}

output "aft_account_provisioning_role_arn" {
  description = "ARN of the AFT Account Provisioning IAM Role"
  value       = aws_iam_role.aft_account_provisioning_role.arn
}

output "aft_admin_role_arn" {
  description = "ARN of the AFT Admin IAM Role"
  value       = aws_iam_role.aft_admin_role.arn
}