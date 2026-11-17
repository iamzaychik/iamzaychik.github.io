---
title: Публікації
layout: no-date
lang: ua
permalink: /ua/posts/
language_switcher: true
translation_url: /posts/
---

---

- [Категорії](/ua/categories/)

---

<ul class="posts">
{% for post in site.posts %}
  <li><a href="{{ post.url }}">{{ post.category }} | {{ post.title }}</a> <span>({{ post.date | date_to_string }})</span></li>
{% endfor %}
</ul>

---
