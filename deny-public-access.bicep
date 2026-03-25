param effect string = 'Deny'

resource policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'deny-public-access-storage'
  properties: {
    displayName: 'Deny public access on storage accounts'
    mode: 'All'
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Storage/storageAccounts'
      }
      then: {
        effect: effect
        details: {
          field: 'Microsoft.Storage/storageAccounts/networkAcls.defaultAction'
          equals: 'Allow'
        }
      }
    }
  }
}
