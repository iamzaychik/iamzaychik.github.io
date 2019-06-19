---
title: Get group chat id
category: Telegram
date: 2019-06-19
---

-----

### After you created own bot and get TOKEN for it:
* add the BOT to the group
* get the list of updates for your BOT:
```bash
$ curl --silent https://api.telegram.org/bot{TOKEN}/getUpdates
```

* look for the "chat" object (you can do install jq for pretty output):
```json
{
  "ok": true,
  "result": [
    {
      "update_id": 17082016,
      "message": {
        "message_id": 17,
        "from": {
          "id": 22031984,
          "first_name": "User"
        },
        "chat": {
          "id": 22031984,
          "first_name": "User",
          "type": "private"
        },
        "date": 1471402800,
        "text": "Hello from the other side~"
      }
    }
  ]
}
```

* in this example the Chat ID to look out for is 22031984. Replace {TOKEN} with your Telegram bot token.
* use the "id" of the "chat" object to send your messages

-----