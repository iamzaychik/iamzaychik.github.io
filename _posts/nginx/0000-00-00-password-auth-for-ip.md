---
title: Password auth for IP
category: Nginx
date: 2019-04-15
---

-----

**Enable basic auth:**
```bash
server
{
	# Title for auth window
    auth_basic "Closed site";
    # Path to file with user:password in MD5
    auth_basic_user_file /etc/nginx/users;
}

$ cat /etc/nginx/users
john:$apr1$IHaD0/..$N9ne/Bqnh8.MyOtvKU56j1
```

-----

**Disable basic auth for some IPs ([satisfy](https://nginx.org/en/docs/http/ngx_http_core_module.html#satisfy) module):**
```bash
server
{
    satisfy any;
    allow 203.0.113.1;
    allow 203.0.113.2;
    deny all;
    auth_basic "Closed site";
    auth_basic_user_file /etc/nginx/users;
}
```

-----

[Source](https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-http-basic-authentication/)

-----