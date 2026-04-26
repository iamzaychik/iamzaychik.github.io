---
title: Cheatsheet
category: Proxmox
date: 2026-04-24
---

-----

* Alpine samba mount:

```bash
$ apk add openssh cifs-utils nano

$ sed -ri 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

$ service sshd start
$ rc-update add sshd
$ rc-update add netmount boot

$ echo "//192.168.0.2/Share /mnt/share cifs credentials=/root/.smb-credentials,iocharset=utf8,noperm 0 0" >> /etc/fstab

$ echo "user=readonly
password=1" > /root/.smb-credentials

$ mkdir /mnt/share
```

-----

* Check CPU updates:

```bash
$ journalctl -k | grep -E "microcode: microcode"
```

-----

* Add space to VM/CT:

```bash
$ qm resize 105 scsi0 +6G
$ pct resize 102 rootfs +10G
```

-----

* Pass disk to VM:

```bash
$ lsblk -o +MODEL,SERIAL,WWN
$ qm set 592 -scsi2 /dev/disk/by-id/ata-STCHCJCJCKKC-MMEJEN_3AFAV334
```

-----

* Remove thin-lvm:

```bash
# Remove pve-data logical volume.
$ lvremove /dev/pve/data -y

# Create it again with a new size.
$ lvcreate -L 650G -n data pve -T

# Give pve-root all the other size.
$ lvresize -l +100%FREE /dev/pve/root

# Resize pve-root file system
$ resize2fs /dev/mapper/pve-root

$ xfs_growfs /dev/mapper/pve-root
```

-----
