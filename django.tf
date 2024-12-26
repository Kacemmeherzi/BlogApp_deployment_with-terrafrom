# Django Deployment
resource "kubernetes_deployment" "django_deployment" {
  metadata {
    name = "django-app"
    labels = {
      app = "django-app"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "django-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "django-app"
        }
      }
      spec {
        container {
          name  = "django-app"
          image = "mkacem/django-app:latest"  
          port {
            container_port = 8000
          }
        }
      }
    }
  }
}

# Django Service (Internal access to the app)
resource "kubernetes_service" "django_service" {
  metadata {
    name = "django-service"
  }

  spec {
    selector = {
      app = "django-app"
    }

    port {
      port        = 8000           # External port to access the app
      target_port = 8000           # Internal port for the Django app
    }

    type = "NodePort"          # Exposing the service externally using a LoadBalancer
  }
}
