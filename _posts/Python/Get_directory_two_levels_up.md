---
title: Get directory two levels up
category: Python
date: 2019-04-15
---

**Для того, щоб отримати шлях директорії, яка розташована на два рівні вище потрібного файла, потрібно:**

`import os.path as path`
`import sys`

`two_up =  path.abspath(path.join(__file__ ,"../.."))`

-----