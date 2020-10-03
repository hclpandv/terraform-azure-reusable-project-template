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
# Network definition
#--------------------------------------------------------------
variable "network_name" {
  description = "Name of the VNet to create"
}

variable "network_ip_range" {
  description = "Address spaces for the VNet to create"
}

variable "network_subnets" {
  description = "List of subnets to create"
  type = map(object({prefix = string}))
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