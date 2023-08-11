variable "provider_azure_subscription_id" {
  description = "The Azure subscription ID"
}

variable "provider_azure_dns_subscription_id" {
  description = "The Azure subscription ID for the DNS entries. Only used, because DNS zone and AKS resources are in different subscriptions"
  type = string
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = "dev"
}

variable "postgresql_admin_login" {
  description = "The postgresql database server administrator username"
  type        = string
}

variable "postgresql_admin_password" {
  description = "The postgresql database server administrator password"
  type        = string
}
