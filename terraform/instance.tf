
# Custom VPC Provisioning #
resource "aws_vpc" "ca_vpc" {
  cidr_block       =  var.vpc_cidr

  tags = {
    Name = "custom-vpc"

  }
  # lifecycle {
  #   prevent_destroy = true
  # }
}
# EC2 Instance under Custom VPC

resource "aws_instance" "server_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = var.key_name
  #count                  = var.instance_count

  tags = { Name = "webserver-instance" }
}

# Allocate Elastic IP and attach to each EC2 instance
resource "aws_eip" "server_eip" {
  instance = aws_instance.server_instance.id
       

  tags = { Name = "webserver-elastic-ip" }
}

# # Generate Ansible inventory 
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/ansible/inventory.tpl", {
    instance_ip = aws_eip.server_eip.public_ip
    key_path = "/home/precious/ssh-keys/ec2-instance-key.pem"
  })
  filename = "../ansible/inventory.ini"
}   