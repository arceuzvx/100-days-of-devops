terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {}

resource "local_file" "example" {
  filename = var.filename
  content  = var.content
}

output "file_path" {
  value = local_file.example.filename
}

resource "local_file" "log" {
  filename = "day23-log.txt"
  content  = "Log file created at ${timestamp()}"
}
