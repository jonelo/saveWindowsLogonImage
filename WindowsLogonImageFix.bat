@echo off
echo Get-AppxPackage Microsoft.Windows.ContentDeliveryManager -allusers ^| foreach {Add-AppxPackage -register "$($_.InstallLocation)\appxmanifest.xml" -DisableDevelopmentMode} > screenlock-image-fix.ps1
PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList '-ExecutionPolicy Bypass -File ""%~dpn0.ps1""' -Verb RunAs}"
