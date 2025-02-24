variable "app_service_sku" {
  description = "SKU for app service"
  type        = string
  default     = "F1"
}

variable "location" {
  description = "location where resources needs to be created"
  type        = string
  default     = "westeurope"
}