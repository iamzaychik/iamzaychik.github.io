---
title: Категорії
layout: no-date
lang: uk
permalink: /uk/categories/
language_switcher: true
translation_url: /categories/
---

---

* [Публікації](/uk/posts/)

---

{% assign sorted_categories = site.categories | sort %}

<ul>
{% for category in sorted_categories %}
<li><a href="#{{ category[0] | uri_escape | downcase }}">{{ category[0] }}</a></li>
{% endfor %}
</ul>

{% for category in sorted_categories %}
{% assign sorted_posts = category[1] | sort_natural: 'title' %}
<hr>
<h3 id="{{category[0] | uri_escape | downcase }}">{{ category[0] }}</h3>
<br />
<ul>
{% for post in sorted_posts %}
<li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
{% endfor %}

---
