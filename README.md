# Terraform Deployment for BlogApp (Django) on Minikube

This repository contains Terraform configurations to deploy a Django-based BlogApp to a local Kubernetes cluster running on [Minikube](https://minikube.sigs.k8s.io/).

## Prerequisites

Ensure you have the following tools installed:

- [Terraform](https://www.terraform.io/downloads.html) (v1.0.0 or later)
- [Minikube](https://minikube.sigs.k8s.io/docs/) (v1.18.0 or later)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) (v1.21.0 or later)
- Docker (if building images locally ,otherwise an image already provided in my dockerhub )

## Getting Started

### 1. Install Minikube and Start Cluster
minikube start

### 2. Set Up kubectl Context for Minikube
kubectl config use-context minikube

### 3. Clone This Repository
git clone https://github.com/Kacemmeherzi/BlogApp_deployment_with-terrafrom.git

### 4. Initialize Terraform
terraform init

### 5. Apply the Terraform Configuration
terraform apply

### 6. Access the BlogApp
minikube service django-service --url

### 7. Destroy the Deployment (Optional)
terraform destroy

