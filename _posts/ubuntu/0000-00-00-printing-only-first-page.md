---
title: Printing only first page
category: Ubuntu
date: 2019-04-15
---

_Вся річ у тому, що Ubuntu завантажує для usb принтерів модуль ядра usblp.ko_
_ Він необхідний для роботи багатьох принтерів, наприклад Canon LBP серії та інших._
_ Але абсолютно не потрібен для Xerox, наприклад._
_ Саме його автоматичне завантаження приводить до такої проблеми._

-----
**1. Після підключення принтера:**
```bash
$ lsmod | grep usblp
```

**2. Якщо модуль завантажений - примусово відключаємо його:**
```bash
$ rmmod usblp
```

**3. Забороняємо автоматично завантажувати модуль:**
```bash
$ echo "blacklist usblp" >> /etc/modprobe.d/blacklist
```

-----

[Source](http://forum.ubuntu.ru/index.php?topic=290261.0)

-----