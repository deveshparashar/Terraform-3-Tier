# ACM Module - To create and verify SSL Certificates

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.3.2"

# we need to get rid of a '.' after domain like .com. when we use an INTERNAL domain from datasource

  domain_name = trimsuffix(data.aws_route53_zone.mydomain.name, ".") # when need to remove INTERNal Domain we need to add '.' in domain
  zone_id     = data.aws_route53_zone.mydomain.zone_id


/* 

    by using '*.' whatever domain we create like

    app1.deveshdevops.com
    app2.deveshdevops.com

    the created SSL sertificate will be applicable to my SSL certificate

 */


  subject_alternative_names = [
    "*.deveshdevops.com",
    
  ]

  tags = local.common_tags

}


/* Output ACM Certificate ARN */

output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}
