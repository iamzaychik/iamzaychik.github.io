Title: Python. Get directory two levels up
Pub date: 09.01.2018
Category: Python, 

**Для того, щоб отримати шлях директорії, яка розташована на два рівні вище потрібного файла, потрібно:**

`import os.path as path`
`import sys`

`two_up =  path.abspath(path.join(__file__ ,"../.."))`

-----