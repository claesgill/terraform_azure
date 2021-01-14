variable "location" {
  description = "Location variable"
  type = string
}

variable "resourcegroup_name" {
  description = "Resource group for VM"
  type = string
}

variable "subnet_id" {
  description = "The subnetwork id"
  type        = string
}

variable "network_security_group_id" {
  description = "The network security group id"
  type        = string
}

variable "script_path" {
  description = "Path to post-install script"
  type        = string
  // default     = "setup/post_install_gnomedesktop.sh"
}

variable "skip_extension" {
  description = "Skip extension (post-installation) if true"
  type        = bool
  default     = false
}

variable "students" {
  description = "List of students to create VMs for"
  type        = list(string)
  default     = ["test-vdi"]
}

variable "password" {
  description = "Password for the created VM/VDIs"
  type        = string
}