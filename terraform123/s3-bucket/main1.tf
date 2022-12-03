provider "aws" {
  region = "ap-south-1"
  access_key = "AKIASBDEDVLNHJ3OSCPM"
  secret_key = "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"
}
resource "aws_security_group" "https_server_sg" {
  name = "https_server_sg"
  vpc_id = "vpc-0bacc0924135da0a2"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "https_server" {
  ami = "ami-074dc0a6f6c764218"
  key_name = "vasundhara"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.https_server_sg.id]
  subnet_id = "subnet-037866570e01446ec"

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file(var.aws_key_pair)
  }
}
  

