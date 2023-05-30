locals {
  ssh_user         = "ubuntu"
  key_name         = "devops"
  private_key_path = "~/.ssh/id_rsa"
}
data "aws_ami" "latest_ubuntu" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = var.instance-type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = local.key_name
    
  tags = var.instance-name

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(local.private_key_path)
      host        = aws_instance.web.public_ip
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook  -i ${aws_instance.web.public_ip}, --private-key ${local.private_key_path} ./ansible/manifest.yml"
  }

}

