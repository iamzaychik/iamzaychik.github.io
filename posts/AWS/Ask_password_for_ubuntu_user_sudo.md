---
title: AWS. Ask password for ubuntu user sudo
---

-----

**Для того, щоб при підвищенні привілеїв при використанні sudo з користувача ubuntu потрібно було вводити пароль:**

1. Налаштовуємо пароль для користувача ubuntu:
`passwd ubuntu`

2. Змінюємо налаштування cloud провайдера:
`cat /etc/sudoers.d/90-cloud-init-users`
`ubuntu ALL=(ALL) ALL`

-----