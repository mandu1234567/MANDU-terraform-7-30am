output "AMI" {
  value = aws_instance.name.id
}
output "PublicIP" {
  value = aws_instance.name.public_ip
}
output "PrivateIP" {
  value = aws_instance.name.private_ip
}
