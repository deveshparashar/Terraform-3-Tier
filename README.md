# Terraform-3-Tier
deploying an App using Terraform where terraform code will create a 3-tier VPC architecture i.e. Tier-1 which is in Public subnet having Application Load Balancer a Bastion EC2 and NAT gatewate, Tier-2 : Private Subnet  (2 EC2 instance are present: used for load balancing) . Tier-3 : Private Subnet where Database for that application can be stored
