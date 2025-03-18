provider "aws" {
  region = "us-east-1"  # Change to your preferred region (e.g., us-west-2, eu-west-1)
}

resource "aws_instance" "example" {
  ami           = "ami-08b5b3a93ed654d19"  # Amazon Linux 2 AMI for us-east-1; verify for your region
  instance_type = "t2.micro"               # Free-tier eligible
  tags = {
    Name = "Terraform-Jenkins-Example"
  }
}

output "instance_ip" {
  value = aws_instance.example.public_ip
}