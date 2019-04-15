---
title: Пости
layout: default
---

-----

# pages

{% for post in site.pages %}
<article>
   * <a href="{{ post.url }}">{{ post.title }}</a> <time datetime="{{ post.date | date: "%Y-%m-%d" }}">{{ post.date | date_to_long_string }}</time>
</article>
{% endfor %}