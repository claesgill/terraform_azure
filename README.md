# Terraform Azure
This is a POC for using terraform to deploy various resources to Azure.

## Content
1. [Prerequisites](#prerequisites)
2. [Getting started](#getting-started)
    1. [Usage](#usage)
    2. [Inputs](#inputs)
    3. [Outputs](#outputs)
    4. [Clean up](#clean-up)
3. [Modules](#modules)

## Prerequisites
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) >= 2.12.1
- [Terraform binary](https://www.terraform.io/downloads.html) >= v0.13.1

## Getting started
To be able to use any of the modules you need to login to Azure and if you are member of multiple subscriptions 
you need to set these as well:
```sh
1. az login
2. az account list --output table # find the subscription you want to use
3. az account set --subscription <subscription-id> # set your subscription id as active subscription
4. az account show # verify correct subscription
```

### Usage
> :warning: Setup configuration should only be done in `variables.tf`.

The following command will create a resource group, virtual network and finally deploy a VM to Azure:
```sh
$ make all
```

### Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resourcegroup_name | Resource group for VM | string | "workshop" | no |
| location | Location for the resources | string | "westeurope" | no |
| create_resourcegroup | Set to true if you want to create a new resourcegroup | bool | false | no |
| skip_extension | Skip extension (post-installation) if true | bool | false | no |
| students | List of students to create VMs for | list(string) | ["claes"] | no |
| password | Password for the created VM/VDIs | string | null | no |
| script_path | Path of the script to post install on VM(s). | string | "./post_install_gnome_and_azure.sh" | no |

### Outputs
| Name | Description |
| :--- | :---------- |
| password | The password that is created for the VM |
| created_vms | VM(s) that got created |

### Clean up
```sh
# NB! Will delete everything inside including the group
az group delete -n <resource-group-name>
```

## Modules
See the corresponding modules READMEs for how to use them.
- [vdi](modules/vdi)
- [vnet](modules/vnet)
- [ml_workspace](modules/ml_workspace) (not finished)