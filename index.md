---
title: Головна
layout: home
---

-----

# Categories

{% for post in site.posts %}
  <h2>{{ post.title }} - {{ post.date }}</h2>
  <p>{{ post.content | markdownify }}</p>
{% endfor %}

{% for category in site.categories %}
  <h3>{{ category[0] }}</h3>
  <ul>
    {% for post in category[1] %}
      <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}