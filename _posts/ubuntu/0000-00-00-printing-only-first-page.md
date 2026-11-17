---
title: Printing only first page
category: Ubuntu
date: 2019-04-15
---

`Printing only first page on Ubuntu`

*Вся річ у тому, що Ubuntu завантажує для usb принтерів модуль ядра usblp.ko
Він необхідний для роботи багатьох принтерів, наприклад Canon LBP серії та
інших.
Але абсолютно не потрібен для Xerox, наприклад.
Саме його автоматичне завантаження приводить до такої проблеми.*

---

1. Після підключення принтера:

```bash
$ lsmod | grep usblp
```

1. Якщо модуль завантажений - примусово відключаємо його:

```bash
$ rmmod usblp
```

1. Забороняємо автоматично завантажувати модуль:

```bash
$ echo "blacklist usblp" >> /etc/modprobe.d/blacklist
```

---

[Source](http://forum.ubuntu.ru/index.php?topic=290261.0)

---
