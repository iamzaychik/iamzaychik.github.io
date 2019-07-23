---
title: Change origin header
category: Fastly
date: 2019-07-23
---

-----

```bash
set req.http.origin = if(req.http.host ~ "^example.com", req.http.host, resp.http.origin);
unset resp.http.origin;
```

-----