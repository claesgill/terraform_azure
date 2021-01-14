output "password" {
  description = "The password that is created for the VM"
  value = module.vdi.vdi_password
}