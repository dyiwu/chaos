---
title: "K8s on Centos8 Home Lab"
date: 2020-05-15T14:39:39+08:00
tags: ["homelab","k8s","centos8"]
categories: ["tech"]

---
This home lab is going to build a CentOS 8 KVM host on bare matel and then 3 KVM guest nodes be form up as a k8s cluster.

<!--more-->
## Instll Centos8 on bare metal machine
### Base environment of KVM host
- Select ***Workstation*** as base environment for this Centos8 VM host with following configuration. 
    - iCore7 CPU
    - 8 GB memory
    - xxx GB disk
        -
        -
        -
        -

After that install KVM on it.
### KVM installation


Reference:
- [How to Install CentOS 8](https://linoxide.com/distros/how-to-install-centos/)
- [How To Install KVM on RHEL 8 / CentOS 8 Linux](https://computingforgeeks.com/how-to-install-kvm-on-rhel-8/)
-------
- Install KVM on CentOS / RHEL / Ubuntu / Debian / SLES / Arch Linux
https://computingforgeeks.com/install-kvm-centos-rhel-ubuntu-debian-sles-arch/


- virsh commands cheatsheet to manage KVM guest virtual machines
https://computingforgeeks.com/virsh-commands-cheatsheet/

- cockpit with Virtual Machines
https://cockpit-project.org/
https://cockpit-project.org/guide/latest/feature-virtualmachines.html#feature-virtualmachines-systemaccess

- How to Install a Kubernetes Cluster on CentOS 8
https://www.tecmint.com/install-a-kubernetes-cluster-on-centos-8/

