output "container_id" {
  value = docker_container.web.id
}

output "container_ip" {
  value = docker_container.web.network_data[0].ip_address
}

output "external_port" {
  value = var.external_port
}