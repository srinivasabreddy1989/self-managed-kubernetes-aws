
module "networking" {
  source = "../../modules/networking"

  name_prefix          = var.name_prefix
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  tags = {
    Environment = "production"
    Project     = "kubernetes"
    ManagedBy   = "terraform"
  }
}


module "iam" {
  source = "../../modules/iam"

  name_prefix = var.name_prefix

  tags = {
    Environment = "production"
    Project     = "kubernetes"
    ManagedBy   = "terraform"
  }
}


module "security_groups" {
  source = "../../modules/security-groups"

  name_prefix = var.name_prefix
  vpc_id      = module.networking.vpc_id
  vpc_cidr    = module.networking.vpc_cidr_block

  tags = {
    Environment = "production"
    Project     = "kubernetes"
    ManagedBy   = "terraform"
  }
}


module "ec2" {
  source = "../../modules/ec2"

  name_prefix = var.name_prefix

  private_subnet_ids = module.networking.private_subnet_ids

  control_plane_sg_id = module.security_groups.control_plane_sg_id

  worker_sg_id = module.security_groups.worker_sg_id

  instance_profile_name = module.iam.instance_profile_name

  control_plane_instance_type = var.control_plane_instance_type

  worker_instance_type = var.worker_instance_type

  control_plane_volume_size = var.control_plane_volume_size

  worker_volume_size = var.worker_volume_size

  tags = {
    Environment = "production"
    Project     = "kubernetes"
    ManagedBy   = "terraform"
  }
}


module "load_balancer" {
  source = "../../modules/load-balancer"

  name_prefix = var.name_prefix

  vpc_id = module.networking.vpc_id

  private_subnet_ids = module.networking.private_subnet_ids

  load_balancer_sg_id = module.security_groups.load_balancer_sg_id

  control_plane_instance_ids = module.ec2.control_plane_instance_ids

  tags = {
    Environment = "production"
    Project     = "kubernetes"
    ManagedBy   = "terraform"
  }
}
