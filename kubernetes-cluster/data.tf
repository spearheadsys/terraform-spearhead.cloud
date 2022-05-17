data "template_file" "cloud_init" {
  template = file("${path.module}/templates/cloud-init.yml")
}
