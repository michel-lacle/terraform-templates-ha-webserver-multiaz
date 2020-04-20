resource "aws_lb" "test" {
  name               = "${var.project}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.ec2-sg-web.id}"]
  subnets            = ["${aws_subnet.template-public.*.id}"]

  enable_deletion_protection = false

  tags = {
    Project = var.project
  }
}
