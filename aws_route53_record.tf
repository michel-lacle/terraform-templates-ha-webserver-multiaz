resource "aws_route53_record" "multi-instance" {
  zone_id = data.aws_route53_zone.f1kart-zone.zone_id
  name    = "multi-instance.f1kart.com"
  type    = "A"

  alias {
    name                   = module.ha-multi-instance.alb_dns_name
    zone_id                = module.ha-multi-instance.alb_zone_id
    evaluate_target_health = true
  }
}