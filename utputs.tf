output "django_service_url" {
  value = "http://${kubernetes_service.django_service.metadata.0.name}:${kubernetes_service.django_service.spec.0.port.0.node_port}"
}

output "prometheus_service_url" {
  value = "http://${kubernetes_service.prometheus_service.metadata.0.name}:${kubernetes_service.prometheus_service.spec.0.port.0.node_port}"
}

output "grafana_service_url" {
  value = "http://${kubernetes_service.grafana_service.metadata.0.name}:${kubernetes_service.grafana_service.spec.0.port.0.node_port}"
}
