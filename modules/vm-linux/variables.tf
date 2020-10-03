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