variable "master_account_id" {
  description = "The AWS account ID for the master account."
  type        = string
}

variable "enable_control_tower" {
  description = "Flag to enable AWS Control Tower setup."
  type        = bool
}

variable "master_account_email" {
  description = "Email address for the master AWS account."
  type        = string
}

variable "organizational_units" {
  description = "List of organizational units (OUs) in the landing zone."
  type        = map(string)
}

variable "aws_region" {
  description = "AWS region where resources will be provisioned."
  type        = string
}

variable "aft_logs_bucket_name" {
  description = "Name of the S3 bucket for AFT logs."
  type        = string
}

variable "public_vpc_cidr" {
  description = "CIDR block for the public VPC."
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
}

variable "private_vpc_cidr" {
  description = "CIDR block for the private VPC."
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
}

variable "aws_availability_zone" {
  description = "Availability zone for the VPC and subnets."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the subnet will be created."
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the subnet."
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet."
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Flag to enable public IP mapping on subnet launch."
  type        = bool
}

variable "tags" {
  description = "Common tags to be applied to all resources."
  type        = map(string)
}