terraform {
  required_version = ">= 0.13"
}

module "example" {
  source = "../../"

  for_each = toset(var.ssh_hosts)

  ssh_host        = each.key
  ssh_user        = var.ssh_user
  ssh_port        = var.ssh_port
  ssh_private_key = file(var.ssh_private_key_file)
  commands        = ["echo ok"]
  watch           = "Change this line for hook execution"
}
