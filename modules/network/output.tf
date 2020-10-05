#------------------------------------------------------------
# Add Outputs to see when Terraform finishes the provisioning
#------------------------------------------------------------
output "vnet" {
  value = azurerm_virtual_network.vnet
}

output "subnets" {
  value = azurerm_subnet.subnets
}