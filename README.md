iPXE boot rom
=============

Creates a more complete iPXE rom than the one bundled with VirtualBox.

Use docker to build:

    docker build -t loader:1 .
    docker run --rm loader:1 > vmname.pxe

To use copy to `~/.VirtualBox/TFTP/vmname.pxe` and enable Network Boot
in VirtualBox `vmname` machine.

VirtualBox will load its own iPXE rom that will fetch the one in
`~/.VirtualBox/TFTP/vmname.pxe` and then this one will fetch iPXE configuration
from file `~/.VirtualBox/TFTP/loader.ipxe`.

This makes loading HTTPS roms possible (native VirtualBox iPXE rom is too
limiting).

For example to load Rancher use this `loader.ipxe` file:

    #!ipxe
    set base-url https://releases.rancher.com/os/latest
    kernel ${base-url}/vmlinuz
    initrd ${base-url}/initrd
    boot

For more details on how VirtualBox handles iPXE see:
https://www.virtualbox.org/manual/ch06.html#nat-tftp
