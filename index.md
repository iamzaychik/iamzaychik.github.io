---
title: Головна
layout: home
---

-----

# Categories

{% for category in site.categories %}
  * {{ page.title }} - {{ page.date }}
{% endfor %}