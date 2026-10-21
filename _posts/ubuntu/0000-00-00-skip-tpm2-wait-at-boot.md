---
title: Skip the TPM2 wait during systemd startup
category: Ubuntu
date: 2026-10-22
---

*A systemd TPM2 synchronization wait can delay startup when firmware reports a TPM that the kernel does not expose.*

---

### Disable the TPM2 synchronization point

- Add `systemd.tpm2_wait=false` to the kernel command line.
- On Ubuntu, edit the default GRUB settings:

```bash
$ sudoedit /etc/default/grub
```

- Append the workaround options to the existing `GRUB_CMDLINE_LINUX_DEFAULT` value:

```bash
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash systemd.tpm2_wait=false tpm_tis.force=0"
```

- Regenerate GRUB configuration and reboot:

```bash
$ sudo update-grub
$ sudo reboot
```

### Mask TPM units when the device itself causes failures

- The original workaround also masked TPM device units and the TPM target.
- This can prevent TPM dependent services from using the hardware.
- Apply these masks only when disabling those TPM units is acceptable:

```bash
$ sudo systemctl mask dev-tpm0.device dev-tpmrm0.device tpm2.target
```

- Remove the masks to restore the units:

```bash
$ sudo systemctl unmask dev-tpm0.device dev-tpmrm0.device tpm2.target
```

### Check the result

- Confirm the parameter appears in `/proc/cmdline`.
- This disables systemd's TPM2 boot synchronization point.
- TPM dependent services may start without waiting for a device.
- Keep TPM based features in mind before applying this workaround.
- `systemd.tpm2_wait=false` skips systemd's wait; it does not disable the TPM driver.
- `tpm_tis.force=0` keeps forced TPM TIS probing disabled.

---

[systemd TPM2 generator](https://www.freedesktop.org/software/systemd/man/latest/systemd-tpm2-generator.html) · [Linux TPM TIS driver](https://github.com/torvalds/linux/blob/master/drivers/char/tpm/tpm_tis.c)

---
