---
title: Cheatsheet
category: jq
date: 2021-02-17
---

---

*Process, query, and transform JSON from the command line with jq.*

### Pretty-print JSON

Input object:

```json
{"fruit":{"name":"apple","price":1.20}}
```

```bash
$ echo '{"fruit":{"name":"apple","price":1.20}}' | jq '.'
$ jq '.' fruit.json
$ curl http://api.open-notify.org/iss-now.json | jq '.'
```

### Read object properties

```bash
$ jq '.fruit' fruit.json
$ jq '.fruit.color' fruit.json
$ jq '.fruit.color,.fruit.price' fruit.json
$ echo '{ "with space": "hello" }' | jq '."with space"'
```

Parsed object:

```json
{
  "name": "apple",
  "price": 1.2
}
```

### Parse JSON in Bash

```bash
$ payload='{"user":{"name":"Ada","roles":["admin","writer"]}}'
$ name=$(printf '%s\n' "$payload" | jq -r '.user.name')
$ printf '%s\n' "$name"
Ada
```

Parse an object without converting it to a quoted string:

```bash
$ printf '%s\n' "$payload" | jq '.user'
{
  "name": "Ada",
  "roles": [
    "admin",
    "writer"
  ]
}
```

### Iterate over arrays

```bash
$ echo '["x","y","z"]' | jq '.[]'
$ jq '.[] | .name' fruits.json
$ jq '.[].name' fruits.json
```

### Select array items

```bash
$ jq '.[1].price' fruits.json
$ echo '[1,2,3,4,5,6,7,8,9,10]' | jq '.[6:9]'
$ jq '.[] | select(.price>0.5)' fruits.json
$ jq '.[] | select(.color=="yellow" and .price>=0.5)' fruits.json
```

### Use built-in functions

```bash
$ jq '.fruit | keys' fruit.json
$ jq '.fruit | length' fruit.json
$ jq 'map(.price+2)' fruits.json
$ jq '[.[].price] | min' fruits.json
$ jq '[.[].price] | max' fruits.json
$ jq 'map(.color) | unique' fruits.json
$ jq 'del(.fruit.name)' fruit.json
```

### Match regular expressions

```bash
$ jq '.[] | select(.name|test("^a.")) | .price' fruits.json
```

### Transform JSON structures

```bash
$ jq '.query.pages | [.[] | map(.) | .[] | {page_title: .title, page_description: .extract}]' wikipedia.json
```

### Parse a curl response

```bash
$ response=$(curl --fail --silent --show-error https://api.github.com/repos/jqlang/jq)
$ printf '%s\n' "$response" | jq '{name, owner: .owner.login, license: .license.spdx_id}'
{
  "name": "jq",
  "owner": "jqlang",
  "license": "MIT"
}
```

Save only the parsed object:

```bash
$ curl --fail --silent --show-error https://api.github.com/repos/jqlang/jq \
  | jq '{name, stars: .stargazers_count, issues: .open_issues_count}' \
  > repository.json
$ jq '.' repository.json
```

### Verify jq installation

```bash
$ jq --version
```

[Source](https://www.baeldung.com/linux/jq-command-json)

---
