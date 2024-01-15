module "loadbalancer_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "loadbalancer_sg"
  description = "Security Group with HTTP port open for enire internet, egress ports are all world open"
  vpc_id      = module.vpc.vpc_id

  # ingress Rules & CIDR Blocks
  ingress_rules       = ["http-80-tcp","https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]  # ingress cidr block

  # egress Rules -all-all open
  egress_rules = ["all-all"]

  ingress_with_cidr_blocks = [
  {
    from_port   = 81
    to_port     = 81
    protocol    = 6
    description = "allow port 81 from internet using custom protocol Security Group Ingress rule"
    cidr_blocks = "0.0.0.0/0"
  },
  ]

  tags         = local.common_tags
}
