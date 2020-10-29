# Virtual Network
Module that creates a virtual network with a subnetwork and a network security group.

## Usage
This module requires a resource group before it can be used. 
See the [Inputs](#inputs) for spesific requirements.

After deployment you can use the output variables found in [Outputs](#outputs).  

### Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resourcegroup_name | Resource group for VM | string | - | yes |
| location | Location for the resources | string | - | yes |
| subnet_id | The subnetwork id | string | - | yes |
| network_security_group_id | The network security group id | string | - | yes |
| script_path | Path to post-install script | string | - | yes |
| skip_extension | Skip extension (post-installation) if true | bool | false | no |
| students | List of students to create VMs for | list(string) | ["test-vdi"] | no |
| password | Password for the created VM/VDIs | string | - | yes |

### Outputs
| Name | Description | Type |
|------|-------------|------|
| network_security_group_id | The network security group id | string |
| subnet_id | The subnetwork id | string |
