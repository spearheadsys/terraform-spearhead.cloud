resource "triton_firewall_rule" "allow_ssh" {
  description = "Allow ssh traffic on port tcp/22 to all machines."
  rule        = "FROM any TO all vms ALLOW tcp PORT 22"
  enabled     = true
}

resource "triton_firewall_rule" "allow_http" {
  description = "Allow http traffic on port tcp/80 to all machines."
  rule        = "FROM any TO tag \"kube_node\" ALLOW tcp PORT 80"
  enabled     = true
}

resource "triton_firewall_rule" "allow_https" {
  description = "Allow https traffic on port tcp/443 to all machines."
  rule        = "FROM any TO tag \"kube_node\" ALLOW tcp PORT 443"
  enabled     = true
}

resource "triton_firewall_rule" "allow_kube_proxy" {
  description = "Allow kube_proxy traffic on port tcp/10250 to all machines."
  rule        = "FROM any TO tag \"kube_node\" ALLOW tcp PORT 10250"
  enabled     = true
}

resource "triton_firewall_rule" "allow_kube_api" {
  description = "Allow kube-api traffic on port tcp/6443 to all kube_node machines."
  rule        = "FROM any TO all vms ALLOW tcp PORT 6443"
  enabled     = true
}


# resource "triton_firewall_rule" "allow_etcd_api" {
#   description = "Allow kube-api traffic on port tcp/2380 to all kube_node machines."
#   rule        = "FROM any TO tag \"kube_node\" ALLOW tcp PORT 2380"
#   enabled     = true
# }

# resource "triton_firewall_rule" "allow_etcd_api_2" {
#   description = "Allow kube-api traffic on port tcp/2379 to all kube_node machines."
#   rule        = "FROM any TO tag \"kube_node\" ALLOW tcp PORT 2379"
#   enabled     = true
# }

# resource "triton_firewall_rule" "allow_calico_vxlan" {
#   description = "Allow vxlan traffic on port udp/47809 to all kube_node machines."
#   rule        = "FROM tag \"kube_node\" TO tag \"kube_node\" ALLOW udp PORT 4789"
#   enabled     = true
#}

resource "triton_firewall_rule" "allow_internal_udp" {
  description = "Allow udp internal traffic between all kube_node machines."
  rule        = "FROM tag \"kube_node\" TO tag \"kube_node\" ALLOW udp PORT all"
  enabled     = true
}

resource "triton_firewall_rule" "allow_internal_tcp" {
  description = "Allow tcp internal traffic between all kube_node machines."
  rule        = "FROM tag \"kube_node\" TO tag \"kube_node\" ALLOW tcp PORT all"
  enabled     = true
}

resource "triton_firewall_rule" "allow_internal_icmp" {
  description = "Allow icmp internal traffic between all kube_node machines."
  rule        = "FROM tag \"kube_node\" TO tag \"kube_node\" ALLOW icmp TYPE 8 CODE 0"
  enabled     = true
}

