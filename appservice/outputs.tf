output "azurerm_ui" {
  description = "ui"
  value       = azurerm_linux_web_app.app_service.default_hostname
}