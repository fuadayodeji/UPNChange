#change UPN
Connect-AzureAD
$domain = "faradaf007.onmicrosoft.com"

# Get users with the old domain in UPN and update their UPNs
$usersToUpdate = Get-AzureADUser -All $true | Where-Object { $_.UserPrincipalName.EndsWith("faradaf.com") }

foreach ($user in $usersToUpdate) {
    $newUpn = $user.UserPrincipalName.Split("@")[0] + "@" + $domain
    Set-AzureADUser -ObjectId $user.ObjectId -UserPrincipalName $newUpn
}
