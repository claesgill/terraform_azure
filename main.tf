provider "azurerm" {
  version = "~>2.0"
  features {}
}

# Generate random password
resource "random_password" "password" {
  length  = 16
  special = false
}

locals {
  password = var.password != null ? var.password : random_password.password.result
}

// Create resource (if needed)
resource "azurerm_resource_group" "resource_group" {
  count    = var.create_resourcegroup ? 1 : 0
  name     = var.resourcegroup_name
  location = var.location
}

// Create VNet
module "vnet" {
  source = "./modules/vnet"

  # Variables
  resourcegroup_name = var.resourcegroup_name
  location           = var.location

  depends_on = [
    azurerm_resource_group.resource_group
  ]
}

// Loop over each student in students list and create VM(s)
module "vdi" {
  source = "./modules/vdi"

  # Variables
  resourcegroup_name        = var.resourcegroup_name
  location                  = var.location
  network_security_group_id = module.vnet.network_security_group_id
  subnet_id                 = module.vnet.subnet_id
  script_path               = var.script_path
  password                  = local.password
  students                  = var.students
  skip_extension            = var.skip_extension
}
