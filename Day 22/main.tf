terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "test" {
  filename = "${path.module}/hello.txt"
  content  = "Hello, Terraform from Day 22!"
}
