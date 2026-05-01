module "network" {
  source = "./modules/network"
}

module "compute" {
  source            = "./modules/compute"
  vpc_id            = module.network.vpc_id
  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id

  # Passando as variáveis globais para o módulo
  instance_type     = var.instance_type
  db_instance_class = var.db_instance_class
  rds_multi_az      = var.rds_multi_az
}