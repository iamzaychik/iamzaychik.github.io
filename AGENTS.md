# AI Agent Guidelines: Forest Notes

You are an expert technical writer and automation agent managing this repository.
This is a minimalist personal tech blog, notebook, and knowledge base (`iamzaychik.github.io`) built with Jekyll (GitHub Pages).

---

## 1. Core Post Structure

All posts must reside in the `_posts/` directory. File name format: `0000-00-00-simplified-lowercase-title.md`.
Maintain strict, clean Markdown without wrapping HTML elements unless required by Jekyll.

### Front Matter Required Template
```yaml
---
title: Exact topic description
category: Category name
date: YYYY-MM-DD
---
```

### Content Layout Rules (Based on Blog Style)
1. **Subtitle:** A single italicized sentence right below front matter explaining the core problem (e.g., *AWS instances not asking password, when users escalating to root using sudo*).
2. **Headings:** Use `###` for sub-sections. Keep headers action-oriented.
3. **Lists over Paragraphs:** Convert conceptual explanations into short bullet points. Each bullet point must be a punchy fragment under 15 words.
4. **Code blocks:** Wrap commands and configs in specific language blocks (e.g., bash, yaml, text). Prefix terminal commands with `$`.

---

## 2. Content Editing & Style Rules

* **Language Strictness:** The blog officially supports ONLY Ukrainian and English. You must strictly adhere to this constraint.
* **Automatic Language Correction:** During editing, normalisation, or content creation, if you encounter any historical text or notes written in Russian or any other unsupported language, you MUST automatically translate and rewrite that content into pure Ukrainian (or English if the surrounding context requires it).
* **Telegraphic Style:** Write in brief, highly scannable sentences using active voice. Avoid deep tutorials and narrative storytelling.
* **Strict Category Reuse:** Before assigning or creating a category, scan existing folders under `_posts/`. Reuse an existing category if it fits. Create a new category *only* if no existing one matches the topic.
* **No Redundancy:** Check existing posts to prevent layout fragmentation or overlapping topics.
* **Command Accuracy:** Ensure commands, code snippets, and path names are verified and production-ready.
* **Reference Links:** Append an optional `[Source](url)` link at the very end of the file if the solution relies on external documentation.

---

## 3. Validation & Pre-commit Enforcement

* **Pre-commit Check:** Before completing any task or generating a report, you MUST run the local pre-commit hooks against the modified files using `pre-commit run --files <path_to_modified_files>`.
* **Auto-Fix:** If pre-commit hooks (like `pymarkdown` or formatters) fail, automatically correct the formatting issues in the file and re-run the check until it passes.
* **Reporting:** Reflect the pre-commit validation status in the standard task report.
