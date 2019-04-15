---
title: Gluster FS
---

# Distributed-replicated
`gluster volume create test replica 4 server1:/mnt/storage/1 server1:/mnt/storage/2 server3:/mnt/storage/1 server3:/mnt/storage/2 force`

**/etc/fstab**
# Монтирование через главный сервер с поддержкой переключения на другой
`server1:/dis-rep /mnt/extended glusterfs defaults,_netdev,backup-volfile-servers=server2:server3:/dis-rep 0 0`

# Или устанавливаем демон сервера на клиент, ноду не создаем и монтируем через себя
`localhost:data /data glusterfs defaults,_netdev 0 0`
-----