module "terraform_ec2_agent" {
  depends_on = [
     module.network,
     module.iam_roles
    ]
  source              = "git::https://github.com/tothenew/terraform-aws-agent.git?ref=v0.1.0"
  vpc_id              = data.aws_vpc.selected.id
  subnet_id           = data.aws_subnets.public.ids[0]
  iam_instance_profile = module.iam_roles.iam_instance_profile_admin_name

}

