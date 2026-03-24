
resource "aws_s3_bucket" "name" {
    bucket = "mandu-bucket-mandutcfyu" 
    # lifecycle {
    #   create_before_destroy = true
    # }
    # lifecycle {
    #   ignore_changes = [ tags ]
    # }
    # lifecycle {
    #   prevent_destroy = true
    # }

    tags = {
        Name = "mandu-bucket-mandutcfyu"
    }

}
