resource "aws_eks_addon" "vpccni" {
  cluster_name      = aws_eks_cluster.main.name
  addon_name        = "vpc-cni"
  addon_version     = var.vpccni_version
  resolve_conflicts = "OVERWRITE"

#   configuration_values = jsonencode({
#     replicaCount = 4
#     resources = {
#       limits = {
#         cpu    = "100m"
#         memory = "150Mi"
#       }
#       requests = {
#         cpu    = "100m"
#         memory = "150Mi"
#       }
#     }
#   })

  tags = {
    Name        = "${var.tenant}-${var.name}-eks-addon-vpc-cni-${data.aws_region.current.name}-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}

resource "aws_eks_addon" "coredns" {
  cluster_name      = aws_eks_cluster.main.name
  addon_name        = "coredns"
  addon_version     = var.coredns_version
  resolve_conflicts = "OVERWRITE"

#   configuration_values = jsonencode({
#     replicaCount = 4
#     resources = {
#       limits = {
#         cpu    = "100m"
#         memory = "150Mi"
#       }
#       requests = {
#         cpu    = "100m"
#         memory = "150Mi"
#       }
#     }
#   })

  tags = {
    Name        = "${var.tenant}-${var.name}-eks-addon-coredns-${data.aws_region.current.name}-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}

resource "aws_eks_addon" "kubeproxy" {
  cluster_name      = aws_eks_cluster.main.name
  addon_name        = "kube-proxy"
  addon_version     = var.kubeproxy_version
  resolve_conflicts = "OVERWRITE"

#   configuration_values = jsonencode({
#     replicaCount = 4
#     resources = {
#       limits = {
#         cpu    = "100m"
#         memory = "150Mi"
#       }
#       requests = {
#         cpu    = "100m"
#         memory = "150Mi"
#       }
#     }
#   })

  tags = {
    Name        = "${var.tenant}-${var.name}-eks-addon-kube-proxy-${data.aws_region.current.name}-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}