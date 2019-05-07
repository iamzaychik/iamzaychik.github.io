---
title: Cheatsheet
category: OpenMediaVault
date: 2019-05-06
---

-----

**Install extra plugins:**
```bash
$ wget -O - http://omv-extras.org/install | bash
```

-----

**Disable beeper:**
```bash
$ systemctl stop openmediavault-beep-down
$ systemctl disable openmediavault-beep-down

$ systemctl stop openmediavault-beep-up
$ systemctl disable openmediavault-beep-up
```

-----

**Error during update/install:**
```bash
Traceback (most recent call last):
  File "/usr/lib/python3.5/weakref.py", line 117, in remove
```

*line 109:*
```python
def remove(wr, selfref=ref(self)):
```

*replace with:*
```python
def remove(wr, selfref=ref(self), _atomic_removal=_remove_dead_weakref):
```

*line 117:*
```python
_remove_dead_weakref(d, wr.key)
```

*replace with:*
```python
_atomic_removal(d, wr.key)
```

-----