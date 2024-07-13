output "ec2-details" {
  value = {
    instance_ip = aws_instance.ec2.public_ip
  }
}