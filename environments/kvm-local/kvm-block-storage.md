# Share Folder between Guest and Host


##  Configure libvrt qemu

```
sudo cat /etc/libvirt/qemu.conf
```

---

## Configure KVM Filesystem

```
Type        : mount
Driver      : Default
Mode        : Squash
Source path : /tmp/share
Target path : /hostshare
```  

---

## Mount in Guest

```
mkdir /tmp/host_files
mount -t 9p -o trans=virtio,version=9p2000.L /hostshare /tmp/host_files
```

---

## Configure Apparmor and SELinux

```
sudo apparmor_status
```

---

## References

* https://askubuntu.com/questions/548208/sharing-folder-with-vm-through-libvirt-9p-permission-denied
* https://ubuntuforums.org/showthread.php?t=2380599
* https://help.ubuntu.com/community/KVM/Managing
* http://www.linux-kvm.org/page/9p_virtio
* https://computingforgeeks.com/how-to-mount-vm-virtual-disk-on-kvm-hypervisor/
* https://dustymabe.com/2012/09/11/share-a-folder-between-kvm-host-and-guest/
* https://xapax.github.io/blog/2017/05/09/sharing-files-kvm.html


