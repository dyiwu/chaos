---
title: "Clone KVM"
lastmod: 2020-06-24T20:49:27+08:00
tags: ["kvm","clone"]
categories: ["tech"]
---

## Procedures to clone virtual machine
<!--more-->
- List all virtual machine on system
    ```
    $ sudo virsh list --all
    ```

- Suspend virtual machine
    ```
    $ sudo virsh suspend main_node
    ```

- Clone virtual machine main_node to main_node_clone
    ```
    $ sudo virt-clone --connect qemu:///system --original main_node \
     --name main_node_clone --file /var/lib/libvirt/images/main_node_clone.qcow2
    ```

- Reset hostname and root user password.
    ```
    $ sudo virt-sysprep -d main_node_clone  --hostname main_node_clone --root-password password:123456
    ```

- List the operations supported by the virt-sysprep program.
    ```
    $ sudo virt-sysprep --list-operations
    ```

- Resume virtual machine
    ```
    $ sudo virsh resume main_node
    ```

- Start a virtual machine
    ```
    $ sudo virsh start main_node_clone
    ```
#### Reference: [如何克隆一個KVM虛擬機並重置該虛擬機](https://huataihuang.gitbooks.io/cloud-atlas/virtual/kvm/startup/how_to_clone_a_kvm_virtual_machines_and_reset_the_vm.html)
