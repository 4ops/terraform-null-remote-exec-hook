output "success" {
  value = join("", concat(null_resource.execute_script.*.id, null_resource.execute_commands.*.id))

  description = "Last success execution identifier. Can be used for call some actions after hook script finished."
}
