provider "triton" {
  account = var.spearhead_account
  key_id  = var.spearhead_key_id
  key_material = var.spearhead_key_material

  # If using a private installation of Triton, specify the URL, otherwise
  # set the URL according to the region you wish to provision.
  url = "https://eu-ro-1.api.spearhead.cloud"

  # If using a test Triton installation (self-signed certifcate), use:
  insecure_skip_tls_verify = false
}

provider "ansible" {
}
