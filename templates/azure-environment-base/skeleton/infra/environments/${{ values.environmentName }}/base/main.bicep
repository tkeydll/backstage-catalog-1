param location string = '${{ values.location }}'
param vnetName string = '${{ values.environmentName }}-vnet'
param subnetName string = 'vm-subnet'
param addressPrefix string = '${{ values.addressPrefix }}'
param subnetPrefix string = '${{ values.subnetPrefix }}'
param vmName string = '${{ values.vmName }}'
param adminUsername string = '${{ values.adminUsername }}'
@secure()
param adminPassword string

module network '../../../shared/modules/network.bicep' = {
  name: 'baseline-network'
  params: {
    vnetName: vnetName
    subnetName: subnetName
    location: location
    addressPrefix: addressPrefix
    subnetPrefix: subnetPrefix
  }
}

module vm '../../../shared/modules/vm.bicep' = {
  name: 'baseline-vm'
  params: {
    vmName: vmName
    location: location
    subnetId: network.outputs.subnetId
    adminUsername: adminUsername
    adminPassword: adminPassword
  }
}

output vmId string = vm.outputs.vmId
output subnetId string = network.outputs.subnetId
