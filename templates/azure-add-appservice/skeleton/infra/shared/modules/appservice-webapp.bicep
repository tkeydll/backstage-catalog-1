@description('Web app name')
param webAppName string

@description('Azure location')
param location string

@description('App Service plan id')
param serverFarmId string

@description('Linux runtime stack, for example DOTNETCORE|8.0 or NODE|20-lts')
param linuxFxVersion string = 'DOTNETCORE|8.0'

resource webApp 'Microsoft.Web/sites@2023-12-01' = {
  name: webAppName
  location: location
  kind: 'app,linux'
  properties: {
    serverFarmId: serverFarmId
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      minTlsVersion: '1.2'
    }
  }
}

output webAppId string = webApp.id
