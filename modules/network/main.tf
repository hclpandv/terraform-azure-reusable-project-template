#-----------------------------------------------------------------
# Vnet Creation
#-----------------------------------------------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = lower("${var.network_name}")
  location            = var.location
  address_space       = [var.network_ip_range]
  resource_group_name = var.resource_group_name

  tags = {
    environment = var.environment
    owner       = var.owner
  }
}
#-----------------------------------------------------------------
# subnets Creation
#-----------------------------------------------------------------
locals {
  subnets = flatten([
    for subnet_name, subnet_specs in var.network_subnets: [{
      subnet_name    : subnet_name,
      address_prefix : subnet_specs.prefix
    }]
  ])
}

resource "azurerm_subnet" "subnets" {
  count                = length(local.subnets)
  name                 = lower(local.subnets[count.index].subnet_name)
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = [local.subnets[count.index].address_prefix]
  depends_on =  [
    azurerm_virtual_network.vnet
  ]
}