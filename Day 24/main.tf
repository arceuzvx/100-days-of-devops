terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "local" {}
provider "random" {}

# Generate a random string
resource "random_string" "example" {
  length  = 25
  special = false
}

# Use the random string inside a local file
resource "local_file" "example" {
  content  = "Your random string is: ${random_string.example.result}"
  filename = "${path.module}/random_output.txt"
}
