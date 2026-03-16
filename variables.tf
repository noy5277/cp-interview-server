variable "s3-backend-name" {
  description = "s3 bucket for terraform backend"
  type        = string
}

variable "env" {
  description = "eks environments. examples: dev,stage,prod" 
}

variable "eks_name" {
  description = "The eks cluster name"
  type = string
}

variable "aws_region" {
  description = "region to create resources"
  type        = string
}

variable "vpc_name" {
  description = "vpc name"
  type        = string
}

variable "vpc_cidr_block" {
  description = "cidr block"
  type        = string
}

variable "enable_dns_support" {
  description = "vpc dns support"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "vpc dns hostnames"
  type        = bool
}

variable "subnets" {
  type = map(object({
    cidr_block        = string,
    availability_zone = string,
    type              = string
  }))
  description = "Eks subnetes"
}