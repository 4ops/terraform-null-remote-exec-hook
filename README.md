# Remote exec hook

Executes script file or commands list on remote server if watch value changed.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| null | ~> 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| null | ~> 3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ssh\_host | Required: hostname for SSH connection. | `string` | n/a | yes |
| ssh\_private\_key | Required: private key for SSH authentication. | `string` | n/a | yes |
| commands | Inline commands. | `list(string)` | `[]` | no |
| on\_host\_changed | Execute script if SSH host changed. | `bool` | `true` | no |
| only\_checksum | Show only checksum of watch value in plan diff. | `bool` | `true` | no |
| script | Path to script file. | `string` | `""` | no |
| ssh\_port | SSH server port number. | `number` | `22` | no |
| ssh\_user | SSH username. | `string` | `"root"` | no |
| watch | Execute script if value changed. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| success | Last success execution identifier. Can be used for call some actions after hook script finished. |

