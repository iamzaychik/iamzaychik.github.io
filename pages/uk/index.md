---
title: Головна
layout: no-date
lang: uk
hide_description: false
hide_page_title: true
permalink: /ua/
language_switcher: true
translation_url: /
---

---

<nav class="site-navigation" aria-label="Розділи сайту">
  <ul class="site-navigation__grid">
    <li class="site-navigation__item">
      <button class="site-navigation__link site-navigation__link--active" type="button" aria-controls="home-categories" aria-selected="true" data-home-tab="home-categories">Категорії</button>
    </li>
    <li class="site-navigation__item">
      <button class="site-navigation__link" type="button" aria-controls="home-posts" aria-selected="false" data-home-tab="home-posts">Публікації</button>
    </li>
  </ul>
</nav>

<div class="home-content">
  <section id="home-categories" class="home-content__panel" aria-label="Категорії">
    {% include category-index.html %}
  </section>
  <section id="home-posts" class="home-content__panel" aria-label="Публікації" hidden>
    {% include post-index.html %}
  </section>
</div>

<script src="{{ '/assets/js/home-tabs.js' | relative_url }}"></script>
