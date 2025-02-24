locals {
  app_settings = merge({
    APPINSIGHTS_PROFILERFEATURE_VERSION             = "disabled"
    APPINSIGHTS_SNAPSHOTFEATURE_VERSION             = "disabled"
    ApplicationInsightsAgent_EXTENSION_VERSION      = "~3"
    DiagnosticServices_EXTENSION_VERSION            = "disabled"
    InstrumentationEngine_EXTENSION_VERSION         = "disabled"
    SnapshotDebugger_EXTENSION_VERSION              = "disabled"
    WEBSITE_RUN_FROM_PACKAGE                        = "1"
    XDT_MicrosoftApplicationInsights_BaseExtensions = "disabled"
    XDT_MicrosoftApplicationInsights_Mode           = "recommended"
    XDT_MicrosoftApplicationInsights_PreemptSdk     = "disabled",
    TestUI                                          = var.test_ui
  }, var.app_service_defaults)
}

resource "azurerm_linux_web_app" "app_service" {
  name                          = var.app_service_name
  resource_group_name           = var.app_service_defaults.resource_group_name
  service_plan_id               = var.app_service_defaults.service_plan_id
  app_settings                  = local.app_settings
  https_only                    = true
  location                      = var.app_service_defaults.location

  site_config {
    always_on  = var.service_always_on
    ftps_state = "FtpsOnly"
    application_stack {
      dotnet_version = "6.0"
    }
  }

  sticky_settings {
    app_setting_names = ["APPINSIGHTS_INSTRUMENTATIONKEY", "APPLICATIONINSIGHTS_CONNECTION_STRING ", "APPINSIGHTS_PROFILERFEATURE_VERSION", "APPINSIGHTS_SNAPSHOTFEATURE_VERSION", "ApplicationInsightsAgent_EXTENSION_VERSION", "XDT_MicrosoftApplicationInsights_BaseExtensions", "DiagnosticServices_EXTENSION_VERSION", "InstrumentationEngine_EXTENSION_VERSION", "SnapshotDebugger_EXTENSION_VERSION", "XDT_MicrosoftApplicationInsights_Mode", "XDT_MicrosoftApplicationInsights_PreemptSdk", "APPLICATIONINSIGHTS_CONFIGURATION_CONTENT", "XDT_MicrosoftApplicationInsightsJava", "XDT_MicrosoftApplicationInsights_NodeJS"]
  }
}
