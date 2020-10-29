variable "resourcegroup_name" {
  description = "Resource group for VM"
  type        = string
  default     = "testVDI"
}

variable "location" {
  description = "Location for the resources"
  type        = string
  default     = "westeurope"
}

variable "create_resourcegroup" {
  description = "Set to true if you want to create a new resourcegroup"
  type        = bool
  default     = true
}
