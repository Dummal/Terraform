provider "aws" {
  region = var.region
}

resource "aws_iam_role" "control_tower_admin_role" {
  name        = var.control_tower_admin_role_name
  description = "IAM Role for Control Tower Admin with trust relationship for Control Tower service"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "controltower.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = var.common_tags
}

resource "aws_iam_role" "aft_execution_role" {
  name        = var.aft_execution_role_name
  description = "IAM Role for AFT Lambda execution"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = var.common_tags
}

resource "aws_iam_role" "aft_account_provisioning_role" {
  name        = var.aft_account_provisioning_role_name
  description = "IAM Role for AFT account provisioning via CloudFormation"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudformation.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = var.common_tags
}

resource "aws_iam_role" "aft_admin_role" {
  name        = var.aft_admin_role_name
  description = "IAM Role for AFT Admin with cross-account access and MFA enforcement"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.master_account_id
        }
        Action = "sts:AssumeRole"
        Condition = {
          Bool = {
            "aws:MultiFactorAuthPresent" = true
          }
        }
      }
    ]
  })

  tags = var.common_tags
}

resource "aws_iam_policy" "control_tower_admin_policy" {
  name        = var.control_tower_admin_policy_name
  description = "Policy for Control Tower Admin Role"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "organizations:CreateAccount",
          "organizations:DescribeCreateAccountStatus"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "control_tower_admin_policy_attachment" {
  name       = "control_tower_admin_policy_attachment"
  roles      = [aws_iam_role.control_tower_admin_role.name]
  policy_arn = aws_iam_policy.control_tower_admin_policy.arn
}

output "control_tower_admin_role_arn" {
  value = aws_iam_role.control_tower_admin_role.arn
}

output "aft_execution_role_arn" {
  value = aws_iam_role.aft_execution_role.arn
}

output "aft_account_provisioning_role_arn" {
  value = aws_iam_role.aft_account_provisioning_role.arn
}

output "aft_admin_role_arn" {
  value = aws_iam_role.aft_admin_role.arn
}