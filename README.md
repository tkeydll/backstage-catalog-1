# backstage-catalog-1

Backstage catalog and scaffolder templates for self-service Azure infrastructure using Bicep.

## Included templates

- **Azure Environment Base (Bicep)**: scaffolds a baseline environment repository layout with shared modules and deployable base network + VM artifacts.
- **Azure Add Storage to Existing Environment**: scaffolds storage add-on files compatible with the same shared environment layout.
- **Azure Add App Service to Existing Environment**: scaffolds app service add-on files compatible with the same shared environment layout.
- **Azure Add VM to Existing Environment**: scaffolds incremental VM add-on files compatible with the same shared environment layout.

## Pattern: base + add-ons in one resource group

1. Use the **base template** once to create the initial infrastructure repository layout and baseline deployment files.
2. Use **add-on templates** over time to generate incremental Bicep artifacts that target the same resource group/environment.
3. Review generated changes in GitHub, adjust names/parameters if needed, and merge through normal PR review.
4. Deploy each unit (base or add-on) independently to the same resource group.

This approach is intentionally simple and robust: add-ons generate practical file sets under the same folder conventions instead of trying fragile automatic merge logic.

## Intended generated layout

```text
infra/
  shared/
    modules/
      network.bicep
      vm.bicep
      storage.bicep
      appservice-plan.bicep
      appservice-webapp.bicep
  environments/
    <environment>/
      base/
        main.bicep
        main.parameters.example.json
      addons/
        storage/<workload>/...
        appservice/<workload>/...
        vm/<workload>/...
```

## Catalog registration

Register `/templates/catalog-info.yaml` in Backstage to ingest all template entities.

## Secrets and authentication

Generated GitHub Actions workflows assume:

- Azure OIDC login (`azure/login`)
- repository/environment variables and secrets for tenant, subscription, client id, and resource group

No credentials are hardcoded in this repository.
