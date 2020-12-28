output "success" {
  value = tomap({ for k, v in module.example : k => v.success })
}
