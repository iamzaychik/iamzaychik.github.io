Title: Alcatel. Configuration via TFTP
Pub date: 17.07.2015
Category: Alcatel OS 6850/E, 

_Злив, залив, сів, сидиш, щастя._

-----

**Збереження конфігурації:**

1. Дивимося список файлів в папці working:
`-> ls working`

2. Заливаємо файл налаштувань boot.cfg на tftp-server:
`-> tftp ***.***.***.*** put source-file working/boot.cfg destination-file boot.cfg`

3. Дивимося список файлів в папці network:
`-> ls network`

4. Заливаємо файл з даними корустувачів userTable5 на tftp-server:
`-> tftp ***.***.***.*** put source-file network/userTable5 destination-file userTable5`

-----

**Відновлення конфігурації:**

1. Видаляємо поточний boot.cfg:
`-> delete working/boot.cfg`

2. Завантажуємо нові налаштування:
`-> tftp ***.***.***.*** get source-file boot.cfg destination-file working/boot.cfg`

3. Видаляємо поточний userTable:
-> delete network/userTable5

4. Завантажуємо нову базу користувачів:
`-> tftp ***.***.***.*** get source-file userTable5 destination-file network/userTable5`

5. Перезавантажуємо комутатор з новими налаштуваннями:
`-> reload working no rollback-timeout`

-----