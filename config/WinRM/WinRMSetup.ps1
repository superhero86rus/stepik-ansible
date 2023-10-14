# Сначала разрешаем выполнение сценариев PowerShell
# Выполнить команду отдельно от основного сценария
# Set-ExecutionPolicy ByPass -Force

# Запускаем сценарий
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Upgrade-PowerShell.ps1"
$file = "$env:temp\Upgrade-PowerShell.ps1"
Write-Host $file -ForegroundColor Yellow
$username = "Administrator"
$password = "Password"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

&$file -Version 5.1 -Username $username -Password $password -Verbose