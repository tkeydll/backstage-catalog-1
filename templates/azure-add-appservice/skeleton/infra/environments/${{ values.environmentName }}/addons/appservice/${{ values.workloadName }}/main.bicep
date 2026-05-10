param location string = '${{ values.location }}'
param appServicePlanName string = '${{ values.appServicePlanName }}'
param webAppName string = '${{ values.webAppName }}'
param planSkuName string = '${{ values.planSkuName }}'
param planSkuTier string = '${{ values.planSkuTier }}'
param linuxFxVersion string = '${{ values.linuxFxVersion }}'

module appPlan '../../../../../shared/modules/appservice-plan.bicep' = {
  name: 'app-plan-${{ values.workloadName }}'
  params: {
    planName: appServicePlanName
    location: location
    skuName: planSkuName
    skuTier: planSkuTier
  }
}

module webApp '../../../../../shared/modules/appservice-webapp.bicep' = {
  name: 'web-app-${{ values.workloadName }}'
  params: {
    webAppName: webAppName
    location: location
    serverFarmId: appPlan.outputs.planId
    linuxFxVersion: linuxFxVersion
  }
}

output webAppId string = webApp.outputs.webAppId
