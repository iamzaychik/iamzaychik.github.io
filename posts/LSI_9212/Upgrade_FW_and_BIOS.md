---
title: Upgrade FW and BIOS
---

_LSI 9212 - контролер 6Гбіт SAS HBA з чотирма портами._

-----

**1. Завантажуємо останню версію * <a href="https://www.broadcom.com/support/download-search/?pg=&amp;pf=&amp;pn=SAS+9212-4i4e+Host+Bus+Adapter&amp;po=&amp;pa=&amp;dk=">Package_Pxx_IR_IT_Firmware_BIOS_for_MSDOS_Windows</a>**

**2. За допомогою Rufus робимо флешку з DOS**

**3. Копіюємо на флешку файли:**
`sas2flsh.exe` - прошивалка
`214i4eir.bin` - прошивка з підтримкою RAID
`214i4et.bin` - прошивка без підтримки RAID
`mptsas2.rom` - BIOS
_Рекомендую їх перейменувати, щоб було зручніше._

**4.Завантажуємося з флешки**

**5. Дізнаємося SAS-адресу контролера:**
`sas2flsh -o -listsasadd`
_Записуємо його собі або фотографуємо._

**6. Затираємо повністю флеш контролера:**
`sas2flsh -o -e 7`

**7. Заливаємо прошивку і BIOS:**
`sas2flsh -o -f 214i4eir.bin -b mptsas2.rom`
_Або sas2flsh -o -f 214i4et.bin -b mptsas2.rom_

**8. Так як ми затерли всі дані контролера включно з адресою, повертаємо її назад:**
`sas2flsh -o -sasadd ХХХХХХХХХХХХХХХ` - із пункта 5

**9. Перезавантажуємося**

-----

* <a href="http://nobrix.ru/firmware_lsi">Пишуть люди</a>

-----