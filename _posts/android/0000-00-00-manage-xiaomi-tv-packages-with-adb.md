---
title: Manage Xiaomi TV packages with ADB
category: Android
date: 2026-10-18
---

*Disable unwanted Xiaomi TV applications without removing them from the system image.*

### Connect to the TV

Enable network debugging on the TV, then connect from the same network:

```bash
$ adb connect 192.168.0.100
$ adb shell pm list packages
```

### Disable or enable a package

Replace `<PACKAGE_NAME>` with the package to manage:

```bash
$ adb shell pm disable-user --user 0 <PACKAGE_NAME>
$ adb shell pm enable --user 0 <PACKAGE_NAME>
```

Example:

```bash
$ adb shell pm disable-user --user 0 com.mitv.tvhome.atv
```

- Disabled packages remain installed.
- Re-enable a package with `pm enable`.
- Test one package at a time.

### Uninstall a package for the current user

```bash
$ adb shell pm uninstall -k --user 0 com.google.android.music
```

- `-k` keeps the package data.
- `--user 0` limits the change to the primary user.
- Reinstalling system packages may require a factory reset or firmware tools.

### Identify common Xiaomi TV packages

- `com.mitv.tvhome.atv` — PatchWall home screen.
- `com.xiaomi.mitv.updateservice` — PatchWall update service.
- `com.mediatek.wwtv.tvcenter` — Live TV and external sources.
- `com.xiaomi.mitv.tvmanager` — TV manager.
- `com.miui.tv.analytics` — MIUI TV analytics.
- `com.xiaomi.statistic` — Xiaomi statistics.
- `com.google.android.music` — Google Music.
- `com.google.android.videos` — Google Movies.
- `com.google.android.play.games` — Google Play Games.
- `com.android.providers.contacts` — Contacts storage.
- `com.google.android.feedback` — Google Play feedback.
- `com.mitv.dream` — Mi screen saver.

### Disable the default launcher components

```bash
$ adb shell pm disable-user --user 0 com.google.android.tvlauncher
$ adb shell pm disable-user --user 0 com.google.android.leanbacklauncher.recommendations
$ adb shell pm disable-user --user 0 com.google.android.leanbacklauncher
$ adb shell pm disable-user --user 0 com.google.android.tungsten.setupwraith
```

- Keep an alternative launcher available before disabling the default.
- Avoid disabling Live TV if HDMI inputs are required.
