output "instance_ip" {
  value = aws_instance.web.public_ip
}

output "ami_id" {
  value = data.aws_ami.latest_ubuntu.id
}