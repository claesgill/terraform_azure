output "password" {
  description = "Random password that is created for the VM"
  value = random_password.password.result
}