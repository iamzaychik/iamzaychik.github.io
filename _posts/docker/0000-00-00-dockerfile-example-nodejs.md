---
title: Dockerfile example nodejs
category: Docker
date: 2023-02-06
---

-----

```bash
FROM node:12

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

RUN npm ci --only=production

COPY . .

EXPOSE 8080

CMD [ "node", "server.js" ]
```

-----
