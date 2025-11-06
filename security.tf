#SSH Key pair #
resource "aws_key_pair" "ssh_key" {
  key_name   = var.key.name
  public_key = file(var.key.path)
}


# Defining the Security groups configurations#
resource "aws_security_group" "web_sg" {
  name        = "webserver-security_group"
  description = "Allow HTTP, HTTPS, SSH"
  vpc_id      = aws_vpc.ca_vpc.id

ingress {
    description = "Allow port 22 inbound for SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks =["::/0"]
}


ingress {
    description = "Allow port 80 inbound for http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks =["::/0"]
}

ingress {
    description = "Allow port 443 inbound for HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks =["::/0"]
}     

ingress {
    description = "Allow port 8080 inbound for Server"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks =["::/0"]
}

egress {
    description = "Allow all traffic out of the instance "
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks =["::/0"]
}

  tags = { 
    Name = "webserver-security-group" }
}
