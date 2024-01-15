module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.2.1"
  
  name = "${var.environment}-BastionHost"

  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  monitoring             = true
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  ami = data.aws_ami.amzlinux2.id
  subnet_id              = module.vpc.public_subnets[0]

  tags = local.common_tags

}