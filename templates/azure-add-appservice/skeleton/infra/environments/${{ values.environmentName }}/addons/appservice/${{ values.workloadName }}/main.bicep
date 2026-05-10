param location string = '${{ values.location }}'
param appServicePlanName string = '${{ values.appServicePlanName }}'
param webAppName string = '${{ values.webAppName }}'
param planSkuName string = 'B1'

module appPlan '../../../../../shared/modules/appservice-plan.bicep' = {
  name: 'app-plan-${{ values.workloadName }}'
  params: {
    planName: appServicePlanName
    location: location
    skuName: planSkuName
  }
}

module webApp '../../../../../shared/modules/appservice-webapp.bicep' = {
  name: 'web-app-${{ values.workloadName }}'
  params: {
    webAppName: webAppName
    location: location
    serverFarmId: appPlan.outputs.planId
  }
}

output webAppId string = webApp.outputs.webAppId
