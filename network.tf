#Subnets Definition- Both Public and Private subnet#
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.ca_vpc.id
  cidr_block              = var.public_subnet_cidr
 
 

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.ca_vpc.id
  cidr_block        = var.private_subnet_cidr

  tags = {
    Name = "private-subnet"
  }
}

#Create route tables for public subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.ca_vpc.id # link to the VPC

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}
# link subnet to the route table#
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id # Subnet to link
  route_table_id = aws_route_table.public_rt.id # route table to use
}


# Internet Gateway to allow outbound traffic for the public subnet#

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ca_vpc.id

  tags = {
    Name = "main-internet-gateway"
  }
}
