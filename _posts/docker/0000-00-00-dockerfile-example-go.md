---
title: Dockerfile example go
category: Docker
date: 2023-02-06
---

-----

```docker
FROM golang:1.9.0-alpine3.6 as builder

WORKDIR /go/src/source.domain.com/user/project/

COPY . .

RUN apk add --update --no-cache git

RUN go get -u github.com/golang/dep/cmd/dep && \
    dep ensure

RUN cd src && \
    go build -o binary



FROM alpine

WORKDIR /myapp

COPY --from=builder /go/src/source.domain.com/user/project/src/binary ./

ENTRYPOINT ./binary
```

-----
