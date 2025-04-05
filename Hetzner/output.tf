output "node_status" {
  value = {
    for node in hcloud_server.node :
    node.name => node.status
  }
}

output "node_ips" {
  value = {
    for node in hcloud_server.node :
    node.name => node.ipv4_address
  }
}
