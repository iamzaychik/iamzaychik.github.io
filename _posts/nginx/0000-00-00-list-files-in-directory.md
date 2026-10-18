---
title: List files in directory
category: Nginx
date: 2019-05-10
---

---

*Enable directory listings for an Nginx location.*

*Add to `/etc/sites-enabled/vhost.conf` for needed location:*

```bash
alias /var/www/files;
autoindex on;
autoindex_exact_size off;
autoindex_format html;
autoindex_localtime on;

```

---
