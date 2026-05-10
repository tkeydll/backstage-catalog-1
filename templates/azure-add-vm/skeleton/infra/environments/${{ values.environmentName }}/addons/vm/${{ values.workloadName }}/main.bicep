param location string = '${{ values.location }}'
param vmName string = '${{ values.vmName }}'
param subnetId string = '${{ values.subnetResourceId }}'
param adminUsername string = '${{ values.adminUsername }}'
param adminSshPublicKey string = '${{ values.adminSshPublicKey }}'

module vm '../../../../../shared/modules/vm.bicep' = {
  name: 'vm-addon-${{ values.workloadName }}'
  params: {
    vmName: vmName
    location: location
    subnetId: subnetId
    adminUsername: adminUsername
    adminSshPublicKey: adminSshPublicKey
  }
}

output vmId string = vm.outputs.vmId
