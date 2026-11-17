---

title: Upgrade firmware
category: Summit
date: 2019-04-15
---

*Upgrade Extreme Summit firmware in both primary and secondary images.*

1. Check the firmware version:

```text
show switch
```

1. Configure the IP address:

```text
configure vlan "Mgmt" ipaddress summit_ip/netmask
```

This address will not respond to ping requests.

1. Download the firmware to the secondary configuration. Summit boots from
   primary by default:

```bash
download image your_ip summitX-15.1.2.12-patch1-6.xos vr "VR-Mgmt" secondary
_Do you want to install image after downloading ? (y—yes, n—no, —cancel)
Say Yes to install image after downloading_
```

1. Download SSH:

```bash
download image your_ip summitX-15.1.2.12-patch1-6-ssh.xmod
_Do you want to install image after downloading ? (y—yes, n—no, —cancel)
Say Yes to install image after downloading_
```

```bash
run update
restart process "thttpd"
enable ssh2
```

1. Switch to secondary to download the firmware to primary:

```bash
use configuration secondary
use image secondary
reboot
```

1. Download the firmware to the primary configuration:

```bash
download image your_ip summitX-15.1.2.12-patch1-6.xos vr "VR-Mgmt" primary
_Do you want to install image after downloading ? (y—yes, n—no, —cancel)
Say Yes to install image after downloading_
```

1. Download SSH:

```bash
download image your_ip summitX-15.1.2.12-patch1-6-ssh.xmod
_Do you want to install image after downloading ? (y—yes, n—no, —cancel)
Say Yes to install image after downloading_
```

```bash
run update
restart process "thttpd"
enable ssh2
```

1. Switch to primary:

```bash
use configuration primary
use image primary
reboot
```

---
