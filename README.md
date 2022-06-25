Moved : https://code.spearhead.cloud/Spearhead/terraform-spearhead.cloud/settings

# Terraform resources
Terraform templates and other resources/examples for use with spearhead.coud or 
other triton providers.

In the terraform directory you will find some templates to help get you started.
Remove the tpl extension and modify to your liking.


# Examples
## Provision a vm 
<pre>
$ git clone https://github.com/spearheadsys/terraform-spearhead.cloud.git
</pre>
### edit the main.tf file
<pre>
terraform {
  required_providers {
    triton = {
      source = "joyent/triton"
      version = "0.8.2"
    }
  }
}

provider "triton" {
    account = "<mark>username</mark>"
    key_id  = "<mark>key:id</mark>"
    url = "https://eu-ro-1.api.spearhead.cloud"
    key_material = "<mark>/path/to/id_rsa</mark>"
    insecure_skip_tls_verify = false
}

resource "triton_machine" "<mark>internal_resource_name</mark>" {
  // customize these if you need to create multiple instances
  // comment our the count if you need just one
  // remove the variable count.index from the name if so
  <mark>count   = var.instance_count</mark>
  <mark>name    = "linux-${count.index + 1}"</mark>
  package = "standard-2cpu-4ram-100disk"
  // choose on image (lx, hvm or smartos)
  image   = "b70d5484-5168-4ecb-8127-0a0c59c1d906"

/*
// Use these (provisioner file and remote-exec if you would like to 
// further customize or run specific commands once the instance 
// is provisioned

  provisioner "file" {
    source = "scripts/setup.sh"
    destination = "/var/tmp/setup.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "bash /var/tmp/setup.sh",
    ]
  }
*/

  connection {
    type = "ssh"
    host = self.primaryip
    user = "ubuntu"
  }

/*
// use this to configure the Container Namer Service within triton and access
// your system(s) via a service name/tag defined in the variables.tf file
// you would then be able to access your system(s) via dns. For more details see
// [this](http://docs.spearhead.cloud/dns/)

  cns {
        services = ["${var.service_name}"]
  }
*/
}
</pre>

## Provision using terraform(hvm bhyve ubuntu 20.04.03)
<pre>
$ terraform init
$ terraform plan
$ terraform apply
</pre>


## Creating images with Packer
coming soon...
