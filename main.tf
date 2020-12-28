terraform {
  required_version = ">= 0.13"

  required_providers {
    null = "~> 3.0.0"
  }
}

locals {
  host_changed  = var.on_host_changed ? var.ssh_host : ""
  watch_changed = var.only_checksum ? sha256(var.watch) : var.watch
}

resource "null_resource" "execute_script" {
  count = var.script != "" ? 1 : 0

  triggers = {
    watch_changed = local.watch_changed
    host_changed  = local.host_changed
  }

  connection {
    type        = "ssh"
    user        = var.ssh_user
    private_key = var.ssh_private_key
    host        = var.ssh_host
    port        = var.ssh_port
  }

  provisioner "remote-exec" {
    script = var.script
  }
}

resource "null_resource" "execute_commands" {
  count = length(var.commands) > 0 ? 1 : 0

  triggers = {
    watch_changed = local.watch_changed
    host_changed  = local.host_changed
  }

  connection {
    type        = "ssh"
    user        = var.ssh_user
    private_key = var.ssh_private_key
    host        = var.ssh_host
    port        = var.ssh_port
  }

  provisioner "remote-exec" {
    inline = var.commands
  }
}
