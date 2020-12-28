variable "ssh_host" {
  type = string

  description = "Required: hostname for SSH connection."
}

variable "ssh_user" {
  type    = string
  default = "root"

  description = "SSH username."
}

variable "ssh_port" {
  type    = number
  default = 22

  validation {
    condition     = var.ssh_port > 0 && var.ssh_port < 65536 && floor(var.ssh_port) == var.ssh_port
    error_message = "Must be positive integer number. Max value: 65535."
  }

  description = "SSH server port number."
}

variable "ssh_private_key" {
  type = string

  description = "Required: private key for SSH authentication."
}

variable "script" {
  type    = string
  default = ""

  description = "Path to script file."
}

variable "commands" {
  type    = list(string)
  default = []

  description = "Inline commands."
}

variable "watch" {
  type    = string
  default = ""

  description = "Execute script if value changed."
}

variable "only_checksum" {
  type    = bool
  default = true

  description = "Show only checksum of watch value in plan diff."
}

variable "on_host_changed" {
  type    = bool
  default = true

  description = "Execute script if SSH host changed."
}
