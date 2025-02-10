## Environment variables ##
variable "aws_region" {
  description = "The AWS region to deploy resources"  
}

variable "project_name" {
  description = "project name"
  type        = string
}
variable "environment" {
  description = "environment"
  type        = string
}

variable "key_name" {
  description = "The key pair name to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the instance"
  type        = string
}

variable "instance_profile" {
  description = "The IAM instance profile to use for the instance"
  type        = string
  
}