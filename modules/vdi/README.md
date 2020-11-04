# Virtual Machine
Module that creates one or more VM/VDIs.

## Usage
This module requires a resource group, virtual network with a subnet before it can be used. 
See the [Inputs](#inputs) for spesific requirements. 

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
None

### Example
```hcl
module "vdi" {
  source = "./modules/vdi"

  # Variables
  resourcegroup_name        = "my-resource-group"
  location                  = "westeurope"
  network_security_group_id = "123nlk324løkj3546øl"
  subnet_id                 = "543ølk3j45908345lkl"
  script_path               = "setup/post_install_gnomedesktop.sh"
  password                  = "Password123!"
  students                  = ["Jon"]
  skip_extension            = false
}
```
