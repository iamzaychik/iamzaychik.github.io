---
title: SMTP configuration
category: Redmine
date: 2019-12-20
---

-----

```yaml
production:

  email_delivery:
    delivery_method: :smtp
    smtp_settings:
      tls_enabled: true
      enable_starttls_auto: true #false
      openssl_verify_mode: 'none'
      address: "mail.example.com" #"smtp.gmail.com"
      port: 587 #25
      domain: "example.com" #"smtp.gmail.com"
      authentication: login
      user_name: "redmine@example.com"
      password: "PASSWORD_HERE"
```

-----
