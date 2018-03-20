variable "prometheus_private_ip" {
  description = "The private ip address for prometheus"
  default     = "10.0.0.155"
}

variable "alertmanager_private_ip" {
  description = "The private ip address for alertmanager"
  default     = "10.0.0.38"
}
