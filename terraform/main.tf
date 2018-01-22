provider "aws" {
  region = "eu-west-1" # "${var.aws_region}"
}

terraform {
  required_version = ">= 0.11.2"
}

module "prometheus" {
  source = "modules/prometheus"

  ami_id = "${data.aws_ami.ubuntu.id}"
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