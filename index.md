---
title: Головна
layout: home
---

-----

# Categories

{% for category in site.categories %}
  * {{ post.title }} - {{ post.date }}
{% endfor %}