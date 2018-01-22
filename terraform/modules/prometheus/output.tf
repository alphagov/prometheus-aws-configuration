output "data" {
  value = "${data.template_file.user_data_script.rendered}"
}

output "public_dns" {
  value = "${aws_instance.prometheus.public_dns}"
}