variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created."
  type        = string
}

variable "cidr_block" {
  description = "The base CIDR block to allocate subnets dynamically."
  type        = string
}

variable "ipv6_enabled" {
  description = "Enable IPv6 for the subnets."
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "The IPv6 CIDR block to assign to the subnets."
  type        = string
}

variable "type" {
  description = "Type of subnets to create (public or private)."
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones in the region."
  type        = list(string)
}

variable "subnet_count" {
  description = "The number of subnets to create."
  type        = number
}

variable "elastic_ip_count" {
  description = "Number of Elastic IPs required for public subnets."
  type        = number
  default     = 0
}

variable "nat_gateway_enabled" {
  description = "Enable NAT Gateway for private subnets."
  type        = bool
  default     = false
}

variable "common_tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
}

variable "network_acl_id" {
  description = "The Network ACL ID to associate with the subnets."
  type        = string
}