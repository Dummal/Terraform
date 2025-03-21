```hcl
variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-2"
}

variable "master_account_id" {
  description = "AWS Master Account ID."
  type        = string
  default     = "123456789631"
}

variable "master_account_email" {
  description = "Email address for AWS Master Account."
  type        = string
  default     = "ghyut@fggg.io"
}

variable "development_account_email" {
  description = "Email address for Development OU."
  type        = string
  default     = "development@thu.io"
}

variable "aft_logs_bucket_name" {
  description = "S3 bucket name for AFT logs."
  type        = string
  default     = "development"
}

variable "availability_zones" {
  description = "List of availability zones to use."
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "create_nat_gateway" {
  description = "Whether to create a NAT Gateway."
  type        = bool
  default     = true
}

variable "create_internet_gateway" {
  description = "Whether to create an Internet Gateway."
  type        = bool
  default     = true
}

variable "elastic_ips" {
  description = "Number of Elastic IPs to allocate."
  type        = number
  default     = 2
}

variable "common_tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "Landing Zone"
    Owner       = "ghyut@fggg.io"
  }
}
```

---