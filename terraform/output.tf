# To see results after deployment of VPC and Ec2 Instance #
# Output the Elastic Ip of the EC2 Instances #
output "web_instance_elastic_ip" {
  value       = aws_eip.server_eip.public_ip
}


