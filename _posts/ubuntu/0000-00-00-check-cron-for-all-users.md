---
title: Check cron for all users
category: Ubuntu
date: 2020-04-14
---

-----

```bash
function allcrontab() {
     for user in $(cut -d':' -f1 /etc/passwd); do
          usercrontab=$(crontab -l -u ${user} 2>/dev/null)
          if [ -n "${usercrontab}" ]; then
               echo -e "${RED}====== Start crontab for user ${NC}${GREEN}${user}${NC} ${RED}======${NC}"
               crontab -l -u ${user} | sed '/ *#/d; /^ *$/d'
               echo -e "${RED}====== End crontab for user ${NC}${GREEN}${user}${NC} ${RED}========${NC}\n"
          fi
     done
}
```

-----
