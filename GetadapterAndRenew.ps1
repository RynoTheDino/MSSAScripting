﻿Get-WmiObject -Class Win32_NetworkAdapterConfiguration -ComputerName <RemoteHost> | Where-Object {$_.DHCPEnabled -eq "True" -and $_.LeaseExpires -lt (Get-Date).AddDays(1)} | ForEach-Object {$_.ReleaseDHCPLease(); $_.RenewDHCPLease()}