function Get-hostinfo {
[cmdletbinding()]
    Param(
    [parameter(mandatory=$true, valuefromPipeline=$true, valuefrompipelinebypropertyname=$true)]
    [string[]]$dnshost
    ) 
# Get the Win32_OperatingSystem WMI class
$os = Get-CimInstance -Class Win32_OperatingSystem

# Extract the operating system name
$osName = $os.Name

# Print the operating system name to the console
#Write-Output "Operating System Name: $osName"

$bootTime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime 

$WhenBoot = write-host "The computer last booted up at: $bootTime"

$uptime = $os.LocalDateTime - $bootTime

$drivespace= Get-WmiObject  win32_LogicalDisk -Filter "DeviceID='c:'" -ComputerName $dnshost

$properties = @{
                'Hostname' = $dnshost;
                'os'       = $os.caption;
                'LastBootTime'  =  $os.LastBootUpTime;
                'UptimeHours' = $uptime
                'C_GBFree' = ($drivespace.FreeSpace / 1GB -as [int])
            }
        $obj = New-Object -TypeName psobject -Property $properties
        Write-Output $obj
}