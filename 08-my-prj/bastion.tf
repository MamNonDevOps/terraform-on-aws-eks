# module "ec2_public" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "3.3.0"

#   name          = "${var.project}-BastionHost"
#   ami           = data.aws_ami.amzlinux2.id
#   instance_type = "t3.micro"
#   key_name      = var.ssh_key_name

#   subnet_id              = module.vpc.public_subnets[0]
#   vpc_security_group_ids = [module.bastion_sg.id]

#   tags = {
#     Project = var.project
#   }
# }

# data "aws_ami" "amzlinux2" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-gp2"]
#   }
#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }
# }

# module "bastion_sg" {
#   source  = "terraform-aws-modules/security-group/aws"
#   version = "4.5.0"

#   name = "${var.project}-bastion-sg"
#   description = "Security Group with SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
#   vpc_id = module.vpc.vpc_id

#   ingress_rules = ["ssh-tcp"]
#   ingress_cidr_blocks = ["0.0.0.0/0"]

#   egress_rules = ["all-all"]
#   tags = {
#     Project = var.project
#   }
# }
