# See https://sites.google.com/a/digital.cabinet-office.gov.uk/gds-internal-it/news/aviationhouse-sourceipaddresses for details.
variable "cidr_admin_whitelist" {
  description = "CIDR ranges permitted to communicate with administrative endpoints"
  type        = "list"
  default     = [
    "213.86.153.212/32",
    "213.86.153.213/32",
    "213.86.153.214/32",
    "213.86.153.235/32",
    "213.86.153.236/32",
    "213.86.153.237/32",
    "85.133.67.244/32"
  ]
}

variable "ami_id" {
}

variable "alertmanager_version" {
  description = "alertmanager version to install in the machine"
  default     = "0.14.0"
}

variable "device_mount_path" {
  description = "The path to mount the promethus disk"
  default = "/dev/sdh"
}


variable "domain_name" {
  description = "Domain to serve Prometheus from and register for a TLS certificate"
}

variable "route53resource" {
  description = "This is the default route53 resource created b prometheus"
}

variable "prom_subnet_id" {
  description = "This is the default route53 resource created b prometheus"
}


variable "prom_security_groups" {
  type = "list"
  description = "This is the default route53 resource created b prometheus"
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
