# Windows 10 VM

This repo contains a script that automatically creates a Windows 10 Virtual
Machine under Arch Linux. It's main purpose is to interop with
[Winapps](https://github.com/winapps-org/winapps) to run Windows applications on
Linux without any trouble.

If you want to setup a Windows VM by yourself follow
[this](https://github.com/winapps-org/winapps/blob/main/docs/libvirt.md) guide.

## Features

- (Nearly) Fully automated VM setup
- Driver installation
- Guest tools installation
- Bloatware removal
- Dark mode

## Requirements

```bash
sudo pacman -S --needed virt-manager qemu-guest-agent dialog freerdp iproute2 libnotify openbsd-netcat cdrtools
```

To install the `virtio-win` driver you can use an AUR helper of your choice:

```bash
paru -S virtio-win
```

The driver will be installed to `/var/lib/libvirt/images/virtio-win.iso`. This
driver is required for disks to be correctly recognised.

The script in this repo assumes that you have previously downloaded a
[Windows 10 ISO](https://www.microsoft.com/en-us/software-download/windows10ISO)
and placed it in `/var/lib/libvirt/images/win10.iso`.

## Usage

The following command will run the script that will setup the VM.

> [!NOTE]
> By default the image is 60GB if you want a bigger image change it inside the
> `qemu.sh` script.

```bash
./qemu.sh
```

After that you'll have to open the virual machine and press any key to contiune
setup. If you don't do that the VM will boot into UEFI firmware and you'll have
to manually select the drive to boot (it's the first CD-ROM drive).

> [!NOTE]
> This script doesn't enable RDP, so after the setup is completed you'll have to
> enable it manually in the settings.

Administrator account with the following is created with this install:

- Username: Admin
- Password: 1234

## Useful links

- [Windows ISO](https://www.microsoft.com/en-us/software-download/windows10ISO)
- [Answer file generator](https://schneegans.de/windows/unattend-generator/)
- [General unattend file documenatation](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/update-windows-settings-and-scripts-create-your-own-answer-file-sxs?view=windows-10)
- [Unattend file components documenatation](http://technet.microsoft.com/en-us/library/ff699038.aspx)
