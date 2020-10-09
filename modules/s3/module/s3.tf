resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  acl    = var.bucket_acl

  tags = {
    Name = var.bucket_tag_name
  }
}

