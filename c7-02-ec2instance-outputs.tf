/* # AWS EC2 Instance Terraform Outputs */


/* # Public EC2 Instances - Bastion Host */

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_id" {
  description = "The ID of the instance"
  value       = module.ec2_public.id
}

## ec2_bastion_public_ip
output "ec2_bastion_instance__public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_public.public_ip
}


/* # Private EC2 Instances for APP1 */


## ec2_private_instance_ids
# instance 1st id

output "app1_ec2_private_instance_1_id" {
  description = "The ID of the instance"
  value       = module.ec2_private_app1["one"].id
}

## ec2_private_ip
# instance 1st ip
output "app1_ec2_private_instance_1_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_private_app1["one"].private_ip
}

## ec2_private_instance_ids
# instance 1st id

output "app1_ec2_private_instance_2_id" {
  description = "The ID of the instance"
  value       = module.ec2_private_app1["two"].id
}

## ec2_private_ip
# instance 1st ip
output "app1_ec2_private_instance_2_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_private_app1["two"].private_ip
}


/* # Private EC2 Instances for APP2 */


## ec2_private_instance_ids
# instance 1st id

output "app2_ec2_private_instance_1_id" {
  description = "The ID of the instance"
  value       = module.ec2_private_app2["one"].id
}

## ec2_private_ip
# instance 1st ip
output "app2_ec2_private_instance_1_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_private_app2["one"].private_ip
}

## ec2_private_instance_ids
# instance 1st id

output "app2_ec2_private_instance_2_id" {
  description = "The ID of the instance"
  value       = module.ec2_private_app2["two"].id
}

## ec2_private_ip
# instance 1st ip
output "app2_ec2_private_instance_2_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_private_app2["two"].private_ip
}

