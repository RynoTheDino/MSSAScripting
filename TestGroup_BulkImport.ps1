$domain = Get-AzureADDomain
$DName = $domain.name
$PswdProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile

#CHANGE PASSWORD BELOW!

$PswdProfile.Password = "D3f@ultPa5sw0rd!!"

New-AzureADGroup -Description 'Test Import Group' -MailEnabled 0 -SecurityEnabled 1 -DisplayName 'Test Group' -MailNickName None
$Testgroup = Get-AzureADGroup | Where-Object {$_.displayname -eq 'Test Group'}

$bulkfile = Read-Host "enter filepath"
$bulk = Import-CSV $bulkfile

ForEach ($u in $bulk) {
    $Short = $u.First
    $display = $u.First + " " + $u.Last
    Write-Host "Creating $display"
    New-AzureADUser -DisplayName $display -UserPrincipalName $Short@$DName -AccountEnabled $true -PasswordProfile $PswdProfile -MailNickName $Short -Surname 'Test'
  }

$TestMembers = Get-AzureADUser | Where-Object {$_.surname -eq 'Test'}

foreach ($tuser in $TestMembers) {
    Add-AzureADGroupMember -ObjectId $Testgroup.ObjectId -RefObjectId $tuser.ObjectId
    Write-Host "Adding Test Surname Users to Test Group"
  }

#### Run Below to clear users and group###


#foreach ($delU in $TestMembers) {
#    Remove-AzureADUser -ObjectId $delU.ObjectId
#  }
#
#  foreach ($delG in $Testgroup) {
#    Remove-AzureADGroup -ObjectId $delG.ObjectId
#  }