#--------------------------------------------------------------
# AzureRM Terraform provider credentials
# See https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html
#--------------------------------------------------------------
variable "subscription_id" {
  description = "Enter Subscription ID for provisioning resources in Azure"
}

variable "client_id" {
  description = "Enter Client ID for service principal created in Azure AD"
}

variable "client_secret" {
  description = "Enter Client secret for service principal in Azure AD"
}

variable "tenant_id" {
  description = "Enter Tenant ID / Directory ID of your Azure AD. Run Get-AzureSubscription to know your Tenant ID"
}

variable "location" {
  type = string
  description = "Azure Location / Region to host infra"
  default     = "westeurope"

  validation {
    condition     = var.location == "westeurope" || var.location == "northeurope"
    error_message = "Sorry, but we only accept Location as westeurop or northeurope."
  }
}

#--------------------------------------------------------------
# Environment specific (defaults)
#--------------------------------------------------------------
variable "customer_name" {
  description = "Customer Name"
  type        = string
  default     = "viki-tf"
}

variable "cost_center" {
  description = "Cost Center Name"
  type        = string
  default     = "VikiCostCenter"
}

variable "environment" {
  description = "Environment Names"
  type        = string
  default     = "playground"
}

variable "owner" {
  description = "Resource Owner"
  type        = string
  default     = "Vikas Pandey"    
}
