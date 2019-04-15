---
title: Головна
layout: home
---

-----

# Пости тут

{% for post in site.posts %}
<article>
   * <a href="{{ post.url }}">{{ post.title }}</a> <time datetime="{{ post.date | date: "%Y-%m-%d" }}">{{ post.date | date_to_long_string }}</time>
</article>
{% endfor %}