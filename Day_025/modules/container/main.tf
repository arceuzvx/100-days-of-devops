terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_container" "this" {
  name  = var.name
  image = var.image
  ports {
    internal = var.internal_port
    external = var.external_port
  }
  env = var.env_vars
}
