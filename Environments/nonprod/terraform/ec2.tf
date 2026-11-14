data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name = "name"

    values = [
      "ubuntu/images/hvm-ssd*/ubuntu-noble-24.04-amd64-server-*"
    ]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
locals {
  kubernetes_nodes = {
    control-plane = {
      subnet_index = 0
      private_ip   = "10.20.1.10"
      role         = "control-plane"
    }

    worker-1 = {
      subnet_index = 1
      private_ip   = "10.20.2.10"
      role         = "worker"
    }

    worker-2 = {
      subnet_index = 2
      private_ip   = "10.20.3.10"
      role         = "worker"
    }
  }
}

resource "aws_instance" "nodes" {
  for_each = local.kubernetes_nodes

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public[
    tostring(each.value.subnet_index)
  ].id

  private_ip = each.value.private_ip

  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.k8s_nodes.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2_ssm_profile.name

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "${var.project_name}-${each.key}"
    Role = each.value.role
  }
}

# Allocate a stable public IP for the Control Plane

resource "aws_eip" "control_plane" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-control-plane-eip"
  }
}

resource "aws_eip_association" "control_plane" {
  instance_id   = aws_instance.nodes["control-plane"].id
  allocation_id = aws_eip.control_plane.id
}