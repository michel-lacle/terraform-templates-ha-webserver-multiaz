output "alb_dns_name" {
  value = aws_lb.multi-instance-lb.dns_name
}