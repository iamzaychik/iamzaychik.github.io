---
title: Posts
layout: no-date
---

-----

<ul class="posts">
{% for post in site.posts %}
  <li><a href="{{ post.url }}">{{ post.category }} | {{ post.title }}</a> <span>({{ post.date | date_to_string }})</span></li>
{% endfor %}
</ul>

-----