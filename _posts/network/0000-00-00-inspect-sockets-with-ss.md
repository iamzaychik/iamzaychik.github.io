---
title: Inspect sockets with ss
category: Network
date: 2026-10-18
---

*Useful `ss` commands for finding listening services and active connections.*

### List listening TCP ports

```bash
$ ss -tln
```

- `-t` — show TCP sockets.
- `-l` — show listening sockets.
- `-n` — show numeric addresses and ports.

### Find processes using ports

```bash
$ ss -tulpn
$ ss -tunap
```

- `-u` — include UDP sockets.
- `-p` — show process information when permitted.
- `-a` — show listening and non-listening sockets.

### Find sockets by state

```bash
$ ss -tan state time-wait
$ ss -tan state close-wait
```

### Sort connections by remote address

```bash
$ ss -tan | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head
```

### Monitor sockets continuously

```bash
$ watch 'ss -tulpn'
```

- `ss` is faster and more capable than `netstat`.
- `grep`, `awk`, and `cut` provide quick filtering.
