resource "kubernetes_namespace" "calico" {
  count = (var.calico_conf.namespace != "kube-system" && 
              var.calico_conf.namespace != "default") ? 1 : 0
  metadata {
    name = var.calico_conf.namespace
    labels = {
      "name" = var.calico_conf.namespace
    }
  }
}

resource "helm_release" "calico" {
  depends_on = [ kubernetes_namespace.calico[0] ]
  name = var.calico_conf.name
  repository = var.calico_conf.repository
  chart = var.calico_conf.chart
  version = var.calico_conf.version
  namespace = var.calico_conf.namespace
}