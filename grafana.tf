resource "kubernetes_deployment" "grafana" {
  metadata {
    name = "grafana"
    labels = {
      app = "grafana"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "grafana"
      }
    }
    template {
      metadata {
        labels = {
          app = "grafana"
        }
      }
      spec {
        container {
          name  = "grafana"
          image = "grafana/grafana:latest"
          port {
            container_port = 3000
          }
          env {
            name  = "GF_SECURITY_ADMIN_PASSWORD"
            value = "admin123"
          }
          env {
            name  = "GF_SECURITY_ADMIN_USER"
            value = "admin"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "grafana_service" {
  metadata {
    name = "grafana"
  }

  spec {
    selector = {
      app = "grafana"
    }
    port {
      port        = 82
      target_port = 3000
    }
    type = "NodePort"
  }
}
