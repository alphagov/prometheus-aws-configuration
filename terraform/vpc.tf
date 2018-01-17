resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"

  tags {
    Name = "Reliability Engineering - Prometheus VPC"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${aws_vpc.main.cidr_block}"

  tags {
    Name = "Main"
  }
}
