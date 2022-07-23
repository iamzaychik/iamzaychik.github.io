---
title: Install Redis 6 with TLS
category: Redis
date: 2022-07-23
---

-----

[Download](https://redis.io/download)

-----

https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04

```bash
$ apt update
$ apt install -y tcl build-essential pkg-config libssl-dev
$ wget http://download.redis.io/releases/redis-6.2.4.tar.gz
$ tar xzf redis-6.2.4.tar.gz
$ cd redis-6.2.4
$ make BUILD_TLS=yes MALLOC=libc install
$ cd ~
$ rm -rf redis-6.2.4
$ rm redis-6.2.4.tar.gz
```

-----

* Setup Redis files and directories:

```bash
$ sudo adduser --system --group --no-create-home redis
$ usermod -L redis

$ mkdir -p /var/lib/redis
$ sudo chown redis:redis /var/lib/redis
$ sudo chmod ug+rwX /var/lib/redis

$ mkdir -p /var/run/redis
$ sudo chown redis:redis /var/run/redis
$ sudo chmod ug+rwX /var/run/redis

$ mkdir -p /etc/redis/
$ touch /etc/redis/redis.conf
$ chown -R redis:redis /etc/redis/

$ touch /etc/default/redis
$ echo 'ULIMIT=65536' > /etc/default/redis
```

-----

* https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309

```bash
$ cd ~

$ sed "/^RANDFILE.*$ENV::HOME\/\.rnd/d" -i /etc/ssl/openssl.cnf

$ export IP_ADDRESS=$(hostname -I)
$ export DNS_ADDRESS=$(hostname)

$ openssl genrsa -out rootCA.key 4096
$ openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.crt
$ openssl genrsa -out server.key 4096
$ openssl req -new -sha256 -key server.key -subj "/C=US/ST=CA/O=MyOrg, Inc./CN=${DNS_ADDRESS}" -reqexts SAN -config <(cat /etc/ssl/openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:${DNS_ADDRESS},IP:${IP_ADDRESS}")) -out server.csr

$ openssl req -in server.csr -noout -text

$ openssl x509 -req -in server.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out server.crt -extfile <(printf "\n[SAN]\nsubjectAltName=DNS:${DNS_ADDRESS},IP:${IP_ADDRESS}") -days 500 -sha256 -ext SAN -extensions SAN

$ openssl x509 -in server.crt -text -noout
$ openssl dhparam -out dhparam.pem 4096

$ mv server.crt /etc/redis/
$ mv server.key /etc/redis/
$ mv dhparam.pem /etc/redis/
$ cp rootCA.crt /etc/redis/
$ chown -R redis:redis /etc/redis

$ cd ~
$ rm server.csr
```

-----

* https://redis.io/topics/encryption

```bash
$ echo 'tls-cert-file /etc/redis/server.crt' > /etc/redis/redis.conf
$ echo 'tls-key-file /etc/redis/server.key' >> /etc/redis/redis.conf
$ echo 'tls-ca-cert-file /etc/redis/rootCA.crt' >> /etc/redis/redis.conf
$ echo 'tls-dh-params-file /etc/redis/dhparam.pem' >> /etc/redis/redis.conf
$ echo 'port 0' >> /etc/redis/redis.conf
$ echo 'tls-port 6379' >> /etc/redis/redis.conf
$ echo 'protected-mode yes' >> /etc/redis/redis.conf
$ echo 'tcp-backlog 511' >> /etc/redis/redis.conf
$ echo 'timeout 0' >> /etc/redis/redis.conf
$ echo 'tcp-keepalive 300' >> /etc/redis/redis.conf
$ echo 'daemonize yes' >> /etc/redis/redis.conf
$ echo 'supervised no' >> /etc/redis/redis.conf
$ echo 'bind 127.0.0.1 ::1' >> /etc/redis/redis.conf
$ echo 'pidfile /var/run/redis/redis.pid' >> /etc/redis/redis.conf
$ echo 'loglevel notice' >> /etc/redis/redis.conf
$ echo 'always-show-logo yes' >> /etc/redis/redis.conf
$ echo 'dir /var/lib/redis' >> /etc/redis/redis.conf
$ echo 'stop-writes-on-bgsave-error yes' >> /etc/redis/redis.conf
$ echo 'rdbcompression yes' >> /etc/redis/redis.conf
$ echo 'rdbchecksum yes' >> /etc/redis/redis.conf
$ echo 'dbfilename dump.rdb' >> /etc/redis/redis.conf
```

-----

* https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-18-04

```bash
$ export REDIS_PASSWORD=$(openssl rand 60 | openssl base64 -A)
$ echo "requirepass $REDIS_PASSWORD" >> /etc/redis/redis.conf

$ echo 'rename-command FLUSHDB ""' >> /etc/redis/redis.conf
$ echo 'rename-command FLUSHALL ""' >> /etc/redis/redis.conf
$ echo 'rename-command DEBUG ""' >> /etc/redis/redis.conf
$ echo 'rename-command SHUTDOWN SHUTDOWN_MENOT' >> /etc/redis/redis.conf
$ echo 'rename-command CONFIG ASC12_CONFIG' >> /etc/redis/redis.conf
```

* /etc/systemd/system/redis.service

```bash
[Unit]
Description=Advanced key-value store
After=network.target
Documentation=http://redis.io/documentation, man:redis-server(1)

[Service]
ExecStartPre=/bin/mkdir -p /var/run/redis/
ExecStartPre=/bin/chmod ug+rwX /var/run/redis/
ExecStartPre=/bin/chown redis:redis /var/run/redis/
ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
ExecStop=/bin/kill -s TERM $MAINPID
EnvironmentFile=/etc/default/redis
TimeoutStopSec=infinity
TimeoutStartSec=infinity
Restart=always
User=redis
Group=redis
RuntimeDirectory=redis
RuntimeDirectoryMode=2755
WorkingDirectory=/var/lib/redis
UMask=007
PrivateTmp=yes
LimitNOFILE=65535
PrivateDevices=yes
ProtectHome=yes
ReadOnlyDirectories=/
ReadWriteDirectories=-/var/lib/redis
ReadWriteDirectories=-/var/log/redis
ReadWriteDirectories=-/var/run/redis
Type=forking
NoNewPrivileges=true
CapabilityBoundingSet=CAP_SETGID CAP_SETUID CAP_SYS_RESOURCE
MemoryDenyWriteExecute=true
ProtectKernelModules=true
ProtectKernelTunables=true
ProtectControlGroups=true
RestrictRealtime=true
RestrictNamespaces=true
RestrictAddressFamilies=AF_INET AF_INET6 AF_UNIX
ProtectSystem=full
ReadWriteDirectories=-/etc/redis

[Install]
WantedBy=multi-user.target
Alias=redis.service
```

-----

* Start Redis:

```bash
$ systemctl start redis
$ systemctl status redis
$ systemctl enable redis
```

-----

* Connecting to Redis:
```bash
$ redis-cli --tls --cert /etc/redis/server.crt --key /etc/redis/server.key --cacert /etc/redis/rootCA.crt --askpass
```

-----

[Source](https://gist.github.com/fritsstegmann/316cc0d458604d08bf1b9ac517c1428f)

-----
