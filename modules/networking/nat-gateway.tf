
resource "aws_eip" "nat" {
  for_each = local.az_config

  domain = "vpc"

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-nat-eip-${each.key}"
  })
}


resource "aws_nat_gateway" "main" {
  for_each = local.az_config

  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = aws_subnet.public[each.key].id

  depends_on = [
    aws_internet_gateway.main
  ]

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-nat-${each.key}"
  })
}
