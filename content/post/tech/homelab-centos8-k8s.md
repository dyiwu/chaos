---
title: "K8s on Centos8 Home Lab"
date: 2020-05-15T14:39:39+08:00
tags: ["homelab","k8s","centos8"]
categories: ["tech"]
toc: true

---
This home lab is going to build a CentOS 8 KVM host on bare matel and then 3 KVM guest nodes be form up as a k8s cluster.

<!--more-->
## Centos8 on bare metal
### KVM host base environment
- Select ***Workstation*** as base environment for this Centos8 VM host with following configuration. 
    - Intel(R) Core(TM) i7 CPU       Q 720  @ 1.60GHz
    - 8 GB memory
    - Disk partitions 
    ```
    # fdisk -l  /dev/sda
    Disk /dev/sda: 698.7 GiB, 750156374016 bytes, 1465149168 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 4096 bytes
    I/O size (minimum/optimal): 4096 bytes / 4096 bytes
    Disklabel type: dos
    Disk identifier: 0xc2d42c2b

    Device     Boot    Start        End    Sectors   Size Id Type
    /dev/sda1  *        2048    4196351    4194304     2G 83 Linux
    /dev/sda2        4196352   37750783   33554432    16G 82 Linux swap / Solaris
    /dev/sda3       37750784 1465147391 1427396608 680.7G 83 Linux

    # df -TH|grep -e Size -e sda
    Filesystem     Type      Size  Used Avail Use% Mounted on
    /dev/sda3      xfs       731G   11G  721G   2% /
    /dev/sda1      ext4      2.1G  214M  1.8G  12% /boot

    # cat /proc/swaps
    Filename                Type            Size    Used    Priority
    /dev/sda2               partition       16777212        0       -2

    ```
#### Reference: [How to Install CentOS 8](https://linoxide.com/distros/how-to-install-centos/)

### br0 Network Bridge creation
- Check connections.
    ```
    $ sudo nmcli connection show 
    NAME                UUID                                  TYPE      DEVICE
    Wired connection 1  492d853c-ab48-4073-9f57-c781b024d0d0  ethernet  ens1
    DrayTek2920n 1      c4c685cf-e26f-4694-927c-e5c87213a445  wifi      wlp68s0b1
    virbr0              52d52d47-a289-4beb-95bf-b9749e78522f  bridge    virbr0
    ```
- Bridge Network Configuration
    ```
    # cat /etc/sysconfig/network-scripts/ifcfg-br0
    DEVICE=br0
    TYPE=Bridge
    NAME=br0
    DELAY=0
    STP=off
    ONBOOT=yes
    IPADDR=192.168.1.120
    NETMASK=255.255.255.0
    GATEWAY=192.168.1.1
    BOOTPROTO=none
    DEFROUTE=yes
    NM_CONTROLLED=yes
    IPV6INIT=no
    DNS1=192.168.1.1
    DNS2=168.95.192.1
    DNS3=8.8.8.8
    ```
- Interface configuration
    ```
    # cat /etc/sysconfig/network-scripts/ifcfg-ens1
    DEVICE=ens1
    TYPE=Ethernet
    NAME=ens1
    ONBOOT=yes
    BRIDGE=br0
    UUID=492d853c-ab48-4073-9f57-c781b024d0d0
    ```
- Reboot system to confirm that bridging is working.
    ```
    # reboot
    ```
- Once rebooted, verify the settings.
    ```
    # nmcli connection show
    NAME            UUID                                  TYPE      DEVICE
    br0             d2d68553-f97e-7549-7a26-b34a26f29318  bridge    br0
    DrayTek2920n 1  c4c685cf-e26f-4694-927c-e5c87213a445  wifi      wlp68s0b1
    virbr0          e34ecdf4-6be2-442c-b37a-54e4950e5999  bridge    virbr0
    ens1            492d853c-ab48-4073-9f57-c781b024d0d0  ethernet  ens1

    # ifconfig ens1
    ens1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        ether 70:5a:b6:9a:52:57  txqueuelen 1000  (Ethernet)
        RX packets 3483  bytes 293433 (286.5 KiB)
        RX errors 0  dropped 7  overruns 0  frame 0
        TX packets 628  bytes 69522 (67.8 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 17

    # ifconfig br0
    br0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.120  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::725a:b6ff:fe9a:5257  prefixlen 64  scopeid 0x20<link>
        ether 70:5a:b6:9a:52:57  txqueuelen 1000  (Ethernet)
        RX packets 3354  bytes 204810 (200.0 KiB)
        RX errors 0  dropped 1616  overruns 0  frame 0
        TX packets 640  bytes 70750 (69.0 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
    ```
