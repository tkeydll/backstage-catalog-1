param location string = '${{ values.location }}'
param storageAccountName string = '${{ values.storageAccountName }}'
param sku string = 'Standard_LRS'

module storage '../../../../../shared/modules/storage.bicep' = {
  name: 'storage-${{ values.workloadName }}'
  params: {
    storageAccountName: storageAccountName
    location: location
    sku: sku
  }
}

output storageId string = storage.outputs.storageId
