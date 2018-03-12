output "data" {
  value = "${data.template_file.user_data_script.rendered}"
}

output "public_dns" {
  value = "${aws_instance.prometheus.public_dns}"
}

output "route53resource" {
  value = "${aws_route53_zone.main.zone_id}"
}

output "prom_security_groups" {
  value = [
        "${aws_security_group.ssh_from_gds.id}",
        "${aws_security_group.http_outbound.id}",
        "${aws_security_group.external_http_traffic.id}",
        "${aws_security_group.logstash_outbound.id}",
      ]
}

output "prom_subnet_id" {
  value = "${aws_subnet.main.id}"
}