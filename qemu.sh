#!/bin/env bash

# Requires: cdrtools and virt-manager

# Generate autounattend answer file for automated Windows installation
genisoimage -o autounattend.iso -J -r -V "AUTO_WINDOWS" unattend/
sudo mv autounattend.iso /var/lib/libvirt/images/autounattend.iso

qemu-img create -f qcow2 /var/lib/libvirt/images/win10.qcow2 60G
virsh define image.xml
virsh start RDPWindows
