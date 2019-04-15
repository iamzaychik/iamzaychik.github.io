---
title: htaccess for md
categories: Apache
date: 2019-04-15
---

**1. Вмикаємо механізм mod_rewrite:**
`RewriteEngine On`

**2. Примусове перенаправлення на https:**
`RewriteCond %{HTTPS} off`
`RewriteRule (.*) https://zaychik.info/$1 [R,L]`

**3. Підтримка permalinks:**
`RewriteBase /`
`RewriteRule ^index\.php$ - [L]`
`RewriteCond %{REQUEST_FILENAME} !-f`
`RewriteCond %{REQUEST_FILENAME} !-d`
`RewriteRule . /index.php [L]`

-----