
# Find the latest Ubuntu 24.04 LTS AMI

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name = "name"

    values = [
      "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
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

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}


# Kubernetes control-plane EC2 instances

resource "aws_instance" "control_plane" {
  for_each = var.private_subnet_ids

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.control_plane_instance_type

  subnet_id = each.value

  vpc_security_group_ids = [
    var.control_plane_sg_id
  ]

  iam_instance_profile = var.instance_profile_name

  associate_public_ip_address = false

  root_block_device {
    volume_size           = var.control_plane_volume_size
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  ebs_optimized = true

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-control-plane-${each.key}"
    Role = "control-plane"
    AZ   = each.key
  })
}


# Kubernetes worker EC2 instances

resource "aws_instance" "worker" {
  for_each = var.private_subnet_ids

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.worker_instance_type

  subnet_id = each.value

  vpc_security_group_ids = [
    var.worker_sg_id
  ]

  iam_instance_profile = var.instance_profile_name

  associate_public_ip_address = false

  root_block_device {
    volume_size           = var.worker_volume_size
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  ebs_optimized = true

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-worker-${each.key}"
    Role = "worker"
    AZ   = each.key
  })
}
