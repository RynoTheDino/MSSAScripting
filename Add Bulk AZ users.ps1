##USES RyanVariablesWIP.ps1##

$bulkfile = Read-Host "enter filepath"
$bulk = Import-CSV $bulkfile

ForEach ($u in $bulk) {
    $Short = $u.First
    $display = $u.First + " " + $u.Last
    Write-Host "Creating $display"
New-AzureADUser -DisplayName $display -UserPrincipalName $Short@$DName -AccountEnabled $true -PasswordProfile $PswdProfile -MailNickName $Short
}
