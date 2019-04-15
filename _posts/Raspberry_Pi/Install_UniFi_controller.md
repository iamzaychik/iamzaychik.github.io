---
title: Install UniFi controller
---

**1. Додаємо UniFi репозиторій, ключ до нього і оновлюємося:**
`echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' | sudo tee -a /etc/apt/sources.list.d/ubnt.list > /dev/null`
`sudo apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50`
`sudo apt-get update`

**2. Встановлюємо контролер:**
`sudo apt-get install unifi -y`
_Встановлення займає деякий час, але проходить у повністю автоматичному режимі.
Також будуть встановлені такі пакети, як MongoDB and OpenJDK Java 7._

**3. Вимкнемо запуск дефолтної бази MongoDB:**
`echo 'ENABLE_MONGODB=no' | sudo tee -a /etc/mongodb.conf > /dev/null`
_Якщо цього не зробити, то у нас буде запущено дві копії MongoDB - дефолтна та та, що використовується UniFi._

**4. Оновлюємо Snappy Java Library:**
`cd /usr/lib/unifi/lib`
`sudo rm snappy-java-1.0.5.jar`
`sudo wget https://repo1.maven.org/maven2/org/xerial/snappy/snappy-java/1.1.4/snappy-java-1.1.4.jar`
`sudo ln -s snappy-java-1.1.4.jar snappy-java-1.0.5.jar`
_Це усуне ряд проблем з старими версіями Raspberry Pi._

**5. Перезавантажуємося:**
`sudo reboot`

**6. Налаштовуємо контролер за адресою:**
`https://A.B.C.D:8443`

-----

* <a href="http://www.lowefamily.com.au/2016/06/02/installing-ubiquiti-unifi-controller-5-on-raspberry-pi/3/">Пишуть люди</a>

-----