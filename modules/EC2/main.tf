
data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu-minimal/images/hvm-ssd/ubuntu-bionic-18.04-amd64-minimal*"]
  }
}

resource "aws_instance" "myEC2" {
  ami             = data.aws_ami.app_ami.id
  instance_type   = var.instancetype
  key_name        = "adda-devops"
  tags            = var.aws_common_tag
  security_groups = ["${var.sg_group}"]
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update && sudo apt-get install -y nginx ",
      "sudo systemctl start nginx ",
      "sudo systemctl enable nginx "
    ]
    }
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("./adda-devops.pem")
    host     = self.public_ip
  }
}

