# output "node01_instance_id" {
#   description = "ID of the node01 instance"
#   value       = hcloud_server.node01.id
# }

# output "node01_public_ip" {
#   description = "Public IP of the node01 instance"
#   value       = hcloud_server.node01.ipv4_address
# }

output "node_public_ips" {
  description = "Public IPs of all node instances"
  value = [for i in range(3) : {
    name = "node${format("%02d", i + 1)}"
    ip   = hcloud_server.node[i].ipv4_address
  }]
}
