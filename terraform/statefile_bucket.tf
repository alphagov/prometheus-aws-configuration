resource "aws_s3_bucket" "statefile_bucket" {
  bucket = "gds-prometheus-terraform"
  acl    = "private"

  versioning {
    enabled = true
  }
}
