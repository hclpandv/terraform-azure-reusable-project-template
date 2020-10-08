variable "msg" {
  type = string
  description = "Message to Display for testing"
  default     = "Hello World!!"
}

output "msg" {
    value = var.msg
}

# Output a file content
output "file_content" {
    value = file("${path.module}/files/hello.txt")
}

#-------------------------------------------------
# Output system variables
#-------------------------------------------------
output "tf_wrsp" {
    description =  "refer https://www.terraform.io/docs/state/workspaces.html"
    value       = terraform.workspace
}

output "module_dir" {
    value = path.module
}

output "root_dir" {
    value = path.root
}

output "curr_dir" {
    value = path.cwd
}