# Create a server
resource "hcloud_ssh_key" "default" {
  name       = var.hcloud_ssh_key_name
  public_key = file(var.hcloud_ssh_key_public_key_path)
}

resource "hcloud_server" "node" {
  count = var.hcloud_server_instances
  name  = "node${format("%02d", count.index + 1)}"
  # name        = "node01"
  image       = var.hcloud_server_image
  server_type = var.hcloud_server_server_type
  datacenter  = var.hcloud_server_datacenter
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels      = var.hcloud_server_labels
  public_net {
    ipv4_enabled = var.hcloud_server_public_net_ipv4_enabled
    ipv6_enabled = var.hcloud_server_public_net_ipv6_enabled
  }
  user_data = file(var.hcloud_server_user_data_path)
}
