# Azure App Service Add-on

This template generates App Service add-on files for an existing shared environment.

Generated path:

- `infra/environments/${{ values.environmentName }}/addons/appservice/${{ values.workloadName }}`

Use GitHub PR review to merge generated files into the repository that owns your shared environment and deploy to the same resource group.
