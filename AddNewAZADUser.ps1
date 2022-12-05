## ASSUMED TO HAVE RAN RyanVariablesWIP.ps1##
#$domain = Get-AzureADDomain
#$DName = $domain.name
#$PswdProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile

#CHANGE PASSWORD BELOW!

#$PswdProfile.Password = "D3f@ultPa5sw0rd!!"

#New Single AzureAD User
$FullName = Read-Host "Enter Name as 'First Last'"
$Nick = Read-Host "Re-enter First Name"
New-AzureADUser -DisplayName $FullName -UserPrincipalName $Nick@$DName -AccountEnabled $true -PasswordProfile $PswdProfile -MailNickName $Nick

