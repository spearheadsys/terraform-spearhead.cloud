resource "triton_machine" "kube_nodes" {
  count                = var.number_of_kube_nodes
  name                 = format("kube-node-%s", count.index)
  package              = "hvm-2cpu-4ram-100disk"
  image                = "${data.triton_image.base_image.id}"
  firewall_enabled     = true

  cloud_config = data.template_file.cloud_init.rendered

  tags = {
    kube_node = "true"
  }

  cns {
    services = ["kube-api", "ghost-blog"]
  }

  affinity = ["kube_node!=~true"]
}

resource "ansible_host" "kube_nodes" {
  count              = var.number_of_kube_nodes
  inventory_hostname = element(resource.triton_machine.kube_nodes.*.name, count.index)
  groups             = [ "kube_control_plane", "kube_node", "etcd" ]

  vars               = {
    ansible_user     = "ubuntu"
    ansible_ssh_host = element(resource.triton_machine.kube_nodes.*.primaryip, count.index)
    ip               = element(element(resource.triton_machine.kube_nodes.*.ips, count.index), 1)
  }
}

resource "ansible_group" "k8s_cluster" {
  inventory_group_name = "k8s_cluster"
  children = [ "kube_control_plane", "kube_node", "etcd" ]
}
