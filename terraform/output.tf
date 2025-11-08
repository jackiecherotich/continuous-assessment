# To see results after deployment of VPC and Ec2 Instance #
#SSH Keys#
output "ec2_instance_key_pem" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}
# Output the Elastic Ip of the EC2 Instances #
output "web_instance_elastic_ip" {
  value       = aws_eip.server_eip.public_ip
}
