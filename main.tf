//--------------------------------------------------------------------
// Variables
variable "cluster_name" {}
variable "availability_zone" {}
variable "key_name" {}
variable "network_name" {}
variable "region" {}


//--------------------------------------------------------------------
// Modules
module "eks" {
  source  = "app.terraform.io/Darnold-Pipeline/eks/aws"
  version = "1.0.0"

  cluster_name = "${var.cluster_name}"
  subnets = ["${module.network.public_subnets}"]
  vpc_id = "${module.network.vpc_id}"
}

module "network" {
  source  = "app.terraform.io/Darnold-Pipeline/network/aws"
  version = "3.0.8"
  key_name = "${var.key_name}"
  network_name = "${var.network_name}"
  region = "${var.region}"
}
