@description('Virtual network name')
param vnetName string

@description('Subnet name')
param subnetName string = 'default'

@description('Azure location')
param location string

@description('Address prefix for VNET')
param addressPrefix string

@description('Address prefix for subnet')
param subnetPrefix string

resource vnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}

output subnetId string = resourceId('Microsoft.Network/virtualNetworks/subnets', vnet.name, subnetName)
output vnetId string = vnet.id
