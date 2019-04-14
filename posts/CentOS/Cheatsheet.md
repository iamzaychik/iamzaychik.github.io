Title: CentOS. Cheatsheet
Pub date: 04.07.2017
Category: CentOS, 

-----

**Модулі ядра:**
1. Додати модуль ядра до перезавантаження:
`modprobe 8021q`

2. Перевірити, чи модуль завантажився:
`lsmod | grep 8021q`

3. Для того, щоб додати модуль в автозавантаження при старті системи, потрібно створити в папці /etc/modules-load.d файл в форматі ім'я_модуля.conf:
`echo 8021q >> /etc/modules-load.d/8021q.conf`

-----

**Перевірка запущених сервісів:**
**The syntax is as follows for CentOS/RHEL 6.x and older (pre systemd):**
`service --status-all`
`service --status-all | more`
`service --status-all | grep ntpd`
`service --status-all | less`

**The syntax is as follows for CentOS/RHEL 7.x+:**
`systemctl`
`systemctl | more`
`systemctl | grep httpd`
`systemctl list-units --type service`
`systemctl list-units --type mount`

**To list all services:**
`systemctl list-unit-files`

<a href="https://www.cyberciti.biz/faq/check-running-services-in-rhel-redhat-fedora-centoslinux/">Пишуть люди</a>

-----