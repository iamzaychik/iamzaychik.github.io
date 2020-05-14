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

{% for category in sorted_cats %}
<ul>
    <li><a href="#{{ category[0] | uri_escape | downcase }}">{{ category[0] }}</a>
</ul>
{% endfor %}

-----

{% for category in sorted_cats %}
    {% assign sorted_posts = category[1] | sort_natural: 'title' %}
    <h3 name="{{category[0] | uri_escape | downcase }}">{{ category[0] }}</h3>
    <ul>
    {% for post in sorted_posts %}
        <li><a href="{{ site.url }}{{ site.baseurl }}{{  post.url }}">{{  post.title }}</a></li>
    {% endfor %}
    </ul>
{% endfor %}

-----
