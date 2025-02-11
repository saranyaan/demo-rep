provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Define the Kubernetes pod
resource "kubernetes_pod" "vm_pod" {
  metadata {
    name = "vm-pod"
    labels = {
      app = "vm"
    }
  }

  spec {
    container {
      image = "nginx"
      name  = "vm-container"

      port {
        container_port = 80
      }
    }
  }
}

# Create a Kubernetes Service to expose the Pod
resource "kubernetes_service" "vm_service" {
  metadata {
    name = "vm-service"
  }

  spec {
    selector = {
      app = "vm"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }

    type = "ClusterIP" # Change to "NodePort" or "LoadBalancer" if needed
  }
}

# Output the service IP instead of pod IP
output "service_ip" {
  value = kubernetes_service.vm_service.spec[0].cluster_ip
}