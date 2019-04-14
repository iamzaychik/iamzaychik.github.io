Title: Ubuntu. PHP 7.0 on 14.04
Pub date: 11.09.2017
Category: Ubuntu, 

**Щоб встановити PHP версії 7.0 на Ubuntu 14.04 потрібно:**
**1. Додати репозиторій**
`sudo add-apt-repository ppa:ondrej/php`

**2. Отримати список пакетів для оновлення:**
`sudo apt-get update`

**3. Встановити необхідне забезпечення:**
`sudo apt-get install php7.0`

_Якщо Ваша система має локалізацію, що відрізняється від UTF-8, додати репозиторій може не вийти. В такому разі потрібно:_
**1. Встановити базовий пакет локалізацій:**
`sudo apt-get install -y language-pack-en-base`

**2. Додати репозиторій з використанням UTF-8:**
`sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php`

-----