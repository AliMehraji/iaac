# main.tf
terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.8.1"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

# Define base volumes for different OS images
resource "libvirt_volume" "base_volumes" {
  for_each = var.os_images
  name     = "${each.key}-base"
  source   = each.value.image_path
  pool     = "default"
}

# Create VM volumes from base images
resource "libvirt_volume" "vm_volumes" {
  for_each       = var.os_images
  name           = "${each.key}-volume"
  base_volume_id = libvirt_volume.base_volumes[each.key].id
  pool           = "default"
  size           = each.value.disk_size
}

# Cloud-init configs for each OS
resource "libvirt_cloudinit_disk" "cloudinit" {
  for_each = var.os_images
  name     = "cloudinit-${each.key}.iso"
  user_data = templatefile("${path.module}/${each.key}.cfg", {
    hostname = each.key
    username = var.vm_username
    ssh_key  = var.ssh_public_key
    password = var.vm_password
  })
  pool = "default"
}

# Create the VMs
resource "libvirt_domain" "vm" {
  for_each = var.os_images
  name     = each.key
  memory   = each.value.memory
  vcpu     = each.value.vcpu

  cloudinit = libvirt_cloudinit_disk.cloudinit[each.key].id

  network_interface {
    network_name   = "terraform-network"
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.vm_volumes[each.key].id
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }


}

# Output IP addresses
output "vm_ips" {
  value = {
    for key, vm in libvirt_domain.vm :
    key => vm.network_interface[0].addresses
  }
  description = "The IP addresses of the created VMs"
}

