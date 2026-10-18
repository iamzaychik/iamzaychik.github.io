---
title: HDMI hotplug
category: Raspberry Pi
date: 2019-04-15
---

---

*Enable HDMI hotplug and audio output on Raspberry Pi.*

- Edit `/boot/config.txt`
- Change HDMI settings:

```bash
# Allow HDMI hotplug
hdmi_force_hotplug=1

# Allow HDMI as sound output^
hdmi_drive=2
```

---

[Source](http://blog.mivia.dk/solved-hdmi-working-raspberry-pi)

---
