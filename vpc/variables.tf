variable "region" {
  description = "The AWS region to deploy the VPC in."
  default     = "us-east-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones for subnets."
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnets."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
}

variable "instance_tenancy" {
  description = "The instance tenancy option for the VPC."
  default     = "default"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for VPC Flow Logs."
}