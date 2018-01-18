resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
  enable_dns_hostnames = true

  tags {
    Name = "Reliability Engineering - Prometheus VPC"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${aws_vpc.main.cidr_block}"
  map_public_ip_on_launch = true

  tags {
    Name = "Main"
  }
}

resource "aws_security_group" "ssh_from_internet" {
  vpc_id      = "${aws_vpc.main.id}"
  name        = "SSH from internet"
  description = "Bastion hosts in the DMZ that can be connected to via SSH from whitelisted locations"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${var.cidr_admin_whitelist}"]
  }

  tags {
    Name = "SSH from internet"
  }
}
