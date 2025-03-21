variable "region" {
  description = "AWS region for the resources"
  type        = string
  default     = "us-east-2"
}

variable "master_account_id" {
  description = "AWS Account ID of the master account"
  type        = string
}

variable "control_tower_admin_role_name" {
  description = "Name for Control Tower Admin IAM Role"
  type        = string
  default     = "ControlTowerAdminRole"
}

variable "aft_execution_role_name" {
  description = "Name for AFT Execution IAM Role"
  type        = string
  default     = "AFTExecutionRole"
}

variable "aft_account_provisioning_role_name" {
  description = "Name for AFT Account Provisioning IAM Role"
  type        = string
  default     = "AFTAccountProvisioningRole"
}

variable "aft_admin_role_name" {
  description = "Name for AFT Admin IAM Role"
  type        = string
  default     = "AFTAdminRole"
}

variable "control_tower_admin_policy_name" {
  description = "Name for Control Tower Admin Policy"
  type        = string
  default     = "ControlTowerAdminPolicy"
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {
    Environment = "LandingZone"
    Project     = "ControlTowerAFT"
  }
}