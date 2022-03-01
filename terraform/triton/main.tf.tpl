terraform {
  required_providers {
    triton = {
      source = "joyent/triton"
      version = "0.8.2"
    }
  }
}

provider "triton" {
    account = "username"
    key_id  = "key:id"
    url = "https://eu-ro-1.api.spearhead.cloud"
    key_material = "/path/to/id_rsa"
    insecure_skip_tls_verify = false
}

resource "triton_machine" "internal_resource_name" {
  count   = var.instance_count
  name    = "linux-${count.index + 1}"
  package = "standard-2cpu-4ram-100disk"
  image   = "b70d5484-5168-4ecb-8127-0a0c59c1d906"

  provisioner "file" {
    source = "scripts/setup.sh"
    destination = "/var/tmp/setup.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "bash /var/tmp/setup.sh",
    ]
  }

  connection {
    type = "ssh"
    host = self.primaryip
    user = "ubuntu"
  }

  cns {
	services = ["${var.service_name}"]
  }

}

