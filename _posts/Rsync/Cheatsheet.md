---
title: Cheatsheet
---

**From local to remote:**
`rsync -chavzP --stats -e "ssh -p SSH_PORT" LOCAL_PATH SSH_USER@SERVER_IP:REMOTE_PATH`

**From remote to local:**
`rsync -chavzP --stats -e "ssh -p SSH_PORT" SSH_USER@SERVER_IP:REMOTE_PATH LOCAL_PATH`

-----

`-a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
-v, --verbose               increase verbosity
-z, --compress              compress file data during the transfer
--partial
By default, rsync will delete any partially transferred file if the transfer is interrupted. In some circumstances it is more desirable to keep partially transferred files. Using the --partial option tells rsync to keep the partial file which should make a subsequent transfer of the rest of the file much faster.
--progress
This option tells rsync to print information showing the progress of the transfer. This gives a bored user something to watch. Implies --verbose if it wasn't already specified.
-P
The -P option is equivalent to --partial --progress. Its purpose is to make it much easier to specify these two options for a long transfer that may be interrupted.`

-----