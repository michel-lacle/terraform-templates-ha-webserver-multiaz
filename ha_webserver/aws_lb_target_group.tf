resource "aws_lb_target_group" "multi-instance_tg" {
  name     = "multi-instance-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.template-vpc.id
}


resource "aws_lb_listener" "multi-instance-listener" {
  load_balancer_arn = aws_lb.multi-instance-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.multi-instance_tg.arn}"
  }
}