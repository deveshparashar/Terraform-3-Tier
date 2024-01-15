# DNS Registration

resource "aws_route53_record" "apps_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "deveshdevops.com"
  type    = "A"


#   ttl     = 300   # ttl is required for NON-Alias records
  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "apps_dns-www" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "www.deveshdevops.com"
  type    = "A"


#   ttl     = 300   # ttl is required for NON-Alias records
  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}
