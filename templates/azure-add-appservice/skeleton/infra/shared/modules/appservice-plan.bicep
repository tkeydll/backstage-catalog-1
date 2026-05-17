@description('App Service plan name')
param planName string

@description('Azure location')
param location string

@description('Plan SKU name')
param skuName string = 'B1'

@description('Plan SKU tier')
param skuTier string = 'Basic'

resource plan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: planName
  location: location
  sku: {
    name: skuName
    tier: skuTier
    capacity: 1
  }
  properties: {
    reserved: true
  }
}

output planId string = plan.id
