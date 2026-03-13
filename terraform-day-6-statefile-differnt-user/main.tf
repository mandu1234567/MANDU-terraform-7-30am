resource "aws_s3_bucket" "name" {
    bucket = "bucket-mandu-bucket"
    tags = {
      Name = "Mandu_bucket"
    }
  
}