variable "name" {}
variable "image" {}
variable "internal_port" {}
variable "external_port" {}
variable "env_vars" {
  type    = list(string)
  default = []
}
