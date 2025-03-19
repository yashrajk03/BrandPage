provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH traffic"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with your IP for better security (e.g., "your-ip/32")
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_sg.name]
  user_data = <<-EOF
              #!/bin/bash
              # Update the system
              yum update -y
              # Install Apache
              yum install httpd -y
              # Start and enable Apache
              systemctl start httpd
              systemctl enable httpd
              # Install Git
              yum install git -y
              # Clone the BrandPage repository
              git clone https://github.com/yashrajk03/BrandPage.git /tmp/BrandPage
              # Copy the website files to Apache's web directory
              cp -r /tmp/BrandPage/* /var/www/html/
              # Set permissions
              chown -R apache:apache /var/www/html
              chmod -R 755 /var/www/html
              # Clean up
              rm -rf /tmp/BrandPage
              EOF
  tags = {
    Name = "BrandPage-Web-Server"
  }
}

output "instance_ip" {
  value = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}
