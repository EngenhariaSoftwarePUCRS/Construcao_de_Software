provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "available" {}

locals {
  name = "ex-${basename(path.cwd)}"

  container_name = "ecsdemo-frontend"
  container_port = 3000

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-ecs"
  }
}
