resource "aws_instance" "jenkins" {
  ami                    = data.aws_ami.amazon_linux
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  user_data = templatefile("${path.module}/../../templates/jenkins-install.sh", {
  })

  tags = { Name = "jenkins-server" }
}
