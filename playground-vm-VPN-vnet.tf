#-----------------------------------------------------------
# VM
#-----------------------------------------------------------
module "viki-vm" {
    source                = "./modules/vm-linux"
    location              = "westeurope"
    resource_group_name   = "RG_Manoj.Singh"

    vm_name               = "viki-mgmt02"
    admin_key_filepath    = "./ssh-keys/id_rsa.pub"
    vnet_rg_name          = "RG_networking-westeurope"
    vnet_name             = "VNET_WE_VPN"
    subnet_name           = "frontend"
  
    #depends_on =  [
    #  module.viki-network
    #]
    owner                 = var.owner
    environment           = var.environment
}

output "viki-mgmt02-pvt-ip" {
    value                 = "${module.viki-vm.network_interface_private_ip}"
}