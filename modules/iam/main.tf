
resource "aws_iam_role" "k8s_node_role" {
  name = "${var.name_prefix}-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-node-role"
  })
}


resource "aws_iam_role_policy_attachment" "ssm_core" {
  role = aws_iam_role.k8s_node_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}


resource "aws_iam_instance_profile" "k8s_node_profile" {
  name = "${var.name_prefix}-node-profile"

  role = aws_iam_role.k8s_node_role.name

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-node-profile"
  })
}

