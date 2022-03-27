resource "aws_instance" "fighter" {
  ami                         = var.ami_id
  monitoring                  = true
  instance_type               = var.instance_type
  key_name                    = var.ssh_key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${var.security_group_id}"]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    private_key = "${var.private_key_pem}"
    timeout     = "10m"
  }

  provisioner "remote-exec" {
    script = "${path.module}/provisioning.sh"
  }
}