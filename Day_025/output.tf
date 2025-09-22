output "nginx_id" {
  value = module.nginx_container.container_id
}

output "redis_id" {
  value = module.redis_container.container_id
}
