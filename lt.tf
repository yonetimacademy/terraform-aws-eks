##### Create Main Launch Template
resource "aws_launch_template" "main" {
  name = "${var.tenant}-${var.name}-eks-mainlt-${var.environment}"

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = var.main_disk_size
    }
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  ebs_optimized = true

  tag_specifications {
    resource_type = "instance"

    tags = {
        Name        = "${var.tenant}-${var.name}-eks-mainnode-${var.environment}"
        Tenant      = var.tenant
        Project     = var.name
        Environment = var.environment
        Maintainer  = "Magicorn"
        Terraform   = "yes"
    }
  }

  tags = {
    Name        = "${var.tenant}-${var.name}-eks-mainlt-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}

##### Create Extra Launch Template
resource "aws_launch_template" "extra" {
  name = "${var.tenant}-${var.name}-eks-extralt-${var.environment}"

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = var.extra_disk_size
    }
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  ebs_optimized = true

  tag_specifications {
    resource_type = "instance"

    tags = {
        Name        = "${var.tenant}-${var.name}-eks-extranode-${var.environment}"
        Tenant      = var.tenant
        Project     = var.name
        Environment = var.environment
        Maintainer  = "Magicorn"
        Terraform   = "yes"
    }
  }

  tags = {
    Name        = "${var.tenant}-${var.name}-eks-extralt-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}