---
title: Posts
layout: no-date
---

-----

{% for post in site.posts %}
  {% assign currentdate = post.date | date: "%Y%m%d" %}
  {% if currentdate != date %}
    <li id="{{currentdate}}">{{ currentdate }}</li>
    {% assign date = currentdate %} 
  {% endif %}
    <li><a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}

-----