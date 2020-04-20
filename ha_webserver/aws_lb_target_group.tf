resource "aws_lb_target_group" "multi-instance_tg" {
  name     = "multi-instance-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.template-vpc.id
}
