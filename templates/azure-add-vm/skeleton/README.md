# Azure VM Add-on

This template generates VM add-on files for an existing shared environment and resource group.

Generated path:

- `infra/environments/${{ values.environmentName }}/addons/vm/${{ values.workloadName }}`

Provide an existing subnet resource id from your baseline/shared network.
Use SSH public key authentication for VM admin access.
If your base environment repository already contains `infra/shared/modules/vm.bicep`, keep that file as canonical and only merge/update the add-on deployment files unless you intentionally want to update the shared module.
Merge and deploy this add-on through normal GitHub PR flow.
