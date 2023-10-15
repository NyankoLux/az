1. Open Powershell as Admin
2. Install the module
```
Install-Script -Name Get-WindowsAutoPilotInfo
```
3. Run the following script
```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
New-Item -Type Directory -Path "C:\HWID"
Set-Location -Path "C:\HWID"
$env:Path += ";C:\Program Files\WindowsPowerShell\Scripts"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
Install-Script -Name Get-WindowsAutopilotInfo
Get-WindowsAutopilotInfo -OutputFile AutopilotHWID.csv
```

More info: 
https://learn.microsoft.com/en-us/autopilot/add-devices#powershell
