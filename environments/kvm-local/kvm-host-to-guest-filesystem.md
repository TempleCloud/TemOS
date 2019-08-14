# Share Folder between Guest and Host

How to mount a `host folder` as a `KVM guest file system`.

---

1.  Configure `/etc/libvirt/qemu.conf`

Configure the QEMU config `/etc/libvirt/qemu.conf`.

Ensure the following:

```
user = "temple"
group = "temple"
dynamic_ownership = 1
```

---

2. Configure KVM Filesystem

Configure filesystem via `virt-manager` or `virsh`.

```
Type        : mount
Driver      : Default
Mode        : Squash
Source path : /tmp/share
Target path : /hostshare
```  

---

3. Mount in Guest

Log into guest, ensure mount path exists and mount as a `9p` filesystem.

```
ssh temple@host-ip
mkdir /tmp/host_files
mount -t 9p -o trans=virtio,version=9p2000.L /hostshare /tmp/host_files
```

---

## Configure Apparmor and SELinux

If necessary configure `SELinux` and/or `AppArmor`.

```
sudo apparmor_status
```

```
getenforce
setenforce 0
cat /etc/selinux/config 
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
* http://blog.azimuthsecurity.com/2012/09/poking-holes-in-apparmor-profiles.html

