Title: Ubuntu. Loop reboot on 16.04 and Radeon
Pub date: 21.08.2017
Category: Ubuntu, 

**Якщо у вас інтегрована відеокарта Radeon і система постійно перезавантажується, то потрібно зробити наступне:**

`mcedit /etc/default/grub`

**В рядок GRUB_CMDLINE_LINUX_DEFAULT додати:**
`radeon.dpm=0`

**Переконфігурувати Grub:**
`update-grub`

-----