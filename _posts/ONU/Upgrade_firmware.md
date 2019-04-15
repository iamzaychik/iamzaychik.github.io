---
title: Upgrade firmware
categories: ONU
date: 2019-04-15
---

<h4>Оновлення за допомогою OLT:</h4>
**1. Для відображення процесу:**
`Switch# terminal monitor`

**2. Завантажуємо firmware:**
`Switch# epon update onu image uImage int epon 0/*:*`

**Так закінчується процес завантаження:**
`Jan 1 01:27:20 %OLT: Interface EPON0/1:1's OAM Operational Status: Operational`
`Jan 1 01:27:23 %OLT: Interface EPON0/1:1's CTC OAM extension negotiated successfully!`

**3. Підтверджуємо оновлення прошивки:**
`Switch# epon commit-onu-image-update int epon 0/*:*`

**Так закінчується процес підтвердження:**
`Jan 1 01:28:58 Commit image request/response successful`
`Jan 1 01:28:58 Commit onu image update successfully on EPON0/*:*!`

**4. Видаляємо стару прошивку для звільнення місця:**
`Switch# delete uImage`

**5. Завантажуємо новий файл прошивки з tftp-сервера:**
`Switch# copy tftp flash ***.***.***.***`
`Source file name[]?jffs2_fs.tar.gz`
`Destination file name[jffs2_fs.tar.gz]?`

6. Оновлюємо:
`Switch# epon update onu image jffs2_fs.tar.gz int epon 0/*:*`
`Switch# epon commit-onu-image-update int epon 0/*:*`

-----

**А ручками в нас така метода:**

`filezilla ftp server:`
`username=a`
`password=a`
`home_folder=D:/upload`
`your_ip=10.0.0.2`

`1. login to the onu (10.0.0.10) via putty by username=admin password=admin`
`2. place the firmware into the d:/upload`
`3. from the putty:`

-----

**FORA**
`# cd /tmp`
`# wget ftp://a:a@10.0.0.2/uImage`
`# flashcp -v uImage /dev/mtd1`
`{if there is *.squashfs}`
`# wget ftp://a:a@10.0.0.2/*.squashfs`
`# flashcp -v a.squahsfs /dev/mtd2`
`# reboot`

-----

**BDCOM p1501c**
`ONU(config)# debug`
`ONU(config-debug)# legacy`
`onu->tftp firmware download 1023.zblob 10.0.0.2`
`onu->exit`
`ONU(config-debug)# exit`
`ONU(config)# exit`
`ONU# reset`

-----

**BDCOM 3024**
`telnet 10.0.0.10 2323`
`onu# sys`
`onu(sys)# tftp firmware download 1109.bin 10.0.0.2`
`onu(sys)# tftp uboot download 1004boot.bin 10.0.0.2`

-----