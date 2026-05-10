@description('App Service plan name')
param planName string

@description('Azure location')
param location string

@description('Plan SKU name')
param skuName string = 'B1'

resource plan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: planName
  location: location
  sku: {
    name: skuName
    tier: 'Basic'
    capacity: 1
  }
  properties: {
    reserved: true
  }
}

output planId string = plan.id
