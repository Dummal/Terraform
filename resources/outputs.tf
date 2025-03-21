```hcl
output "vpc_id" {
  description = "The ID of the created VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets."
  value       = module.vpc.private_subnet_ids
}

output "aft_logs_bucket_name" {
  description = "The name of the AFT logs S3 bucket."
  value       = aws_s3_bucket.aft_logs.bucket
}

output "development_account_id" {
  description = "The ID of the Development Account in the Landing Zone."
  value       = aws_organizations_account.development_ou.id
}

output "control_tower_role_arn" {
  description = "The ARN of the Control Tower IAM Role."
  value       = aws_iam_role.control_tower_role.arn
}
```

---