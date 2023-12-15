
resource "aws_vpc" "first" {
  cidr_block = "10.10.0.0/16"
  tags = {
    name = "my_vpc"
  }

}