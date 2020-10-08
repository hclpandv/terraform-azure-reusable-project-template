#-----------------------------------------------
# Setup Ansible locally for provisioning
#-----------------------------------------------
#module "ansible-setup-local" {
#    source = "../../modules/setup-ansible-ubuntu-local"
#}

#-----------------------------------------------
# Deploy VM on VPN Vnet
#-----------------------------------------------
module "viki-vm" {
    source                = "../../modules/vm-linux"
    location              = "westeurope"
    resource_group_name   = "RG_Manoj.Singh"

    vm_name               = "viki-mgmt02"
    admin_key_filepath    = "./ssh-keys/id_rsa.pub"
    vnet_rg_name          = "RG_networking-westeurope"
    vnet_name             = "VNET_WE_DLW_VPN"
    subnet_name           = "frontend"
  
    depends_on =  [
      #module.ansible-setup-local
    ]
    owner                 = var.owner
    environment           = var.environment
}

output "viki-mgmt02-pvt-ip" {
    value                 = module.viki-vm.network_interface_private_ip
}

#-----------------------------------------------
# Generate ansible inventory file
#-----------------------------------------------
resource "local_file" "ansible-inventory" {
    content = templatefile("./tf-templates/ansible-inventory.tmpl",
    {
        private-ip = module.viki-vm.network_interface_private_ip[0],
        vm-name    = "viki-mgmt02"
    }
    )
    filename = "./ansible-nginx-setup/ansible-inventory"
    depends_on =  [
      module.viki-vm
    ]
}

#-----------------------------------------------
# Execute ansible playbook
#-----------------------------------------------
resource "null_resource" "run-ansible-playbook" {
  
  provisioner "local-exec" {
    command     = "ansible-playbook main-playbook.yml"
    working_dir = "./ansible-nginx-setup"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on =  [
    local_file.ansible-inventory
  ]
}