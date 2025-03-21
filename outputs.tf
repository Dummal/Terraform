output "iam_role_arn" {
  description = "ARN of the IAM role created."
  value       = module.iam.role_arn
}

output "control_tower_status" {
  description = "Status of the AWS Control Tower setup."
  value       = module.control_tower.status
}

output "aft_logs_bucket_name" {
  description = "Name of the S3 bucket used for AFT logs."
  value       = module.resources.aft_logs_bucket_name
}

output "vpc_id" {
  description = "ID of the VPC created."
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "IDs of the subnets created."
  value       = module.subnet.subnet_ids
}