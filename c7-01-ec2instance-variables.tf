variable "instance_type" {
    description = "EC2 instance Type"
    type = string
    default = "t2.micro"
}

variable "instance_keypair" {
    description = "EC2 instance Type"
    type = string
    default = "linuxPEMfile"
}

variable "private_instance_count" {
    description = "AWS EC2 Private instance Count"
    type = number
    default = 1
  
}

