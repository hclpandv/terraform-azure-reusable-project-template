resource "null_resource" "install-ansible" {
  
  provisioner "local-exec" {
    # Call Script here
    command = "${path.module}/scripts/install-ansible.sh"
  }
}

resource "null_resource" "check-ansible-version" {
  
  provisioner "local-exec" {
    # Call Script here
    command = "ansible --version"
  }

  depends_on =  [
    null_resource.install-ansible
  ]
}