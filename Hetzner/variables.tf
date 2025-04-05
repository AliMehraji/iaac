# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
  default     = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "hcloud_ssh_key_name" {
  description = "SSH Public Key Name"
  type        = string
  default     = "default"
}

variable "hcloud_ssh_key_public_key_path" {
  description = "SSH Public Key Path"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "hcloud_server_instances" {
  description = "Number of instance to be created"
  type        = number
  default     = 3
}

variable "hcloud_server_prefix" {
  description = "Prefix for all servers name"
  type        = string
  default     = "node"
}

variable "hcloud_server_image" {
  description = "OS image"
  type        = string
  default     = "ubuntu-22.04"
}

variable "hcloud_server_server_type" {
  description = "Hetzner Server Type"
  type        = string
  default     = "cx22"
}

variable "hcloud_server_datacenter" {
  description = "Hetzner Server DataCenter"
  type        = string
  default     = "fsn1-dc14"
}

variable "hcloud_server_labels" {
  description = "Hetzner Server Labels"
  type        = map(string)
  default = {
    created_by = "terraform"
  }
}

variable "hcloud_server_public_net_ipv4_enabled" {
  description = "state of public ipv4 enabled/disabled"
  type        = bool
  default     = true
}

variable "hcloud_server_public_net_ipv6_enabled" {
  description = "state of public ipv6 enabled/disabled"
  type        = bool
  default     = true
}

variable "hcloud_server_cloud_init_file" {
  description = "Cloud Init (user-data) Path"
  type        = string
  default     = "cloud-init.yaml"
  sensitive   = true
}
