## ASSUMED TO HAVE RAN RyanVariablesWIP.ps1##
#$domain = Get-AzureADDomain
#$DName = $domain.name
#$PswdProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile

#CHANGE PASSWORD BELOW!

#$PswdProfile.Password = "D3f@ultPa5sw0rd!!"

$bulkfile = Read-Host "enter filepath"
$bulk = Import-CSV $bulkfile

ForEach ($u in $bulk) {
    $Short = $u.First
    $display = $u.First + " " + $u.Last
    Write-Host "Creating $display"
New-AzureADUser -DisplayName $display -UserPrincipalName $Short@$DName -AccountEnabled $true -PasswordProfile $PswdProfile -MailNickName $Short
}
