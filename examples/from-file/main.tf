terraform {
  required_version = ">= 0.13"
}

module "example" {
  source = "../../"

  ssh_host        = var.ssh_host
  ssh_user        = var.ssh_user
  ssh_port        = var.ssh_port
  ssh_private_key = file(var.ssh_private_key_file)
  script          = "${path.root}/example.sh"
  watch           = "Change this line for hook execution"
}
