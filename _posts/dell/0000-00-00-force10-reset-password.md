---
title: Force10 reset password
category: Dell
date: 2019-04-15
---

-----

* Підключаємося через minicom;
* Вимикаємо і вмикаємо всі модулі живлення;
* Чекаємо, поки з’явиться повідомлення "Hit Esc key to interrupt autoboot: 5" і жмемо Esc, щоб зайти в Boot Loader (uBoot);
* Для того, щоб ігнорувати startup-config, вводимо: `setenv stconfigignore true `(uBoot);
* Зберігаємо зміни: `saveenv `(uBoot);
* Продовжуємо завантаження системи: `boot `(uBoot);
* В конфігурації за замовчуванням аутентифікацію відключено;
* Переходимо в EXEC-mode: `en `(FTOS command line);
* Завантажуємо startup-config: `copy startup-config running-config` (FTOS command line);
* Тепер можна додати нового користувача або змінити дані старого;
* Зберігаємо конфігурацію: `copy running-config startup-config `(FTOS command line);
* Перезавантажуємо комутатор для перевірки: `reload `(FTOS command line);

-----

[Source](http://blog.igics.com/2014/05/recovering-from-forgotten-password-on.html)

-----