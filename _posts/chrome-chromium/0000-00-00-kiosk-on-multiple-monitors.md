---
title: Kiosk on multiple monitors
category: Chrome, Chromium
date: 2019-05-07
---

-----

**First monitor:**
```bash
$ google-chrome --app="https://google.com/" --kiosk --window-position=0,0 --window-size=1920,1080 --user-data-dir=$HOME/.chrome-1/ &
```

**Second monitor:**
```bash
$ google-chrome --app="https://facebook.com/" --kiosk --window-position=1921,0 --window-size=1920,1080 --user-data-dir=$HOME/.chrome-2/ &
```

-----

[Source](https://vitich.kiev.ua/chrome-kiosk-on-multiple-monitors)

-----