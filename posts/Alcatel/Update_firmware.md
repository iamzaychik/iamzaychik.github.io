---
title: Update firmware
---

[caption id="attachment_565" align="aligncenter" width="512"]<img class="wp-image-565 size-full" src="https://zaychik.info/wp-content/uploads/bleat.jpg" alt="bleat" width="512" height="317" /> Онови прошивку, бляць![/caption]

-----



1. * <a href="http://support.alcadis.nl/downloads/Alcatel-Lucent/OmniSwitch/OS6850%20-%20EOS/" target="_blank">Скачай</a> прошивку, бляць!

2. Налаштуй * <a href="https://zaychik.info/alcatel/">менеджмент-інтерфейс</a> на Alcatel та увімкни ftp:
`ip service ftp
aaa authentication ftp local`

3. Встанови FileZilla, бляць:
`sudo apt-get install filezilla`

4. Зайди на Alcatel через FileZilla та залий файли прошивки сюди, бляць:
`/flash/working`

5. Перезавантаж Alcatel, бляць:
`reload working no rollback-timeout`

6. Cинхронізуй стек, бляць:
`copy working certified flash-synchro`

7. Перевір версію прошивки, бляць:
`show microcode`

-----