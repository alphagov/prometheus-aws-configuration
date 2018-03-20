variable "ami_id" {}

variable "am_priv_ip" {}

variable "alertmanager_version" {
  description = "alertmanager version to install in the machine"
  default     = "0.14.0"
}

variable "device_mount_path" {
  description = "The path to mount the promethus disk"
  default     = "/dev/sdh"
}

variable "domain_name" {
  description = "Domain to serve Prometheus from and register for a TLS certificate"
}

variable "reliability_engineering_zone_id" {
  description = "This is the default route53 resource created by the prometheus module"
}

variable "prom_subnet_id" {
  description = "This is the subnet created by the prometheus module"
}

variable "prom_security_groups" {
  type        = "list"
  description = "This is the security group created by the prometheus module"
}

variable "lets_encrypt_email" {
  description = "Email to register with Let's Encrypt CA"
}

variable "real_certificate" {
  description = "Issue a real TLS certificate (yes/no)"
}

variable "logstash_endpoint" {
  description = "Endpoint to send logs to for logstash"
}

variable "logstash_port" {
  description = "Port of logstash endpoint"
}
