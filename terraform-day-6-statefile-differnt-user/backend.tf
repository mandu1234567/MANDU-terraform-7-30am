terraform {
  backend "s3" {
    bucket         = "mandu-bucket-mandu"
    key            = "project/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile   = true
  }
}   