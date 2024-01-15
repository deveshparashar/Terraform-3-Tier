module "ec2_private_app2" {

  depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.2.1"
  
  for_each = local.multiple_instances

  name = "${local.name}-private-${each.key}-app2"
  ami = data.aws_ami.amzlinux2.id
  key_name = var.instance_keypair

  instance_type          = each.value.instance_type
  availability_zone      = each.value.availability_zone
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = [module.private_sg.security_group_id]

  user_data = file("${path.module}/app2-install.sh")

  tags = local.common_tags  
}