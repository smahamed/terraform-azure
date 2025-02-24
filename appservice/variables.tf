
variable "app_service_defaults" {
  description = "Default configuration for app service."
  type = object({
    resource_group_name              = string
    location                         = string
    service_plan_id                  = optional(string)
  })
}

variable "app_service_name" {
  description = "name of app service plan"
  type        = string
}

variable "service_always_on" {
  description = "Keep service always on"
  type        = bool
  default     = false
}

variable "env" {
  description = "environment"
  type        = string
}

variable "location" {
  description = "The location of all resources"
  type        = string
}

variable "disable_public_access" {
  description = "allow public access when set to true"
  type        = bool
  default     = false
}

variable "test_ui" {
  description = "service specific app settings generated in main file"
  type        = string
}