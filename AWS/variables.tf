# variables.tf
variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS Region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where instances will be created"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where instances will be created"
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "Linux-Instances-Demo"
  }
}

variable "rhel9_ami_id" {
  description = "AMI ID for Debian"
  type        = string
  default     = "ami-0f174d97d7d7a029b"
}

variable "debian_ami_id" {
  description = "AMI ID for Debian"
  type        = string
  default     = "ami-01427dce5d2537266"
}

variable "ubuntu_ami_id" {
  description = "AMI ID for Debian"
  type        = string
  default     = "ami-02e2af61198e99faf"
}
