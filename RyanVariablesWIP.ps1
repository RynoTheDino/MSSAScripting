$domain = Get-AzureADDomain
$DName = $domain.name
$PswdProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile

#CHANGE PASSWORD BELOW!

$PswdProfile.Password = "D3f@ultPa5sw0rd!!"

