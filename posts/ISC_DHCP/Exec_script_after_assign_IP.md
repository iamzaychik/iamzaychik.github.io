---
title: Exec script after IP assign
---

-----

У крутецькій дхцп-серверній програмі ISC DHCP зразка 3.1.0 ввели дуже корисну для серця і нирок штуку - можливість виконати скрипт після того, як сервер видасть адресу.
Щоб скористатися цею фічею, необхідно у файлі конфігурації **dhcpd.conf** додати спеціальну секцію:

```
subnet 192.168.1.0 netmask 255.255.255.0 {
option routers 192.168.1.2;
on commit {
set clip = binary-to-ascii(10, 8, ".", leased-address);
set clhw = binary-to-ascii(16, 8, ":", substring(hardware, 1, 6));
execute("/usr/local/sbin/dhcpevent", "commit", clip, clhw);
}
```

Після ключового слова **on** можна вказати, в якому випадку **(commit, release чи expire)** обробляти наші дані.

```
clip - іп клієнта
clhw - мак клієнта
/usr/local/sbin/dhcpevent - сам скрипт
```

-----

* <a href="http://jpmens.net/2011/07/06/execute-a-script-when-isc-dhcp-hands-out-a-new-lease/" target="_blank">Пишуть люди</a>
* <a href="https://kb.isc.org/article/AA-01039/0/Formatting-MAC-addresses-in-dhcpd-or-why-does-binary-to-ascii-strip-leading-zeroes.html" target="_blank">І тут пишуть</a>

-----