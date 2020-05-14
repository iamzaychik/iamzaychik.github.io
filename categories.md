---
title: Categories
layout: no-date
---

-----

* [Posts](/posts)

-----

{% comment %}
#
# Change date order by adding '| reversed'
# To sort by title or other variables use {% assign sorted_posts = category[1] | sort: 'title' %}
#
{% endcomment %}

{% assign sorted_cats = site.categories | sort %}

<ul class="list">
{% for category in sorted_cats %}
    <li><a href="#{{ category[0] | uri_escape | downcase }}">{{ category[0] }}</a>
{% endfor %}
</ul>

-----
