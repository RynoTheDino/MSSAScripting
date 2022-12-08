# Query user for the folder path
$folderPath = Read-Host "Input File Path to clean up"

# Get all the files in the folder
$files = Get-ChildItem -Path $folderPath

# Set the cutoff date to be X days ago, below is set to 60
$cutoffDate = (Get-Date).AddDays(-60)

# Loop through each file and check if the last modified date is older than the cutoff date
foreach ($file in $files)
{
  if ($file.LastWriteTime -lt $cutoffDate)
  {
    # If the file is older than the cutoff date, delete it
    Remove-Item $file.FullName
  }
}
