##### Create EKS Cluster
resource "aws_eks_cluster" "main" {
  name     = "${var.tenant}-${var.name}-eks-cluster-${var.environment}"
  role_arn = aws_iam_role.cluster.arn
  version  = var.eks_version

  vpc_config {
    subnet_ids              = var.pvt_subnet_ids
    security_group_ids      = [aws_security_group.main.id]
    endpoint_private_access = true
    endpoint_public_access  = false
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]

  tags = {
    Name        = "${var.tenant}-${var.name}-eks-cluster-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "yonetimacademy"
    Terraform   = "yes"
  }
}