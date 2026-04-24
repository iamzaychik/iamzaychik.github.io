---
title: Remove esm-apps notice
category: Ubuntu
date: 2026-04-24
---

-----

> The following security updates require Ubuntu Pro with 'esm-apps' enabled" when updating Ubuntu 22.04

```bash
mkdir -p ~/relocated_apt
sudo mv /etc/apt/apt.conf.d/20apt-esm-hook.conf ~/relocated_apt/.
```

-----
