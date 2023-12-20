
resource "aws_vpc" "first" {
  cidr_block = "10.10.0.0/16"
  tags = {
    name = "my_vpc"
  }

}
resource "aws_subnet" "web" {
  vpc_id     = aws_vpc.first.id
  cidr_block = "10.10.0.0/24"
  tags = {
    Name = "web"
  }
  depends_on = [aws_vpc.first]

}
resource "aws_subnet" "business" {
  vpc_id     = aws_vpc.first.id
  cidr_block = "10.10.1.0/24"
  tags = {
    Name = "business"
  }
  depends_on = [aws_vpc.first]

}
resource "aws_subnet" "data" {
  vpc_id     = aws_vpc.first.id
  cidr_block = "10.10.2.0/24"
  tags = {
    Name = "data"
  }
  depends_on = [aws_vpc.first]

}