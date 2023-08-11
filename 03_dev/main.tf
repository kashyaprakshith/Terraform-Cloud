module "dev_cluster" {
  source  = "app.terraform.io/Cofinity-X/consortium-cluster/azurerm"
  version = "1.0.0"

  providers = {
    azurerm.default   = azurerm.default
    azurerm.speedboat = azurerm.speedboat
  }

  cluster_name = var.cluster_name

  default_node_pool_name = "defaultng"
  k8s_cluster_node_count = 2
}


module "dev_postgres" {
  source  = "app.terraform.io/Cofinity-X/postgres/azurerm"
  version = "1.0.0"

  providers = {
    azurerm.default = azurerm.default
  }

  cluster_name            = var.cluster_name
  resource_group_name     = module.dev_cluster.resource_group_name
  resource_group_location = module.dev_cluster.resource_group_location
  admin_login             = var.postgresql_admin_login
  admin_password          = var.postgresql_admin_password
  postgresql_firewall_rules    = {
    "smartsense-network" : {
      "name"              : "smartsense-network",
      "start_ip_address"  : "203.129.213.0",
      "end_ip_address"    : "203.129.213.255"
    }
  }

  disk_size                                               = 65536
}


module "service_bus_bpdm" {
  source  = "app.terraform.io/Cofinity-X/service-bus/azurerm"
  version = "1.0.0"

  providers = {
    azurerm.default = azurerm.default
  }
  service_bus_namespace   = "cofinity-x-${var.cluster_name}-bpdm"
  resource_group_name     = module.dev_cluster.resource_group_name
  resource_group_location = module.dev_cluster.resource_group_location
  topics                  = {
    customer-input-date : {
      name            = "bpdm-gate-customer-input-data"
      partitioning    = false
    }
  }
}
