# outputs.tf

output "rhel9_instance_id" {
  description = "ID of the RHEL9 instance"
  value       = aws_instance.rhel9.id
}

output "rhel9_public_ip" {
  description = "Public IP of the RHEL9 instance"
  value       = aws_instance.rhel9.public_ip
}

output "debian_instance_id" {
  description = "ID of the Debian instance"
  value       = aws_instance.debian.id
}

output "debian_public_ip" {
  description = "Public IP of the Debian instance"
  value       = aws_instance.debian.public_ip
}

output "ubuntu_instance_id" {
  description = "ID of the Ubuntu instance"
  value       = aws_instance.ubuntu.id
}

output "ubuntu_public_ip" {
  description = "Public IP of the Ubuntu instance"
  value       = aws_instance.ubuntu.public_ip
}
