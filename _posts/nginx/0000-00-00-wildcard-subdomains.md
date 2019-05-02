---
title: Wildcard subdomains
category: Nginx
date: 2019-05-02
---

-----

```bash
server
{
    listen 80;
    server_name ~^(?<subdomain>.+)\.example\.com$;
    return 301 https://$subdomain.example.com$request_uri;
}

server
{
    listen 443 ssl http2;
    server_name ~^(?<subdomain>.+)\.example\.com$;

    ssl_certificate /etc/letsencrypt/live/starlight.example.com/fullchain.pem;  #managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/starlight.example.com/privkey.pem; #managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf;  #managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;  #managed by Certbot

    access_log /var/log/nginx/access_subdomain.log;
    error_log  /var/log/nginx/error_subdomain.log;

    location /
    {
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Credentials' 'true';
        add_header 'Access-Control-Allow-Headers' 'Content-Type,Accept';
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS, PUT, DELETE';

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_cache_bypass $http_upgrade;

        proxy_read_timeout 30;
        set $target $subdomain;
        proxy_pass http://127.0.0.1:8081/$target/;
    }

}

```

-----
