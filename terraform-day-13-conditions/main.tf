variable "aws_region" {
  description = "The region in which to create the infrastructure"
  type        = string
  nullable    = false
  default     = "us-east-1"

  validation {
    condition     = contains(["us-east-1", "eu-west-1"], var.aws_region)
    error_message = "The aws_region must be one of: us-east-1, eu-west-1"
  }
}
provider "aws" {
  region = var.aws_region
}
resource "aws_s3_bucket" "dev" {
  bucket = "mandu-${var.aws_region}-bucket"

  tags = {
    Name        = "mandu-dev-bucket"
    Environment = "dev"
  }
}