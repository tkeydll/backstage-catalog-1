# Azure VM Add-on

This template generates VM add-on files for an existing shared environment and resource group.

Generated path:

- `infra/environments/${{ values.environmentName }}/addons/vm/${{ values.workloadName }}`

Provide an existing subnet resource id from your baseline/shared network.
Merge and deploy this add-on through normal GitHub PR flow.
