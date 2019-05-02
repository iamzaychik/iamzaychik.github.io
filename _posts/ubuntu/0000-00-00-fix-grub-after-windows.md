---
title: Fix Grub after Windows
category: Ubuntu
date: 2019-05-02
---

-----

**Installing Windows after Ubuntu is not the recommended process for a dual boot Windows and Ubuntu system, but it is possible.**

1. Make sure that the 50GB free space is available, resizing your Ubuntu by using gParted if necessary.

2. Use gParted or Disk Utility to format the the free space as NTFS, this prevents Windows 7 from creating an additional boot partition in addition to the "C" drive.

3. Boot to the Windows DVD installer and install Windows on the NTFS partition. Upon reboot, Windows will automatically boot and you won't see the grub menu allowing you to choose Ubuntu, because the Windows bootloader has replaced grub.

4. Run Ubuntu from LiveCD or LiveUSB and install boot-repair.
_To install boot-repair, open up a terminal by pressing Ctrl+Alt+T and type the following commands:_
```bash
$ sudo add-apt-repository ppa:yannubuntu/boot-repair && sudo apt-get update
$ sudo apt-get install -y boot-repair && boot-repair
```

5. After installation, boot-repair will automatically launch, if is doesn't, launch it via Dash.
6. Make sure to select recommended repair to repair grub. Reboot and that's it.
7. You should now have a Grub menu on boot, allowing you to choose from Ubuntu, memtest, and Windows 7

-----

[Source](https://askubuntu.com/a/158319)

-----