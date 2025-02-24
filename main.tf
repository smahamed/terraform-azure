# locals {
#   app_service_defaults = {
#     resource_group_name = azurerm_resource_group.rg_demo.name
#     location            = azurerm_resource_group.rg_demo.location
#     service_plan_id     = azurerm_service_plan.asp_demo.id
#   }
# }

# resource "azurerm_resource_group" "rg_demo" {
#   name     = "rg-demo"
#   location = var.location
# }

# resource "azurerm_service_plan" "asp_demo" {
#   name                = "demo-asp"
#   resource_group_name = azurerm_resource_group.rg_demo.name
#   location            = azurerm_resource_group.rg_demo.location
#   os_type             = "Linux"
#   sku_name            = "B1"
# }

# resource "azurerm_linux_web_app" "web" {
#   app_settings = {
#     WEBSITE_RUN_FROM_PACKAGE = "1"
#   }
#   https_only          = true
#   location            = azurerm_resource_group.rg_demo.location
#   name                = "web-az-sm"
#   resource_group_name = azurerm_resource_group.rg_demo.name
#   service_plan_id     = azurerm_service_plan.asp_demo.id
#   site_config {
#     always_on        = false
#     app_command_line = "pm2 serve /home/site/wwwroot --no-daemon --spa"
#     ftps_state       = "AllAllowed"
#     cors {
#       support_credentials = true
#     }
#     application_stack {
#       node_version = "16-lts"
#     }
#   }
# }

# module "appservice_demo" {
#   source               = "./appservice"
#   app_service_name     = "demo-az-sm1"
#   app_service_defaults = local.app_service_defaults
#   test_ui              = "test"
#   location             = azurerm_resource_group.rg_demo.location
#   env                  = "demo"
# }

# module "appservice_demo_1" {
#   source = "./appservice"

#   app_service_name     = "demo-az-sm2"
#   app_service_defaults = local.app_service_defaults
#   test_ui              = module.appservice_demo.azurerm_ui
#   location             = azurerm_resource_group.rg_demo.location
#   env                  = "demo"
# }

locals {
  app_settings = merge({
    APPINSIGHTS_PROFILERFEATURE_VERSION             = "disabled"
    APPINSIGHTS_SNAPSHOTFEATURE_VERSION             = "disabled"
    ApplicationInsightsAgent_EXTENSION_VERSION      = "~3"
    DiagnosticServices_EXTENSION_VERSION            = "disabled"
    InstrumentationEngine_EXTENSION_VERSION         = "disabled"
    SnapshotDebugger_EXTENSION_VERSION              = "disabled"
    XDT_MicrosoftApplicationInsights_BaseExtensions = "disabled"
    XDT_MicrosoftApplicationInsights_Mode           = "recommended"
    XDT_MicrosoftApplicationInsights_PreemptSdk     = "disabled",
  })
}

resource "azurerm_resource_group" "rg" {
  name = "rg-tf-workshop-dops-sandbox"
  location = "westeurope"
  tags = {
    source       = "terraform"
    subscription = "sandbox"
  }
}

resource "azurerm_service_plan" "asp" {
  name                = "demo-asp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app_service" {
  name                          = "demo-terraform-1234"
  resource_group_name           = azurerm_resource_group.rg.name
  service_plan_id               = azurerm_service_plan.asp.id
  app_settings                  = local.app_settings
  https_only                    = true
  location                      = "westeurope"

  site_config {
    always_on  = false
    ftps_state = "FtpsOnly"
    application_stack {
      dotnet_version = "6.0"
    }
  }

  sticky_settings {
    app_setting_names = ["APPINSIGHTS_INSTRUMENTATIONKEY", "APPLICATIONINSIGHTS_CONNECTION_STRING ", "APPINSIGHTS_PROFILERFEATURE_VERSION", "APPINSIGHTS_SNAPSHOTFEATURE_VERSION", "ApplicationInsightsAgent_EXTENSION_VERSION", "XDT_MicrosoftApplicationInsights_BaseExtensions", "DiagnosticServices_EXTENSION_VERSION", "InstrumentationEngine_EXTENSION_VERSION", "SnapshotDebugger_EXTENSION_VERSION", "XDT_MicrosoftApplicationInsights_Mode", "XDT_MicrosoftApplicationInsights_PreemptSdk", "APPLICATIONINSIGHTS_CONFIGURATION_CONTENT", "XDT_MicrosoftApplicationInsightsJava", "XDT_MicrosoftApplicationInsights_NodeJS"]
  }
}
