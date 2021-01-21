variable "resourcegroup_name" {
  description = "Resource group for VM."
  type        = string
  default     = "workshop"
}

variable "location" {
  description = "Location for the resources."
  type        = string
  default     = "westeurope"
}

variable "create_resourcegroup" {
  description = "Set to true if you want to create a new resourcegroup."
  type        = bool
  default     = true
}

variable "password" {
  description = "The password for the VM(s) to be created."
  type        = string
  default     = null
}

variable "script_path" {
  description = "Path of the script to post install on VM(s)."
  type        = string
  default     = "./post_install_gnome_and_azure.sh"
}

variable "students" {
  description = "List of names of participants in workshop. Provisioning same number of VM(s) as names in list."
  type        = list
  default     = ["claes"]
}

variable "skip_extension" {
  description = "Set if not want to install anything to the VM(s)."
  type        = bool
  default     = false
}