#########################################################
#Name        : STIGINSTALLED.ps1
#Description : This file installs STIG SV-88249r1_rule
#Verson      :1.0
#Author      : Jimesh Sutar
#########################################################





##Set the drive for registery##

cd HKLM:

##Get the value##

$get=Get-ItemPropertyValue HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer -Name AlwaysInstallElevated

##Condition##

If($get -ceq "0")
{
Set-ItemProperty \SOFTWARE\Policies\Microsoft\Windows\Installer\ -Name "AlwaysInstallElevated" -Value "1" -Force

cd HKCU :

Set-ItemProperty \SOFTWARE\Policies\Microsoft\Windows\Installer\ -Name "AlwaysInstallElevated" -Value "1" -Force

}

else{


New-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Installer\" -Name "AlwaysInstallElevated" -Value "1" -PropertyType "DWord"

New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer\" -Name "AlwaysInstallElevated" -Value "1" -PropertyType "DWord"

}


##Result stored to confirm

$result = Get-ItemPropertyValue HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer -Name AlwaysInstallElevated

Add-Content -Value $result -Path C:success.txt
