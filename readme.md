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

Setup the task scheduler on startup AFTER LOGIN - 30 seconds delay to run => start.bat
make sure paths are correct in the files.  For basic troubleshooting use the log file
being created at boot.  Running this before login will cause wsl$ mapping to be broken
and will also prevent you from running "code ." inside linux folders.  VS Code will
still work though, just you will ahve to open it form within remote connection though.

Assumption is you run hyper V, windows 11 latest version (earleir may or may not work).
Windows network is set to DHCP - you can bind mac for static address or write powershell
to give it fixed address.

Keep in mind, if you do wsl --shutdown manually, you need to run sh script again.


### Linux

#### Network Interface

Inside a root shell in the WSL2 distribution, install the appropriate package for
configuring networking and then configure it as appropriate for your LAN.  For example,
in Debian based distributions, such as Ubuntu, the package is `ifupdown`:

	# apt update
	# apt install -y "ifupdown" "resolvconf"

Then edit `/etc/network/interfaces` to configure the network.  For example:

    auto eth0
    iface eth0 inet static
      address 192.168.1.10/24
      gateway 192.168.1.1
      dns-nameserver 192.168.1.1
      dns-nameserver 8.8.8.8
      dns-nameserver 8.8.4.4
      dns-search example.com

You may also need to modify the command to bring up the network in the
`./configureWSL2Net.sh` script when using other distributions.

#### DNS Nameserver Resolution

Disable DNS nameserver resolution configured by WSL2 in `%USERPROFILE%\.wslconfig`:

    ...
    [network]
	...
    generateResolvConf = false
    ...

This option is broken in WSL2 at the time of this writing so this option doesn't have
any effect and there's a workaround in `./configureWSL2Net.sh`, but better to set it if
it's ever fixed in WSL2.
