#########################################################
#Name        : STIGINSTALLED.ps1
#Description : This file installs STIG SV-88249r1_rule
#Verson      :1.0
#Author      : Jimesh Sutar
#########################################################



Set-Location HKLM:

$get=Test-path .\SOFTWARE\Policies\Microsoft\Windows\Installer

if($get -eq $false)

{

New-Item -Path .\SOFTWARE\Policies\Microsoft\Windows\ -Name "Installer" -Force

New-ItemProperty .\SOFTWARE\Policies\Microsoft\Windows\Installer -Name "AlwaysInstallElevated" -PropertyType "DWord" -Value "1"

}

else{

Set-ItemProperty \SOFTWARE\Policies\Microsoft\Windows\Installer\ -Name "AlwaysInstallElevated" -Value "1" -Force


}

##Result stored to confirm

$result = Get-ItemPropertyValue .\SOFTWARE\Policies\Microsoft\Windows\Installer -Name AlwaysInstallElevated



New-Item -Path "c:\" -Name "logfiles" -ItemType "directory"
Add-Content -Value $result -Path C:\logfiles\success.txt