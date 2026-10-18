---
title: Dockerfile example python
category: Docker
date: 2023-02-06
---

---

*Build a Python application with a Dockerfile.*

```dockerfile
FROM python:3.7-alpine

WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./service.py" ]
```

---
