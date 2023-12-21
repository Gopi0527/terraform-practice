
resource "aws_vpc" "first" {
  cidr_block = var.vpc_cidr
  tags = {
    name = "my_vpc"
  }

}
resource "aws_subnet" "subnets" {
  vpc_id     = aws_vpc.first.id
  count = length(var.subnet_names)
  cidr_block = cidrsubnet(var.vpc_cidr,8,count.index)
  tags = {
    Name = var.subnet_names[count.index]
  }
  depends_on = [aws_vpc.first]
}
