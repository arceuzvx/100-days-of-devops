terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# NGINX container

module "nginx_container" {
  source   = "./modules/container"
  providers = {
    docker = docker
  }

  name          = "nginx-app"
  image         = "nginx:latest"
  internal_port = 80
  external_port = 8080
}

module "redis_container" {
  source   = "./modules/container"
  providers = {
    docker = docker
  }

  name          = "redis-db"
  image         = "redis:latest"
  internal_port = 6379
  external_port = 6379
}

module "postgres_container" {
  source   = "./modules/container"
  providers = {
    docker = docker
  }

  name          = "postgres-db"
  image         = "postgres:latest"
  internal_port = 5432
  external_port = 5432
  env_vars      = [
    "POSTGRES_USER=<redacted>",
    "POSTGRES_PASSWORD=<redacted>",
    "POSTGRES_DB=mydb"
  ]
}
