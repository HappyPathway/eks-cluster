//--------------------------------------------------------------------
// Variables



//--------------------------------------------------------------------
// Modules
module "eks" {
  source  = "app.terraform.io/Darnold-Pipeline/eks/aws"
  version = "1.0.0"

  cluster_name = "simple-app"
  subnets = [${module.network.private_subnet}, ${module.network.public_subnet}]
  vpc_id = "${module.network.vpc_id}"
}

module "network" {
  source  = "app.terraform.io/Darnold-Pipeline/network/aws"
  version = "1.0.0"

  availability_zone = "us-east-1c"
  key_name = "tfe-demos-darnold"
  network_name = "darnold-pipeline"
  region = "us-east-1"
}
