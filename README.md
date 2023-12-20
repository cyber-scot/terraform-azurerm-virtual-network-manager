```hcl
resource "azurerm_network_manager" "avnm" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
  description         = var.description


  dynamic "scope" {
    for_each = var.scope != null ? var.scope : []
    content {
      management_group_ids = scope.value.management_group_ids
      subscription_ids     = scope.value.subscription_ids
    }
  }
  scope_accesses = var.scope_accesses
}


resource "azurerm_network_manager_network_group" "groups" {
  for_each           = toset(var.network_groups)
  name               = each.value
  network_manager_id = azurerm_network_manager.avnm.id
}
```
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
| [azurerm_network_manager.avnm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_manager) | resource |
| [azurerm_network_manager_network_group.groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_manager_network_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description attached to AVNM | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where resources will be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the AVNM instance | `string` | n/a | yes |
| <a name="input_network_groups"></a> [network\_groups](#input\_network\_groups) | A set of network groups to be made inside AVNM | `set(string)` | `[]` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group. | `string` | n/a | yes |
| <a name="input_scope"></a> [scope](#input\_scope) | The scope block in to which AVNM is deployed | <pre>list(object({<br>    management_group_ids = optional(list(string))<br>    subscription_ids     = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_scope_accesses"></a> [scope\_accesses](#input\_scope\_accesses) | A list of configuration types | `list(string)` | <pre>[<br>  "Connectivity",<br>  "SecurityAdmin"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_group_ids"></a> [network\_group\_ids](#output\_network\_group\_ids) | A map of network group names to their respective IDs. |
| <a name="output_network_group_names"></a> [network\_group\_names](#output\_network\_group\_names) | The list of network group names. |
| <a name="output_network_manager_id"></a> [network\_manager\_id](#output\_network\_manager\_id) | The ID of the Azure Network Manager. |
| <a name="output_network_manager_name"></a> [network\_manager\_name](#output\_network\_manager\_name) | The name of the Azure Network Manager. |
| <a name="output_network_manager_scope"></a> [network\_manager\_scope](#output\_network\_manager\_scope) | The scope of the Azure Network Manager. |
| <a name="output_network_manager_tags"></a> [network\_manager\_tags](#output\_network\_manager\_tags) | The tags of the Azure Network Manager. |
