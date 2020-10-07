#--------------------------------------------------------------
# Resource group definition
#--------------------------------------------------------------
variable "resource_group_name" {
  description = "Enter name of resource group for provisioning resources in Azure"
}

variable "location" {
  description = "Enter Azure Location/Region"
}

#--------------------------------------------------------------
# VM definition
#--------------------------------------------------------------
variable "vm_name"{
  description = "Enter Name of the VM"
}

variable "vm_size" {
  description = "VM Size"
  default = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin Username on VM"
  default     = "vikiadmin"
}

variable "admin_key_filepath" {
  description = "Public key file path for Admin User"
}

variable "vnet_rg_name" {
  description = "VNET RG name"
}

variable "vnet_name" {
  description = "VNET name"
}

variable "subnet_name" {
  description = "Subnet name"
}
#--------------------------------------------------------------
# Environment / Tags
#--------------------------------------------------------------
variable "owner" {
  description = "Resource Owner"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}