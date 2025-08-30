# General AWS Configuration
variable "aws_region" {
  description = "The AWS region to deploy everything to (e.g., us-east-1)"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project for resource tagging"
  type        = string
  default     = "3-tier-app"
}

# Networking Variables
variable "vpc_cidr" {
  description = "CIDR block for the main VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# EC2 Instance Variables
variable "ec2_instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of an existing EC2 Key Pair for SSH access"
  type        = string
  default     = "my-key-pair" # !!! CHANGE THIS TO YOUR KEY PAIR NAME !!!
}

# S3 Bucket Variable
variable "s3_bucket_name" {
  description = "Globally unique name for the S3 bucket"
  type        = string
  default     = "my-unique-3-tier-app-bucket-12345" # !!! CHANGE THIS TO A UNIQUE NAME !!!
}
