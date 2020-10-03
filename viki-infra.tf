#-----------------------------------------------------------
# Resource Group
#-----------------------------------------------------------

#-----------------------------------------------------------
# Network
#-----------------------------------------------------------
module "viki-network" {
  source                = "./modules/network"
  location              = "westeurope"
  resource_group_name   = "RG_Manoj.Singh"

  network_name     = "${var.customer_name}-vnet"
  network_ip_range = "192.168.0.0/26"
  network_subnets  = { 
      "dmz"      = {prefix="192.168.0.0/28"}
      "frontend" = {prefix="192.168.0.16/28"}
      "backend"  = {prefix="192.168.0.32/28"}
  }
  #network_gwsubnet_prefix = "192.168.254.0/26"
  
  owner                 = var.owner
  environment           = var.environment
}

#-----------------------------------------------------------
# VM
#-----------------------------------------------------------
module "viki-vm" {
  source                = "./modules/vm-linux"
  location              = "westeurope"
  resource_group_name   = "RG_Manoj.Singh"

  vm_name     = "vikimgmt"
  vnet_name   = "${var.customer_name}-vnet"
  subnet_name = "dmz"
 
  owner                 = var.owner
  environment           = var.environment
}