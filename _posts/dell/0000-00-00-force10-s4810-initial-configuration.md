---
title: Force10 S4810 initial configuration
category: Dell
date: 2019-04-15
---

-----

**1. Clearing the Current Configuration on switch:**
`Force10>
Force10>enable
Force10#delete startup-config
Proceed to delete startup-config [confirm yes/no]yes
Force10#reload
System configuration has been modified. Save? [yes/no]no
Proceed with reload [confirm yes/no]yes `



**2. Disable Jumpstart Mode and set normal boot mode:**
Jumpstart-mode
Jumpstart (BMP) mode is the default boot mode configured for a new switch arriving from Dell Force10. This mode obtains the FTOS image and configuration file from a network source (DHCP server and file server).
When the force10 is reloaded it always starts with thtis image if its not disabled, as I found after setting a few parameters and having to end my afternoon at work with a reset switch.

`FTOS# reload-type normal-reload`

**3. Upgrade the FTOS and Uboot Version:**
`#Upgrade system ftp: A:
Address or name of remote host []: 192.168.176.60
Source file name []: FTOS-SE-9.1.0.0.bin
User name to login remote host: force10
Password to login remote host:
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Erasing Sseries Primary Image, please wait`

**4. Setting the switch hostname, and date and time:**
First we can set the hostname, which appears in prompts at the keyboard, and the timezone and corresponding time and date in the software clock, and then send that information to the hardware clock ("calendar") so that it survives a re-boot.
Note added later: setting a hostname can be misleading within a stack. If the switch becomes part of a stack, not the master, then it adopts the hostname of the stack master, and this is written into the startup-config file and thus retained even if the power is removed from the switch, the stacking cable removed, and then power restored. This could be a bug (as of version 8.3.10.2). Consequently where switches might be stacked, it could be more sense not to set a hostname, but to rely on the stack-unit number (visible in the first page of show running-config), or the assigned management IP address, as a means of verification of which switch you are managing. Alternatively, keep a back-up of the original configuration, see later section, so that it can be restored if de-stacked.

`> enable
# config
(conf)# hostname mychosenname
(conf)# clock timezone UTC 0
(conf)# exit
# clock set hh:mm:ss dd month yyyy
# clock update-calendar
# show clock
# show calendar
# write mem `

**5. Disable Logging:**
Disable all logging except on the console: `no logging`
Disable logging to the logging buffer: `no logging buffer CONFIGURATION`
Disable logging to terminal lines: `no logging monitor CONFIGURATION`
Disable console logging: `no logging console CONFIGURATION`

**6. Stacking preliminaries:**
If a particular S4810 might be part of a stack, sooner or later, some preliminary settings are best done now. You can set the stack-number to some value 0-11, in place of the stand-alone default of 0. This avoids the stack master dynamically re-assigning the stack-number of a joined stack-member if there is a number conflict/clash. If the switches have some sort of external label number anyway, this would be a good choice, so for my switch number 3:

`# show system stack-unit 0
# stack-unit 0 renumber 3
(prompts and reboots)
# show system stack-unit 3
# show system brief `

NOTE: changing the stack-unit number causes a reload of the firmware, ie after the renumber command above, even if the switch is currently standalone!
NOTE: the stack-unit number appears to be recorded in flash memory in a hidden location, and not in the startup-config file.

**7. Enable SSH:**
`ip ssh server enable
ip ssh server version 2`

**8. Configuring an IP address on the management ethernet port:**
The management ethernet port is located below the console RJ45 port. It supports 100Mb/s connections (and probably others). I needed to configure it so that I could download new software, and so that I could later remotely login to the switch via a connection to that port. So it needed to be configured with an IP address and to be cabled to the corresponding network. The IP address and network can of course be any network suitable for administration: not necessarily related to the network handled by the switch. Here's an example with a slot-number of 3 (see previous section about slot-numbers):

`# enable
# config
(conf)# interface man 0/0
(conf-if-ma-3/0)# ip address a.b.c.d/24
(conf-if-ma-3/0)# show config
(conf-if-ma-3/0)# exit
(conf)# exit
# write mem (or reload, and reply yes to Save question)`

-----

* <a href="http://sillymachines.blogspot.com/2013/09/force10-s4810-initial-configuation.html" target="_blank">Пишуть люди</a>

-----