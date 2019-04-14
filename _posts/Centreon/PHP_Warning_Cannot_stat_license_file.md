Title: Centreon. PHP Warning: Cannot stat license file
Pub date: 14.08.2017
Category: Centreon, 

**Якшо в логах clapi маємо багато помилок:**
`"PHP Warning: Cannot stat license file"`

**Відкриваємо:**
`mcedit /etc/php.d/zendguard.ini`

**І видаляємо рядок:**
`/usr/share/centreon/www/modules/centreon-pp-manager/license`
-----