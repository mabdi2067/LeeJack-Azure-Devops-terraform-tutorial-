provider "azurerm" {
    version = "2.85.0"
    features {}
}

resource "azurerm_resource_group" "TF_test" {
    name = "tfmainabdi-rg"
    location = "Canada Central"
}

resource "azurerm_container_group" "tf_test_cg" {
    name                       = "TF-abdi-container"
    location                   = azurerm_resource_group.TF_test.location
    resource_group_name        = azurerm_resource_group.TF_test.name
    ip_address_type            = "public"
    dns_name_label             = "mabdi23weatherapi"
    os_type                    = "linux"

    container {
    name                       = "weatherapi"
    image                      = "mabdi23/weatherapi"
    cpu                        = "1"
    memory                     = "1"

    ports {
            port = 80
            protocol = "TCP"
        }
    }


}
