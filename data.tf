data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "tls_certificate" "main" {
  url = aws_eks_cluster.main.identity.0.oidc.0.issuer
}

resource "random_id" "iam" {
  byte_length = 6
}