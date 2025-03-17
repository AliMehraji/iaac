# main.tf
resource "aws_security_group" "linux_instances_sg" {
  name        = "linux-instances-sg"
  description = "Security group for Linux instances"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = merge(
    var.common_tags,
    {
      Name = "linux-instances-sg"
    }
  )
}


# RHEL9
resource "aws_instance" "rhel9" {
  ami                    = var.rhel9_ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.linux_instances_sg.id]

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = merge(
    var.common_tags,
    {
      Name = "rhel9-instance"
      OS   = "rhel9"
    }
  )
}

# Debian
resource "aws_instance" "debian" {
  ami                    = var.debian_ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.linux_instances_sg.id]

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = merge(
    var.common_tags,
    {
      Name = "debian-instance"
      OS   = "Debian"
    }
  )
}

# Ubuntu
resource "aws_instance" "ubuntu" {
  ami                    = var.ubuntu_ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.linux_instances_sg.id]

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = merge(
    var.common_tags,
    {
      Name = "ubuntu-instance"
      OS   = "Ubuntu"
    }
  )
}
