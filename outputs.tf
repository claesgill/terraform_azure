output "password" {
  description = "The password that is created for the VM"
  value = module.vdi.vdi_password
}

output "created_vms" {
  description = "VM(s) that got created"
  value = var.students
}
