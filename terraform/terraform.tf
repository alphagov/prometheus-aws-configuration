terraform {
  backend "s3" {
    bucket = "gds-prometheus-terraform"
    key    = "terraform/state"
  }
}