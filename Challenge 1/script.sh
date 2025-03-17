#!/bin/bash

read -p "Ingresa el nombre de la máquina virtual: " name
read -p "Ingresa el tipo de sistema operativo: " OSname
read -p "Ingresa el número de CPUs: " CPUnumber
read -p "Ingresa el tamaño de la memoria RAM en GB: " RAMamount
read -p "Ingresa el tamaño de la memoria VRAM en MB: " VRAMamount
read -p "Ingresa el tamaño del disco duro en GB: " HardDisk
read -p "Ingresa el nombre del controlador SATA: " SATAname
read -p "Ingresa el nombre del controlador IDE: " IDEname

if [[ "$OSname" == 'Linux' || "$OSname" == 'linux' ]]; then 

    MBRAMamount=$((RAMamount * 1024))
    MBHardDisk=$((HardDisk * 1024))

    # echo "$MBRAMamount"
    # echo "$MBHardDisk"

    vboxmanage createvm --name "$name" --ostype Linux_64 --registe
    vboxmanage  modifyvm "$name" --cpus "$CPUnumber" --memory "$MBRAMamount" --vram "$VRAMamount"

    DiskPath="$HOME/VirtualBox VMs/$VM_NAME/$VM_NAME.vdi"
    vboxmanage createhd --filename "$DiskPath" --size "$MBHardDisk" --variant Standard

    vboxmanage storagectl "$name" --name "$SATAname" --add sata --bootable on
    vboxmanage storageattach "$name" --storagectl "$SATAname" --port 0 --device 0 --type hdd  --medium "$DiskPath"

    vboxmanage storagectl "$name" --name "$IDEname" --add ide

    VBoxManage showvminfo "$name"

    echo "Máquina Vitual Creada con Exito"

    exit 1

else

    echo "La Máquina Virtual debe ser Linux"

fi