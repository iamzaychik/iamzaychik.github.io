---
title: Home
layout: no-date
lang: en
hide_description: false
hide_page_title: true
language_switcher: true
translation_url: /ua/
permalink: /
---

---

<nav class="site-navigation" aria-label="Site sections">
  <ul class="site-navigation__grid">
    <li class="site-navigation__item">
      <button class="site-navigation__link site-navigation__link--active" type="button" aria-controls="home-categories" aria-selected="true" data-home-tab="home-categories">Categories</button>
    </li>
    <li class="site-navigation__item">
      <button class="site-navigation__link" type="button" aria-controls="home-posts" aria-selected="false" data-home-tab="home-posts">Posts</button>
    </li>
  </ul>
</nav>

<div class="home-content">
  <section id="home-categories" class="home-content__panel" aria-label="Categories">
    {% include category-index.html %}
  </section>
  <section id="home-posts" class="home-content__panel" aria-label="Posts" hidden>
    {% include post-index.html %}
  </section>
</div>

<script src="{{ '/assets/js/home-tabs.js' | relative_url }}"></script>
