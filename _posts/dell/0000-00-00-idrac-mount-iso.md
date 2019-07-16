---
title: IDRAC. Mount iso
category: Dell
date: 2019-07-16
---

-----

**If you don't have Java:**
```bash
System > Console/Media > Configuration > Plug-In Type > change to HTML5
```

-----

**Attach ISO:**
* Launch console
```bash
System > Console/Media > Virtual Console and Virtual Media > Launch Virtual Console
```

* Configure source in the new window 
```bash
Virtual media > Launch virtual media > Add image > Select your ISO (or CD/DVD install media) file > Put a check mark in the "Mapped" check box on the device you wish to use
```

* Start or reboot server

* Press F11 to enter the BIOS boot manager menu and select “Virtual Media” as the boot device

-----

[Source](https://community.spiceworks.com/how_to/2725-how-to-install-any-os-without-cd-dvd-or-usb-on-dell-servers-with-idrac)

[Source 2](https://xorl.wordpress.com/2011/07/31/how-to-use-dell-idrac-virtual-media/)

-----