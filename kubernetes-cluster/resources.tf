data "triton_image" "base_image" {
  name    =  var.image_name
  # "ubuntu-20.04.04"
  version =  var.image_version
  "20220405.02"
}
