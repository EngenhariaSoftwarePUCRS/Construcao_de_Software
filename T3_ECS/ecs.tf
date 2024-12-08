module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name = local.name

  services = {
    "${local.container_name}" = {
      cpu    = 1024
      memory = 4096

      # Container definition(s)
      container_definitions = {
        "${local.container_name}" = {
          cpu       = 512
          memory    = 1024
          essential = true
          image     = "public.ecr.aws/aws-containers/ecsdemo-frontend:776fd50"

          port_mappings = [
            {
              containerPort = local.container_port
              hostPort      = local.container_port
              protocol      = "tcp"
            }
          ]
        }
      }

      subnet_ids = module.vpc.public_subnets
      # subnet_ids = module.vpc.private_subnets

      load_balancer = {
        service = {
          target_group_arn = module.alb.target_groups["ecs"].arn
          container_name   = local.container_name
          container_port   = local.container_port
        }
      }
    }
  }

  tags = local.tags
}
