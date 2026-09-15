#!/bin/bash

PACKER_LOG=1
PACKER_LOG_PATH="./packer-debug.log"
export PACKER_LOG PACKER_LOG_PATH
packer build -on-error=ask -only=proxmox-iso -var-file=./packer/templates/variables.json ./packer/templates/windows_2008_r2.json 