---
title: Dockerfile example python
category: Docker
date: 2023-02-06
---

-----

```docker
FROM python:3.7-alpine

WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./service.py" ]
```

-----
