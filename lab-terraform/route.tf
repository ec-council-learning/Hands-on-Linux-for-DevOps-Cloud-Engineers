# create a custom route table for public subnets
resource "aws_route_table" "lab-public-crt" {
  vpc_id = aws_vpc.lab-vpc.id
  route {
    cidr_block = "0.0.0.0/0" //subnets can connect everywhere
    gateway_id = aws_internet_gateway.lab-igw.id
  }

  tags = {
    Name = "lab-public-crt"
  }
}

# route table association for the public subnets
resource "aws_route_table_association" "lab-crta-public-subnet-1" {
  subnet_id      = aws_subnet.lab-subnet-public-1.id
  route_table_id = aws_route_table.lab-public-crt.id
}
