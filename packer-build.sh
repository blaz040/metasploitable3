#!/bin/bash
packer build -on-error=ask -only=proxmox-iso -var-file=./packer/templates/variables.json ./packer/templates/windows_2008_r2.json