output "alb_dns_name" {
  value = aws_lb.multi-instance-lb.dns_name
}

output "alb_zone_id" {
  value = aws_lb.multi-instance-lb.zone_id
}