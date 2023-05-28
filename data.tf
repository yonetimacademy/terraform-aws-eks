data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "tls_certificate" "main" {
  url = aws_eks_cluster.main.identity.0.oidc.0.issuer
}

resource "random_id" "iam" {
  byte_length = 6
}

locals {
  alb_ecr_url = (
    data.aws_region.current.name == "eu-central-1" ? "602401143452.dkr.ecr.eu-central-1.amazonaws.com" : false ||
    data.aws_region.current.name == "eu-north-1" ? "602401143452.dkr.ecr.eu-north-1.amazonaws.com" : false ||
    data.aws_region.current.name == "eu-south-1" ? "590381155156.dkr.ecr.eu-south-1.amazonaws.com" : false ||
    data.aws_region.current.name == "eu-west-1" ? "602401143452.dkr.ecr.eu-west-1.amazonaws.com" : false ||
    data.aws_region.current.name == "eu-west-2" ? "602401143452.dkr.ecr.eu-west-2.amazonaws.com" : false ||
    data.aws_region.current.name == "eu-west-3" ? "602401143452.dkr.ecr.eu-west-3.amazonaws.com" : false ||
    data.aws_region.current.name == "us-east-1" ? "602401143452.dkr.ecr.us-east-1.amazonaws.com" : false ||
    data.aws_region.current.name == "us-east-2" ? "602401143452.dkr.ecr.us-east-2.amazonaws.com" : false ||
    data.aws_region.current.name == "us-west-1" ? "602401143452.dkr.ecr.us-west-1.amazonaws.com" : false ||
    data.aws_region.current.name == "us-west-2" ? "602401143452.dkr.ecr.us-west-2.amazonaws.com" : false
  )
}