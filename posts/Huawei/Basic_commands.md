Title: Huawei. Basic commands
Pub date: 24.02.2015
Category: Huawei S2326-TP, 

_Свят свят свят. Спаси, о Сотона, від цього горя._
-----

**Reset to defaults:**
1. Підключаємося через minicom і вмикаємо світчару в мережу;
2. Чекаємо на рядок: **Press Ctrl+B to enter BOOTROM menu**
3. Жмемо вказані клавіші;
4. Вводимо пароль "www.huawei.com" (може бути "huawei");
5. Бачимо "BOOTROM MENU";
6. Вводимо цифру, яка відповідає пункту **Enter filesystem submenu**;
7. Бачимо "FILESYSTEM SUBMENU";
8. Вводимо цифру, яка відповідає пункту **Delete file from Flash**;
9. Бачимо список файлів в пам'яті:
10. Копіюємо назву свого **.cfg** файла:
11. Вставляємо у рядок: **Please choose the file you want to delete:**, жмемо "Y";
12. Знову бачимо "FILESYSTEM SUBMENU";
13. Вводимо цифру, яка відповідає пункту **Return to main menu**;
14. Знову бачимо "BOOTROM MENU";
15. Вводимо цифру, яка відповідає пункту **Reboot**;

<a href="http://muff.kiev.ua/content/huawei-s2326-sbros-v-defolt">Пишуть люди</a>

-----
**Download configuration via tftp:**
1. Підключаємося через minicom і вмикаємо світчару в мережу;
2. Чекаємо повного завантаження;
3. Вводимо пароль 1234 і підтверджуємо його;
4. Створюємо інтерфейс в дефолтному влані:
`sys
interface vlanif 1
ip address 192.168.1.3 255.255.255.0
quit
quit`
5. Завантажуємо файл з конфігом:
`tftp 192.168.1.2 get huawei.cfg`
6. Вказуємо наш файл для завантаження:
`startup saved-configuration huawei.cfg`
7. Перезавантажуємо комутатор:
`reboot`
**(!) При перезавантаженні буде запит на збереження поточних налаштувань у файл конфігурації, потрібно вибрати N, щоб відмовитися.**
Потім вибираємо **Y**, щоб продовжити перезавантаження.

-----
**Налаштування порта:**
`interface Ethernet0/0/1
mac-limit maximum 1 alarm disable
loopback-detect enable
undo ntdp enable
undo ndp enable
broadcast-suppression 33`

-----

**Вмикаємо діапазон портів:**
`port-group 1
group-member ethernet 0/0/1 to ethernet 0/0/24
undo shutdown`

-----

**Admin-user:**
`[Huawei]user-interface vty 0 4
[Huawei -ui-vty0-4]authentication-mode aaa
[Huawei]aaa //enter into AAA view
[Huawei -aaa]local-user admin123 password cipher admin123 //configure local user admin123, the password is admin123
[Quidway-aaa]local-user admin123 privilege level 15 //configure user admin123 level is 3
[Quidway-aaa]local-user admin123 service-type telnet // configure user admin123 service type telnet`

-----

**SNMP:**

1. Дивимося статус агента:
`display snmp-agent sys-info`

2. Підключаємо SNMP v2 і відключаємо v3:
`snmp-agent sys-info version v2c
undo snmp-agent sys-info version v3`

3. Вказуємо community:
`snmp-agent community write ******`

4. Контактні дані:
`snmp-agent sys-info contact ***@***.**
snmp-agent sys-info location ******`

-----

**Serial number:**
`display elabel`

-----

**Порт**
Помилки на порту:
`SW1-Q2326&gt; display interface-statistics Ethernet 0/0/1`

Очищаємо помилки:
`SW1-Q2326&gt; reset counters interface Ethernet 0/0/1`

-----
**Налаштування часу**

Спочатку потрібно вийти з режиму конфігурації:
`quit`

Поточний час:
`display clock`

Встановити часовий пояс:
`clock timezone Kyiv add 2`

Налаштування літнього часу:
`clock daylight-saving-time Kyiv repeating 03:00 last sat Mar 04:00 last sat Oct 1`
-----

<a title="Пишуть люди" href="http://udatov.blogspot.com/2012/10/800x600-normal-0-false-false-false-ru-x_15.html" target="_blank">Прошивка</a>
<a href="http://it-donnet.ru/quidway2326/" target="_blank">Настройка</a>
-----