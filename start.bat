@REM hook it to windows task scheduler - on startup - 30 seconds delay - wait for netork icon to appear that you are connected before logging in as your user. Otherwise there could be issues.
powershell -executionpolicy bypass -file C:\ProgramData\WSL2-Network-Fix\resetWindowsNet.ps1
@REM Hook all Hyper V VMs to WSL network => avoid network performance issues.
powershell -ExecutionPolicy "bypass" -Command "Get-VM | Get-VMNetworkAdapter | Connect-VMNetworkAdapter -SwitchName 'WSL'"
@REM now that host network is configured we can set up wsl network
wsl.exe --user "root" sh "/mnt/c/ProgramData/WSL2-Network-Fix/configureWSL2Net.sh"
@REM Start All Hyper VMs
powershell -ExecutionPolicy "bypass" -Command "Get-VM | Start-VM"
