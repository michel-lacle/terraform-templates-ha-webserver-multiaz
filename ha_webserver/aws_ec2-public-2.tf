resource "aws_security_group" "ec2-sg-webserver-2" {
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

resource "aws_instance" "public-ec2-webserver-2" {
  ami = var.ami_id
  instance_type = "t2.micro"

  # this is optional, but needed if you want to ssh into your ec2 instance
  # here I have manually created a key pair in the console and I'm supplying the
  # name.
  #key_name = "terraform-templates-vpc"

  user_data = file(var.user_data_2)

  vpc_security_group_ids = [
    aws_security_group.ec2-sg-webserver-2.id]

  subnet_id = aws_subnet.template-public.id

  tags = {
    Name = "${var.project}-public-ec2-webserver"
    Project = var.project
  }
}