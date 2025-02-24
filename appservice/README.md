<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_virtual_network_swift_connection.vnet_integration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) | resource |
| [azurerm_linux_web_app.app_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_private_endpoint.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_defaults"></a> [app\_service\_defaults](#input\_app\_service\_defaults) | Default configuration for app service. | <pre>object({<br>    resource_group_name              = string<br>    user_assigned_identity_id        = string<br>    location                         = string<br>    service_plan_id                  = optional(string)<br>    db_connection_string             = string<br>    app_insights_instrumentation_key = string<br>    app_insights_connection_string   = string<br>    tags                             = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_app_service_name"></a> [app\_service\_name](#input\_app\_service\_name) | name of app service plan | `string` | n/a | yes |
| <a name="input_disable_public_access"></a> [disable\_public\_access](#input\_disable\_public\_access) | allow public access when set to true | `bool` | `false` | no |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | private dns zone id | `string` | n/a | yes |
| <a name="input_endpoint_subnet_id"></a> [endpoint\_subnet\_id](#input\_endpoint\_subnet\_id) | The id of  subnet to be used for private endpoint deployment | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | environment | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location of all resources | `string` | n/a | yes |
| <a name="input_network_rg_name"></a> [network\_rg\_name](#input\_network\_rg\_name) | The name of api managment resource group | `string` | n/a | yes |
| <a name="input_service_always_on"></a> [service\_always\_on](#input\_service\_always\_on) | Keep service always on | `bool` | `false` | no |
| <a name="input_service_specific_app_settings"></a> [service\_specific\_app\_settings](#input\_service\_specific\_app\_settings) | service specific app settings generated in main file | `map(any)` | n/a | yes |
| <a name="input_vnet_integration_subnet_id"></a> [vnet\_integration\_subnet\_id](#input\_vnet\_integration\_subnet\_id) | The id of  subnet to be used for VNet integration | `string` | n/a | yes |
| <a name="input_web_ui_service"></a> [web\_ui\_service](#input\_web\_ui\_service) | Web UI service name to enable CORS | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->