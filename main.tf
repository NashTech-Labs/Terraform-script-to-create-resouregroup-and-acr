resource "azurerm_resource_group" "rg" {
  name = var.rg_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sku = "Basic"
  admin_enabled = true
}


# App Plan
resource "azurerm_app_service_plan" "service-plan" {
  name = var.app_plan_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind = "Linux"
  reserved = true  

  sku {
    tier = "Standard"
    size = "S1"
  }  
}



 
