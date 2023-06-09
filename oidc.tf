resource "aws_iam_openid_connect_provider" "main" {
  url             = aws_eks_cluster.main.identity.0.oidc.0.issuer
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.main.certificates.0.sha1_fingerprint]

  tags = {
    Name        = "${var.tenant}-${var.name}-eks-oidc-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "yonetimacademy"
    Terraform   = "yes"
  }
}