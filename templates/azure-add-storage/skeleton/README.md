# Azure Storage Add-on

This template generates a storage add-on using the same shared environment layout.

Generated path:

- `infra/environments/${{ values.environmentName }}/addons/storage/${{ values.workloadName }}`

If your base environment repository already has shared modules, keep one canonical copy and merge this add-on through normal pull request review.
