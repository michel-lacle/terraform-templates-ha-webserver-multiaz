resource "aws_security_group" "ec2-sg-web" {
  name = "ec2-public-webserver-sg"
  description = "Allow ssh & http inbound traffic"
  vpc_id = aws_vpc.template-vpc.id

  ingress {
    description = "TLS from VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    description = "http traffic"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-public-webserver-sg"
    Project = var.project
  }
}