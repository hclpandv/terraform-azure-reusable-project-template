terraform {
  required_version = ">= 0.13.2"
  required_providers {
    azurerm = "~> 2.13.0"
  }

  # Azure backend for Terrafrom tsfate file
  # Variables can not be used here so must be hardcoded
  #backend "azurerm" {
  #  storage_account_name  = ""
  #  container_name        = "terraform"
  #  key                   = "terraformstate.tfstate"
  #  sas_token             = ""
  #}
}

provider "azurerm" {
  features        {}
  #subscription_id = var.subscription_id
  #client_id       = var.client_id
  #client_secret   = var.client_secret
  #tenant_id       = var.tenant_id
  
  skip_provider_registration = true
}

# Data source to access the configuraiton of the AzureRM provider
data "azurerm_client_config" "current" {}