#### Reference: [How To Create a Linux Network Bridge on RHEL 8 / CentOS 8](https://computingforgeeks.com/how-to-create-a-linux-network-bridge-on-rhel-centos-8/)

### Install KVM
In here, we will like to go through the steps to install the latest release of KVM hypervisor on Centos 8. This will include the installation of KVM management tools – libguestfs-tools.
- Ensure host CPU has Intel VT or AMD-V Virtualization extensions
    ```
    # cat /proc/cpuinfo | egrep "vmx|svm"|head -1
    flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 popcnt lahf_lm pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid dtherm ida flush_l1d

    # lscpu | grep Virtualization
    Virtualization:      VT-x
    ```
- Install KVM / QEMU on RHEL/ CentOS 8
KVM packages are distributed on RHEL 8 via AppStream repository. Install KVM on your RHEL 8 server by running the following commands:
    ```
    # yum update
    # yum install @virt
    ```
- After installation, verify that Kernel modules are loaded.
    ```
    # lsmod | grep kvm
    kvm_intel             290816  0
    kvm                   761856  1 kvm_intel
    irqbypass              16384  1 kvm
    ```
- Also install useful tools for virtual machine management.
    ```
    # dnf -y install virt-top libguestfs-tools
    ```
- Start and enable KVM daemon
By default, KVM daemon libvirtd is not started, start the service using the command:
    ```
    # systemctl enable --now libvirtd
    # systemctl status libvirtd.service
    ● libvirtd.service - Virtualization daemon
       Loaded: loaded (/usr/lib/systemd/system/libvirtd.service; enabled; vendor preset: enabled)
       Active: active (running) since Sat 2020-05-16 08:17:51 CST; 1h 28min ago
         Docs: man:libvirtd(8)
               https://libvirt.org
     Main PID: 1365 (libvirtd)
        Tasks: 17 (limit: 32768)
       Memory: 51.4M
           CGroup: /system.slice/libvirtd.service
               └─1365 /usr/sbin/libvirtd
    ```
- Install Virtual machine Manager GUI – Optional
Install the virt-manager tool which allows us to manage Virtual Machines from a GUI.
    ```
    # yum -y install virt-manager
    ```

#### Reference: [How To Install KVM on RHEL 8 / CentOS 8 Linux](https://computingforgeeks.com/how-to-install-kvm-on-rhel-8/)

### Using ***libvirtd*** but don't want ***virbr0***
On a Linux host server, the virtual network switch shows up as a network interface. The default one, created when the libvirt daemon is first installed and started, shows up as virbr0. It will act as a gateway for the VMs to route traffic. libvirtd will also insert iptables rules in iptable configuration for proper routing/natting of VM packets.

If we don't want to use libvirtd service, we can stop the same which will remove all these network configurations from the system for virbr0 interface.

But in our case scenario, libvirtd service will be kept running regarding this bare metal system is acting as KVM host but we have br0 setup to let guest VMs use it, so we will remove the virbr0 interface. Follow the steps below to remove the virbr0 interface.

- List the default network set-up for the virtual machines
    ```
    # virsh net-list
     Name                 State      Autostart     Persistent
    ----------------------------------------------------------
     default              active     yes           yes
    ```
- Destroy the network default
    ```
    # virsh net-destroy default
    Network default destroyed
    ```
- Permanently remove the default vitual network from the configuration.
    ```
    # virsh net-undefine default
    Network default has been undefined
    ```
- Verify it in the ifconfig or ip command output.
    ```
    # ifconfig virbr0
    virbr0: error fetching interface information: Device not found

    # nmcli connection show
    NAME            UUID                                  TYPE      DEVICE
    br0             d2d68553-f97e-7549-7a26-b34a26f29318  bridge    br0
    DrayTek2920n 1  c4c685cf-e26f-4694-927c-e5c87213a445  wifi      wlp68s0b1
    ens1            492d853c-ab48-4073-9f57-c781b024d0d0  ethernet  ens1
    ```
#### Reference: [How to Remove virbr0 and lxcbr0 Interfaces on CentOS/RHEL 6,7](https://www.thegeekdiary.com/how-to-remove-virbr0-and-lxcbr0-interfaces-on-centos-rhel-5-and-rhel-7/)


-------

- virsh commands cheatsheet to manage KVM guest virtual machines
https://computingforgeeks.com/virsh-commands-cheatsheet/

- cockpit with Virtual Machines
https://cockpit-project.org/
https://cockpit-project.org/guide/latest/feature-virtualmachines.html#feature-virtualmachines-systemaccess

- How to Install a Kubernetes Cluster on CentOS 8
https://www.tecmint.com/install-a-kubernetes-cluster-on-centos-8/

