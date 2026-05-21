provider "aws" {
  region = var.region
}

# Get Amazon Linux
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}


# Security Group
resource "aws_security_group" "web_sg" {
  name = "apb-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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


# S3 Bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
  tags = { Name = "cicd-bucket" }
}


# EC2
resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

# 👇 Install Apache + Website
 user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "my-web-server"
  }
}



