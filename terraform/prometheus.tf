data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "prometheus" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.main.id}"
  vpc_security_group_ids = ["${aws_security_group.ssh_from_internet.id}", "${aws_security_group.http_outbound.id}"]
  user_data              = "${data.template_file.user_data_script.rendered}"
  iam_instance_profile   = "${aws_iam_instance_profile.prometheus_config_reader_profile.id}"

  tags {
    Name = "Prometheus"
  }
}

data "template_file" "user_data_script" {
  template = "${file("cloud.conf")}"
}

output "data" {
  value = "${data.template_file.user_data_script.rendered}"
}

output "public_dns" {
  value = "${aws_instance.prometheus.public_dns}"
}
