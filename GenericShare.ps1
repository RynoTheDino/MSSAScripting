# Create and set the path of the folder to be shared
$NewFolder = Read-Host "Input the Directory you wish to create"

# Set the name of the network share
$shareName = "<share-name>"

# Create the network share
New-SmbShare -Name $shareName -Path $NewFolder -FullAccess Everyone

# Set the share to be read-only
Set-SmbPathAcl -Path $NewFolder -AccountName Everyone -AccessRight Read
