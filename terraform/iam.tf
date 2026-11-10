# EC2 IAM role

resource "aws_iam_role" "ec2_ssm_role" {
  name = "${var.project_name}-ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Service = "ec2.amazonaws.com"
      }

      Action = "sts:AssumeRole"
    }]
  })
}

# Attach SSM managed policy

resource "aws_iam_role_policy_attachment" "ssm" {
  role = aws_iam_role.ec2_ssm_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Create instance profile

resource "aws_iam_instance_profile" "ec2_ssm_profile" {
  name = "${var.project_name}-ec2-ssm-profile"

  role = aws_iam_role.ec2_ssm_role.name
}