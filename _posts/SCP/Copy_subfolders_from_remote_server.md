Title: SCP. Copy subfolders from remote server
Pub date: 19.12.2017
Category: SCP, 

**Щоб скопіювати з віддаленого сервера файли в певній папці:**
`scp -i SSH_PRIVATE_KEY -P SSH_PORT -r LOCAL_PATH SSH_USER@SERVER_IP:REMOTE_PATH`
_Якщо авторизація відбувається не за допомогою public-key, потрібно буде ввести пароль користувача._
-----