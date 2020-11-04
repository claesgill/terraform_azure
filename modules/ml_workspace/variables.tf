variable "location" {
  description = "Location variable"
  type = string
  default = ""
}

variable "resourcegroup_name" {
  description = "Resource group for VM"
  type = string
  default = ""
}

variable "students" {
  description = "List of students to create VMs for"
  type        = list(string)
  default     = ["test-vdi"]
}
