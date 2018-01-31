provider "aws" {
  region = "eu-west-1" # "${var.aws_region}"
}

terraform {
  required_version = ">= 0.11.2"
}

module "prometheus" {
  source             = "modules/prometheus"

  ami_id             = "${data.aws_ami.ubuntu.id}"
  lets_encrypt_email = "reliability-engineering-tools-team@digital.cabinet-office.gov.uk"
  domain_name        = "metrics.gds-reliability.engineering"
  logstash_endpoint  = "47c3212e-794a-4be1-af7c-2eac93519b0a-ls.logit.io"
  logstash_port      = 18210
}

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
