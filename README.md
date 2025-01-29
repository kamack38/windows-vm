# Windows 10 VM

This repo contains a script that automatically creates a Windows 10 Virtual
Machine under Arch Linux. Its main purpose is to be used with
[Winapps](https://github.com/winapps-org/winapps) to run Windows applications on
Linux without any trouble.

If you want to set up a Windows VM by yourself, follow
[this](https://github.com/winapps-org/winapps/blob/main/docs/libvirt.md) guide.

## Features

- (Nearly) Fully automated VM setup
- Driver installation
- Guest tools installation
- Bloatware removal
- Dark mode
- Enable RDP

## Requirements

```bash
sudo pacman -S --needed virt-manager qemu-guest-agent dialog freerdp iproute2 libnotify openbsd-netcat cdrtools
```

To install the `virtio-win`, driver you can use an AUR helper of your choice:

```bash
paru -S virtio-win
```

The driver will be installed to `/var/lib/libvirt/images/virtio-win.iso`. This
driver is required for disks to be correctly recognised.

The script in this repo assumes that you have previously downloaded a
[Windows 10 ISO](https://www.microsoft.com/en-us/software-download/windows10ISO)
and placed it in `/var/lib/libvirt/images/win10.iso`.

> [!WARNING]
> By default the VM image will pin the 12th, 13th, 14th and 15th threads, so
> this means it wiil not work on CPUs with less than 16 cores. Before creating a
> VM be sure to change them so that you will get the best performance. You can
> follow
> [this guide](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#CPU_pinning).

## Usage

The following command will run the script that will set up the VM.

> [!NOTE]
> By default the image is 60GB if you want a bigger image change it inside the
> `qemu.sh` script.

```bash
./qemu.sh
```

After that, you'll have to open the virtual machine and press any key to
continue setup. If you don't do that, the VM will boot into UEFI firmware and
you'll have to manually select the drive to boot (it's the first CD-ROM drive).

> [!NOTE]
> This script may not enable RDP. In this case you'll have to manually enable it
> in the Windows settings (Settings->System->Remote Desktop).

Administrator account with the following is created with this install:

- Username: Admin
- Password: 1234

## Useful links

- [Windows ISO](https://www.microsoft.com/en-us/software-download/windows10ISO)
- [Answer file generator](https://schneegans.de/windows/unattend-generator/)
- [General answer file documenatation](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/update-windows-settings-and-scripts-create-your-own-answer-file-sxs?view=windows-10)
- [Answer file components documenatation](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/components-b-unattend)
