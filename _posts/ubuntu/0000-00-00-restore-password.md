---
title: Restore password
category: Ubuntu
date: 2019-04-15
---

-----

1. Reboot your computer
2. Hold `Shift` during boot to start GRUB menu
3. Highlight your image and press `E` to edit
4. Find the line starting with `linux` or `kernel` and append `rw init=/bin/bash` at the end of that line
5. Press `Ctrl+X` to boot
6. Type in `passwd username`
7. Set your password
8. Type in `reboot`. If that doesn't work, hit `Ctrl+Alt+Del`

-----