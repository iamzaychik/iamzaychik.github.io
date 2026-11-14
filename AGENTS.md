# AI Agent Guidelines: Forest Notes

You are an expert technical writer and automation agent managing this repository.
This is a minimalist personal tech blog, notebook, and knowledge base (`iamzaychik.github.io`) built with Jekyll (GitHub Pages).

---

## Content Editing & Style Rules

- **Language Strictness:** The blog officially supports ONLY Ukrainian and English.
- **Automatic Language Correction:** During editing, normalization, or content creation, translate unsupported-language content into Ukrainian or English, depending on context.
    Preserve technical terms, commands, and code.
- **Telegraphic Style:** Use brief, highly scannable sentences and active voice.
    Avoid deep tutorials and narrative storytelling.
- **Strict Category Reuse:** Before assigning a category, inspect existing folders under `_posts/`.
    Reuse an existing category whenever possible.
    Create a new one only if none fits.
- **No Redundancy:** Check existing posts to prevent duplicate topics and fragmented content.
    Do not change a post's original date when updating it.
- **Command Accuracy:** Verify commands, code snippets, paths, and configuration examples.
    Ensure they are valid for the documented environment.

### Draft Review & Deduplication
- Before creating a post, inspect `00_draft` and `_posts/` for related information.
- If the information is new, create a post.
- If it already exists, update or merge the relevant content instead of duplicating it.
- Prioritize current, verified information over outdated content.
- Preserve older information if it contains critical implementation details. Add it alongside current guidance, clearly distinguishing versions or conditions.
- Verify existing instructions before replacing them.
- Preserve relevant sources, commands, and technical details.

---

## Structure

- **Drafts:** `00_draft/`
- **Published Posts:** `_posts/`
- **Post Filename:** `YYYY-MM-DD-simplified-lowercase-title.md`

### Post Template

```yaml
---
title: Exact topic description
category: Category name
date: YYYY-MM-DD
---

*Subtitle describing the core problem in one sentence.*

---

Post content.

---

[Source](url) link if the solution relies on external documentation.

---
```

### Content Layout Rules

1. **Subtitle:** Add one italicized sentence immediately after front matter, describing the core problem or purpose.
2. **Headings:** Use `###` for subsections. Keep headings concise and action-oriented.
3. **Lists over Paragraphs:** Prefer short bullet points over lengthy explanations. Keep each bullet under 15 words where practical.
4. **Code Blocks:** Use language-specific fences (`bash`, `yaml`, `text`, etc.). Prefix terminal commands with `$`.

---

## Validation

- **File Checks:** `pre-commit run --files <modified_files>`
- Run File Checks against all modified files.
- Use existing project dependencies and configurations.
- Do not modify validation rules or configuration to bypass errors.
- Fix safe formatting and lint issues, then rerun the checks.
- Report validation failures that require manual intervention.
