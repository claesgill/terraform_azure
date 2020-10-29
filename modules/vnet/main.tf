# Create virtual network
resource "azurerm_virtual_network" "virtual_network" {
  name                = "virtual_network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resourcegroup_name
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = var.resourcegroup_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes       = ["10.0.1.0/24"]
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "network_security_group" {
  name                = "network_security_group"
  location            = var.location
  resource_group_name = var.resourcegroup_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
