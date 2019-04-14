Title: Raspberry Pi. HDMI hotplug
Pub date: 04.05.2017
Category: Raspberry Pi, 

_Специфіка роботи HDMI в Raspberry PI така, що він працює тільки в тому разі, якщо був підключений перед запуском пристрою._

-----

Для того, аби підключати монітор тоді, коли нам заманеться:
**1. Відкриваємо файл конфігурації завантаження:**
`mcedit /boot/config.txt`

``**2. Змінюємо значення налаштувань в таких рядках:**
`# Дозволити "гаряче" підключення монітора`
`hdmi_force_hotplug=1`

`# Виводити звук через HDMI`
`hdmi_drive=2`

-----

* <a href="http://blog.mivia.dk/solved-hdmi-working-raspberry-pi/">Пишуть люди</a>

-----