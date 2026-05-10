# Azure Shared Environment (Base)

This repository was generated from the **Azure Environment Base** Backstage template.

## What is included

- Shared Bicep modules under `infra/shared/modules`
- Base environment deployment under `infra/environments/${{ values.environmentName }}/base`
- A deploy workflow using Azure OIDC (`.github/workflows/deploy-base.yml`)

## Incremental add-on model

Deploy the base once, then add resources over time by adding add-on folders under:

- `infra/environments/${{ values.environmentName }}/addons/storage/...`
- `infra/environments/${{ values.environmentName }}/addons/appservice/...`
- `infra/environments/${{ values.environmentName }}/addons/vm/...`

Add-ons can be generated via dedicated Backstage templates and merged through normal PR review.

## Deploy base

```bash
az deployment group create \
  --resource-group ${{ values.resourceGroupName }} \
  --template-file infra/environments/${{ values.environmentName }}/base/main.bicep \
  --parameters @infra/environments/${{ values.environmentName }}/base/main.parameters.example.json
```

> Pass `adminSshPublicKey` at deploy time if you do not store it in parameters files.
