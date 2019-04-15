---
title: Several interfaces
categories: Squid
date: 2019-04-15
---

_Коли один чайник наливає в багато чашок - це добре._
_Але коли один Squid дає тобі багато різних IP - це геть прекрасно!_

-----

**Для цього нам треба:**
<ol>
 	*Кілька інтерфейсів з real-ip, типу 78.137.1.101, 78.137.1.102, 78.137.1.103...
 	*Встановлений Squid3
 	*Слідуючий конфіг:
</ol>
`auth_param basic program /usr/lib/squid3/basic_ncsa_auth /etc/squid3/users - шлях до файла паролів і тип авторизації
auth_param basic realm Squid.proxy - ім'я для відображення
acl authenticated proxy_auth REQUIRED - дозволяємо тільки тих, хто є в файлі
acl localhost src MAIN_IP - acl для роботи Squid RealTime stat
# ACL'и для IP
acl ip1 myip 78.137.1.101
acl ip2 myip 78.137.1.102
acl ip3 myip 78.137.1.103
# Прив'язуємо ACL до IP
tcp_outgoing_address 78.137.1.101 ip1
tcp_outgoing_address 78.137.1.102 ip2
tcp_outgoing_address 78.137.1.103 ip3
#Дозволяємо http-proxy для авторизованих користувачів
http_access allow localhost
http_access allow authenticated
http_port PORT
#MISC
debug_options ALL,0
netdb_filename none`

-----

_Тепер ми маємо запущений Squid на всіх перечислених інтерфейсах._
_ Після авторизації у нас буде той IP, через який відбулася авторизація._

-----