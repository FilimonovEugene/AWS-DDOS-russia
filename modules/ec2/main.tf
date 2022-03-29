locals {
  ssh_key_name = "ssh-key"
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = local.ssh_key_name
  public_key = "${tls_private_key.pk.public_key_openssh}"
}

resource "aws_security_group" "grant_ssh" {
  name        = "grant_ssh"
  description = "grant_ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "ec2" {
  source            = "./modules/ec2"
  count             = var.instance_count
  instance_type     = var.instance_type
  ami_id            = data.aws_ami.ubuntu.id
  private_key_pem   = tls_private_key.pk.private_key_pem
  ssh_key_name      = aws_key_pair.kp.key_name
  security_group_id = aws_security_group.grant_ssh.id
}

resource "local_file" "private_key" {
    content  = tls_private_key.pk.private_key_pem
    filename = "${local.ssh_key_name}.pem"
}