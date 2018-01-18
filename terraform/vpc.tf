resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
  enable_dns_hostnames = true

  tags {
    Name = "Reliability Engineering - Prometheus VPC"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "main"
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

resource "aws_security_group" "http_outbound" {
  vpc_id      = "${aws_vpc.main.id}"
  name        = "HTTP outbound"
  description = "Allow HTTP connections out to the internet"

  egress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "HTTP outbound"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id = "${aws_subnet.main.id}"
  route_table_id = "${aws_route_table.public.id}"
}
