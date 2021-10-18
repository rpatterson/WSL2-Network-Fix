How to run WSL2 and Hyper-V VMs as if your Linux was normal VM, with own ip address: no
redirects needed.  No *special* software.  As it should have been from the start or as
if MS decided not to overwrite your config every single reboot.

### Windows
_Scripts assume they're installed to C:\ProgramData\WSL2-Network-Fix.  Adjust to local
machine accordingly._

Clone this code repository somewhere and make it appear as
`C:\ProgramData\WSL2-Network-Fix` in Windows:

	cd C:\ProgramData
    git clone https://github.com/pawelgnatowski/WSL2-Network-Fix.git

### Linux
wsl.conf => disable resolv.conf recreation

resolv.conf => set flag to +i so windows will not overwrite the file despite the docs
saying wsl.conf is enough.  It is not.  MS plainly ignores wsl.conf file and its own
docs.

Setup the task scheduler on startup AFTER LOGIN - 30 seconds delay to run => start.bat
make sure paths are correct in the files.  For basic troubleshooting use the log file
being created at boot.  Running this before login will cause wsl$ mapping to be broken
and will also prevent you from running "code ." inside linux folders.  VS Code will
still work though, just you will ahve to open it form within remote connection though.

Assumption is you run docker, hyper V, windows 11 latest version (earleir may or may not
work) Docker used here CE native Linux version, not Docker Desktop.  Desktop might need
another approach.  Possibly even simpler as in CE it does not start WSL nor Docker
automatically.  Windows network is set to DHCP - you can bind mac for static address or
write powershell to give it fixed address.

Keep in mind, if you do wsl --shutdown manually, you need to run sh script again.

