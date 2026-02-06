provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "server" {
  ami           = "ami-0e7a5785ab62399cb"
  instance_type = "c7i-flex.large"
  key_name      = "keyaws"

  tags = {
    Name = "terraform-server"
  }

  vpc_security_group_ids = [
    aws_security_group.server_sg.id
  ]
}

resource "aws_instance" "server-small" {
  ami           = "ami-0e7a5785ab62399cb"
  instance_type = "t3.small"
  key_name      = "keyaws"

  tags = {
    Name = "terraform-server-small"
  }

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]
}

resource "aws_instance" "k8s_master" {
  ami           = "ami-0e7a5785ab62399cb"
  instance_type = "t3.small"
  key_name      = "keyaws"

  vpc_security_group_ids = [
    aws_security_group.allow_all.id
  ]

  tags = {
    Name = "k8s-master"
    Role = "master"
  }
}

resource "aws_instance" "k8s_worker" {
  count         = 2
  ami           = "ami-0e7a5785ab62399cb"
  instance_type = "t3.small"
  key_name      = "keyaws"

  vpc_security_group_ids = [
    aws_security_group.allow_all.id
  ]

  tags = {
    Name = "k8s-worker-${count.index + 1}"
    Role = "worker"
  }
}


output "public_ips" {
  value = {
    server       = aws_instance.server.public_ip
    server_small = aws_instance.server-small.public_ip
  }
}

output "k8s_public_ips" {
  value = {
    master  = aws_instance.k8s_master.public_ip
    worker  = aws_instance.k8s_worker[*].public_ip
  }
}
