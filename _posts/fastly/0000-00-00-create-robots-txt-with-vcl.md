---
title: Create robots.txt using vcl
category: Fastly
date: 2020-02-05
---

-----

```bash
sub vcl_recv {
    #...
        if (req.url ~ "^/robots.txt$") {
            error 702 "OK";
        }
    #...
}

sub vcl_error {
    if (obj.status == 702) {
        set obj.status = 200;
        set obj.http.Content-Type = "text/plain; charset=utf-8";
        synthetic {"User-agent: *
Disallow: /"};
    }
    return (deliver);
}
```

-----

[Source](https://serverfault.com/a/371781)

-----