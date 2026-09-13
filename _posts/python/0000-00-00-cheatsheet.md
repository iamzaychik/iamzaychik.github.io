---
title: Cheatsheet
category: Python
date: 2019-04-15
---

_Отвергая законы природы
Стоит у перил моста
Безумно глядя на воду
Совершенная красота._

-----

### PEP 8

[PEP 8](https://peps.python.org/pep-0008/) defines style guidelines for Python code.

* Use four spaces for indentation; do not use or mix tabs.
* Keep lines to a maximum of 79 characters; use indentation or a backslash for line continuations.
* Separate top-level functions and class definitions with two blank lines.
* Separate method definitions inside a class with one blank line.
* Use additional blank lines to group related methods logically.
* Use UTF-8 source files without an encoding declaration.
* Put each imported module on its own line.
* Order imports as standard-library modules, third-party modules, and local application modules.
* Separate each import group with a blank line.
* Avoid unnecessary whitespace inside parentheses or before commas, semicolons, and colons.
* Avoid unnecessary whitespace before function-argument and index brackets.
* Avoid more than one space between operators such as `=`, `-`, and `+`.
* Use a single space around operators.
* Avoid spaces around `=` when it is used for default parameters and keyword arguments.
* Update comments together with code.
* Write comments in English.
* Avoid single-character names such as `l`, `O`, and `I`.
* Use short, lowercase names for modules and packages.
* Use `CapWords` names for classes.
* Use `lowercase_with_underscores` names for functions, or `mixedCase` when required by existing conventions.
* Use `lowercase_with_underscores` names for methods.
* Prefix internal methods and variables with an underscore, such as `_internal_name`.
* Use `is` or `is not` to compare with `None`; do not use comparison operators.
* Use class-based exceptions derived from `Exception`.
* Use string methods instead of string functions.
* Use `str.startswith()` and `str.endswith()` instead of string slicing to test prefixes and suffixes.
* Use `isinstance()` for type checks.
* Do not compare Boolean variables with `True` or `False`.

-----

**Copy/move/remove files**
`#!/usr/bin/python
import os
import shutil
os.rename('name1','name2') # переименовать
shutil.copy('name1','name2') # копировать
shutil.move('name1', 'name2') # переместить
os.remove('name1') # удалить`

-----

**Зворотній відлік**
`#!/usr/bin/python3
import time
def countdown(count):
while (count >= 0):
print("Time left:", count, "sec")
count -= 1
time.sleep(1)
countdown(10)`

-----

-----
