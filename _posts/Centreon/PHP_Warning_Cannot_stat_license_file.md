---
title: PHP Warning Cannot stat license file
categories: Centreon
date: 2019-04-15
---

**Якшо в логах clapi маємо багато помилок:**
`"PHP Warning: Cannot stat license file"`

**Відкриваємо:**
`mcedit /etc/php.d/zendguard.ini`

**І видаляємо рядок:**
`/usr/share/centreon/www/modules/centreon-pp-manager/license`
-----