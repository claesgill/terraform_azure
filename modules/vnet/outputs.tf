output "network_security_group_id" {
  description = "The network security group id"
  value       = azurerm_network_security_group.network_security_group.id
}

output "subnet_id" {
  description = "The subnetwork id"
  value       = azurerm_subnet.subnet.id
}