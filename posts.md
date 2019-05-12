---
title: Posts
layout: no-date
---

-----

{% for post in site.posts %}

    {% capture day %}{{ post.date | date: '%Y%m%d' }}{% endcapture %}
    {% capture nday %}{{ post.next.date | date: '%Y%m%d' }}{% endcapture %}

    {% if day != nday %}
        <h5 class="date">{{ post.date | date: "%A, %B %e, %Y" }}</h5>
    {% endif %}
    {{ post.content }}
    <hr>

{% endfor %}

-----