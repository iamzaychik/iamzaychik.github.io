# [Forest Notes](https://iamzaychik.github.io)

Minimalist personal tech blog, notebook, and knowledge base.

---

## Architecture

* **Stack:** `Github Pages, Jekyll, Markdown`.
* **Tools:** `pre-commit, pymarkdown`.
* **Drafts:** `00_draft/`.
* **Published posts:** `_posts/<category>/`.

### Commands
* **Validation:** `pre-commit run --files <path_to_modified_files>`.

---

## Conventions

* **Post filename:** `0000-00-00-simplified-lowercase-title.md`
* **Language:** Ukrainian or English.
* **Style:** Telegraphic, concise, scannable sentences.
* **Syntax:** Follow `pymarkdown` configured rules.
* **Conflicts:** Reuse existing category folders and posts, preserve the original publication date.

### Post Template

```yaml
---
title: Exact topic description
category: Category
date: YYYY-MM-DD
---

*Subtitle describing the core problem in one sentence.*

---

Content.

---

[Source](url)

---
```

---
