variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "eu-west-1"
}

variable "naming_prefix" {
  description = "Prefix for naming resources."
  type        = string
  default     = "ti-"
}

variable "allowed_regions" {
  description = "List of allowed AWS regions for resource creation."
  type        = list(string)
  default     = ["eu-west-1", "eu-central-1"]
}

variable "data_residency" {
  description = "Data residency policy."
  type        = string
  default     = "EU-only"
}

variable "vpn_configuration" {
  description = "VPN configuration for secure on-premises integration."
  type        = map(string)
  default     = {
    "vpn_gateway_id" = "vgw-12345678"
    "customer_gateway_id" = "cgw-12345678"
  }
}

variable "siem_integration" {
  description = "Integration with SIEM system."
  type        = string
  default     = "enabled"
}

variable "compliance_monitoring" {
  description = "AWS Config rules for compliance monitoring."
  type        = string
  default     = "enabled"
}

variable "patch_management" {
  description = "Automated patching using AWS Systems Manager Patch Manager."
  type        = string
  default     = "enabled"
}

variable "data_retention_policy" {
  description = "Data retention policy in years."
  type        = number
  default     = 7
}

variable "resource_quotas_management" {
  description = "Monitoring and requesting quota increases."
  type        = string
  default     = "enabled"
}

variable "infrastructure_compliance" {
  description = "Enforce compliance and security baselines."
  type        = string
  default     = "enabled"
}

variable "software_licensing" {
  description = "Manage software licenses using AWS License Manager."
  type        = string
  default     = "enabled"
}

variable "secrets_management" {
  description = "Manage secrets using AWS Secrets Manager."
  type        = string
  default     = "enabled"
}

variable "dns_management" {
  description = "DNS management using Amazon Route 53."
  type        = string
  default     = "enabled"
}

variable "resource_tagging" {
  description = "Mandatory tagging policies."
  type        = string
  default     = "enabled"
}

variable "data_lifecycle_management" {
  description = "Lifecycle policies for data archiving."
  type        = string
  default     = "enabled"
}

variable "compliance_frameworks" {
  description = "Compliance frameworks to adhere to."
  type        = string
  default     = "GDPR"
}

variable "sns_alerts" {
  description = "AWS SNS for alerting."
  type        = string
  default     = "enabled"
}

variable "encryption" {
  description = "Encryption of data at rest and in transit using AWS KMS."
  type        = string
  default     = "enabled"
}