---
title: Головна
layout: home
---

-----

# Categories

{% for post in site.posts %}
  * {{ post.title }} - {{ post.date }}
{% endfor %}