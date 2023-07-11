#change UPN
Connect-AzureAD
$domain = "faradaf007.onmicrosoft.com"
Get-AzureADUser -All $True  | Where { $_.UserPrincipalName.EndsWith("faradaf.com") }  | 
ForEach {
 $newupn = $_.UserPrincipalName.Split("@")[0] + "@" + $domain
 Set-AzureADUser -ObjectId $_.objectid  -UserPrincipalName $newupn
}



