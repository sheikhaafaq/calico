provider "kubernetes" {
  config_paths = [ "/home/developer/.kube/config"]
}

provider "helm" {
    kubernetes {
      config_paths = ["/home/developer/.kube/config"]
    }
}
# Specifies provider
provider "aws" {
  region = "us-east-1"
}

module "calico" {
 source = "./modules/calico" 
 calico_conf = var.calico_conf
}