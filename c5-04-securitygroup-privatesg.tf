module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "private_sg"
  description = "Security Group with http & SSH port open for enire vpc block(10.0.0.0/16), egress ports are all world open"
  vpc_id      = module.vpc.vpc_id

  # ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp","http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]  # ingress cidr block

  # egress Rules -all-all open
  egress_rules = ["all-all"]
  tags         = local.common_tags
}
