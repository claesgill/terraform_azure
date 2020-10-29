provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}

# Create network interface for each VM/VDI
resource "azurerm_network_interface" "network_interface" {
  count               = length(var.students)
  name                = "${var.students[count.index]}-nic"
  location            = var.location
  resource_group_name = var.resourcegroup_name

  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
//    public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  count                     = length(var.students)
  network_interface_id      = azurerm_network_interface.network_interface[count.index].id
  network_security_group_id = var.network_security_group_id
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "vdi" {
  count                 = length(var.students)
  name                  = "${var.students[count.index]}-vdi"
  location              = var.location
  resource_group_name   = var.resourcegroup_name
  network_interface_ids = [azurerm_network_interface.network_interface[count.index].id]
  size                  = "Standard_D2_v3"

  disable_password_authentication = false

  os_disk {
    name                 = "${var.students[count.index]}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name  = var.students[count.index]
  admin_username = var.students[count.index]
  admin_password = var.password
}

resource "azurerm_virtual_machine_extension" "extension" {
  count                = var.skip_extension ? 0 : length(var.students)
  name                 = "${var.students[count.index]}-hostname"
  virtual_machine_id   = azurerm_linux_virtual_machine.vdi[count.index].id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  protected_settings = <<PROT
    {
        "script": "${base64encode(file(var.script_path))}"
    }
PROT
}
