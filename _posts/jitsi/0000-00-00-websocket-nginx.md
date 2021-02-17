---
title: Websocket Nginx
category: Jitsi
date: 2021-02-17
---

-----

```bash
location /xmpp-websocket {
    proxy_pass              http://jitsi_prosody:5280/xmpp-websocket;
    proxy_http_version      1.1;
    proxy_set_header        Upgrade $http_upgrade;
    proxy_set_header        Connection "upgrade";
    #proxy_set_header        Host $host;
    tcp_nodelay             on;
}
```

-----

[Source](https://github.com/jitsi/docker-jitsi-meet/issues/854#issue-757869673)

-----
