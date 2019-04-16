---
title: htaccess for Wordpress
category: Apache
date: 2019-04-15
---

-----

1. Enable `mod_rewrite`:
```
RewriteEngine On
```

2. Force redirect to https:
```
RewriteCond %{HTTPS} off
RewriteRule (.*) https://zaychik.info/$1 [R,L]
```

3. Permalinks support:
```
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
```

-----