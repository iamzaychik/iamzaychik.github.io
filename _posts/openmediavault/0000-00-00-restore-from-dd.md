---
title: Restore from dd
category: OpenMediaVault
date: 2026-04-24
---

-----

```bash
# 1️⃣ Підключіть новий USB-диск та визначте його ім'я
lsblk

# 2️⃣ Відновіть розділи
sudo sfdisk /dev/sdX < backup-omv-2025-02-09_15-08-03.sfdisk
# (Замініть `sdX` на потрібний диск!)

# 3️⃣ Розпакуйте резервну копію
zstd -d backup-omv-2025-02-09_15-08-03.ddfull.zst -o backup-omv-restored.dd
zstd -d backup-omv-2025-02-09_15-08-03.espdd.zst -o backup-omv-esp-restored.dd

# 4️⃣ Запишіть основний образ
sudo dd if=backup-omv-restored.dd of=/dev/sdX bs=64K status=progress

# 5️⃣ Запишіть EFI-розділ (якщо є)
sudo dd if=backup-omv-esp-restored.dd of=/dev/sdXY bs=64K status=progress
# (Замініть `sdXY` на EFI-розділ, зазвичай `sdX1`)

# 6️⃣ Перевстановіть GRUB (якщо потрібно)
sudo mount /dev/sdXY /mnt
sudo grub-install --target=x86_64-efi --efi-directory=/mnt --bootloader-id=grub
sudo update-grub

# ⚠ Перевірте та оновіть `fstab` і `grub.cfg`, якщо система не стартує!
```

-----
