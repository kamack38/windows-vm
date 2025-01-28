#!/bin/env bash

# Generate autounattend answer file for automated Windows installation
genisoimage -o autounattend.iso -J -r -V "AUTO_WINDOWS" unattend/
sudo mv autounattend.iso /var/lib/libvirt/images/autounattend.iso

# Create a 60GB Windows drive
qemu-img create -f qcow2 /var/lib/libvirt/images/win10.qcow2 60G

virsh define image.xml
virsh start RDPWindows

# Launch VM GUI
virt-manager --connect qemu:///system --show-domain-console RDPWindows & && disown
