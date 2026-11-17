---
title: Mount new disk
category: Ubuntu
date: 2019-04-15
---

*Mount new disk on Ubuntu.*

1. Create folder:

```bash
mkdir /data
```

1. Find HDD identifier:

```bash
fdisk -l
```

1. Open disk editor:

```bash
fdisk /dev/sdx
```

1. Select needed option:

```bash
d ...to delete the current partition
n ...to create a new partition
p ...to specify it as a PRIMARY partition
1 ...to set it as the 1ST primary partition
w ...to write the changes.
```

1. Check new partition:

```bash
fdisk -l
```

1. Format partition:

```bash
mkfs.ext4 /dev/sdx1
```

1. Find partition identifier:

```bash
blkid
```

1. Add partition to /etc/fstab for mount at boot:

```bash
UUID=XXXXX-XXXXX-XXX /data ext4  defaults 0 2
```

1. Mount:

```bash
mount -a
```

1. Check mounts:

```bash
df -h
```

---
