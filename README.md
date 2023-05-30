# terraform-aws-eks

Magicorn made Terraform Module for AWS Provider
--
```
module "eks" {
  source         = "magicorntech/eks/aws"
  version        = "0.0.2"
  tenant         = var.tenant
  name           = var.name
  environment    = var.environment
  vpc_id         = module.vpc.vpc_id
  cidr_block     = module.vpc.cidr_block
  pvt_subnet_ids = module.vpc.pvt_subnet_ids
  eks_subnet_ids = module.vpc.eks_subnet_ids

  # EKS Configuration
  eks_version          = "1.26"
  vpccni_version       = "v1.12.5-eksbuild.2"
  coredns_version      = "v1.9.3-eksbuild.2"
  kubeproxy_version    = "v1.26.2-eksbuild.1"
  ebscsi_version       = "v1.19.0-eksbuild.1"
  main_capacity_type   = "SPOT"
  extra_capacity_type  = "SPOT"
  main_disk_size       = 30
  extra_disk_size      = 30
  main_instance_types  = ["t3.medium", "t3a.medium"]
  extra_instance_types = ["t3.medium", "t3a.medium"]
  main_scaling_config  = {desired=3, min=3, max=3}
  extra_scaling_config = {desired=0, min=0, max=25}
  enable_aws_cicd      = true # 1
}
```

## Notes
1) Disable if you want to use external CI/CD solutions like GitLab or Bitbucket. Leaving true deploys the required permissions for AWS Code Suite.