$IsActivated = Get-CimInstance SoftwareLicensingProduct -Filter "Name like 'Windows%'" | where { $_.PartialProductKey } | select LicenseStatus
if ($IsActivated.LicenseStatus -eq 1) {
$user = whoami
$user = $user.split("\")[-1]
$path = 'C:\Users\' + $user + '\AppData\Roaming\ActivationWindows'
#P2
Add-Type -AssemblyName System.Windows.Forms
sleep 1
Get-ControlPanelItem -Name "*Maintenance*" | Show-ControlPanelItem
sleep 3
[System.Windows.Forms.SendKeys]::SendWait("^{l}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait(" ")
sleep 3
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait(" ")
sleep 3
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait(" ")
sleep 3
[System.Windows.Forms.SendKeys]::SendWait(" ")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait(" ")
sleep 3
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait(" ")
sleep 3
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait(" ")
sleep 3
Remove-Item $path -Force
sleep 1
Set-Itemproperty -path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\policies\system' -Name 'EnableLUA' -value 1
sleep 1
shutdown /r -t 0
exit
}