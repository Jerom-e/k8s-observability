resource "null_resource" "monitoring" {
  provisioner "local-exec" {
    command = "bash ./sh/deploy-monitoring.sh"
  }
}
