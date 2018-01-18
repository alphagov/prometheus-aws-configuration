resource "aws_s3_bucket" "prometheus_config_bucket" {
  bucket = "gds-prometheus-config"
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_object" "prometheus_config" {
  bucket = "${aws_s3_bucket.prometheus_config_bucket.id}"
  key    = "prometheus.yml"
  source = "prometheus.yml"
  etag   = "${md5(file("prometheus.yml"))}"
}
