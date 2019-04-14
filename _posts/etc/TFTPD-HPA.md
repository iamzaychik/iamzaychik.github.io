Title: TFTPD-HPA
Pub date: 04.08.2016
Category: TFTP, 

_Сікундою встановлюємо собі tftp-server._

-----

**1. Ставимо:**
`apt install tftpd-hpa`

**2. Редагуємо налаштування:**
`mcedit /etc/default/tftpd-hpa`

**3.Вставляємо:**
`TFTP_USERNAME="tftp"`
`TFTP_DIRECTORY="/path/to/firmware"`
`TFTP_ADDRESS="0.0.0.0:69"`
`TFTP_OPTIONS="--secure --create --umask 022 --permissive"`

-----