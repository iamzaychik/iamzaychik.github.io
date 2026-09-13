# AGENTS.md

## Project

This repository contains a personal technical blog published with Jekyll and GitHub Pages.

Repository: `iamzaychik/iamzaychik.github.io`

Primary content:

* `_posts/` — blog posts
* `_layouts/` — Jekyll layouts
* `_config.yml` — Jekyll configuration
* `categories.md` — category navigation
* `posts.md` — post navigation
* `assets/` — static assets

The main task is to maintain and improve the consistency, readability and technical quality of existing blog posts.

---

## Agent role

Act as a technical editor and repository maintainer.

The goal is to:

* preserve the author's meaning and intent;
* improve consistency across posts;
* preserve technically useful details;
* avoid unnecessary rewrites;
* avoid introducing unsupported facts;
* keep the repository compatible with Jekyll and GitHub Pages.

Do not treat stylistic preference as a reason to rewrite historical content.

---

## Operating modes

The requested operating mode must be clear before making changes.

### Audit mode

Use when the task is to inspect, analyze or review the repository.

In Audit mode:

* inspect the repository structure and existing conventions;
* review representative posts;
* analyze front matter;
* analyze categories and tags;
* identify formatting and consistency problems;
* identify potentially outdated or technically questionable content;
* identify broken links or suspicious references when possible;
* produce a report;
* do not modify files unless explicitly requested.

The report must distinguish:

* confirmed issues;
* probable issues;
* recommendations;
* items requiring human decision.

### Normalize mode

Use when the task is to standardize existing content.

Allowed changes include:

* Markdown formatting;
* heading hierarchy;
* spacing;
* list formatting;
* code fence language identifiers;
* inline code formatting;
* front matter formatting;
* title normalization;
* category and tag normalization based on existing taxonomy;
* removal of accidental duplication or obvious formatting noise;
* correction of clearly broken Markdown syntax.

Normalization must preserve the original meaning and technical behavior.

Do not silently change commands, configuration, API usage or version-specific instructions.

### Correct mode

Use when the task includes factual or technical corrections.

Technical corrections require one of the following:

* the error is objectively obvious;
* the correct behavior is confirmed by reliable documentation;
* the correction is explicitly requested by the user.

Separate technical corrections from stylistic edits in the final report.

Do not fabricate:

* versions;
* command output;
* test results;
* URLs;
* references;
* compatibility claims;
* release dates;
* configuration behavior.

### Refactor mode

Use only when explicitly requested.

This mode may change:

* post structure;
* shared Jekyll templates;
* navigation;
* taxonomy structure;
* repository organization;
* automation;
* CI configuration.

Do not perform repository-wide structural refactoring during a normal post-editing task.

---

## Required initial inspection

Before changing posts, inspect:

* `README.md`
* `_config.yml`
* `_layouts/`
* `categories.md`
* `posts.md`
* `.pre-commit-config.yaml`, if present
* representative files from `_posts/`

Inspect both older and newer posts to identify historical conventions.

Do not invent a new content convention before checking the existing repository.

---

## Post normalization rules

For reviewed posts:

* preserve the original meaning;
* preserve useful technical details;
* use valid Markdown;
* maintain a logical heading hierarchy;
* use fenced code blocks with language identifiers where appropriate;
* format commands, paths, filenames, variables and configuration as inline code;
* use consistent list and paragraph spacing;
* remove accidental duplicated text;
* preserve intentional HTML and Liquid syntax;
* preserve image paths and anchors;
* preserve links unless they are demonstrably broken;
* keep the post concise and technically precise.

Do not rewrite a post merely to make it sound more modern or stylistically uniform.

---

## Front matter

Infer the actual front matter schema from the repository before making changes.

Ensure:

* valid YAML;
* consistent field names;
* valid `layout`;
* meaningful title;
* correct date format;
* no duplicate or conflicting fields;
* categories and tags follow the repository taxonomy.

Do not add metadata that is not supported by the post or existing repository conventions.

Do not change filenames, slugs, permalinks or publication dates unless explicitly requested.

---

## Titles

Titles should be:

* descriptive;
* technically specific;
* searchable;
* consistent in terminology and capitalization;
* free from unnecessary repetition;
* free from clickbait.

The language of the title should normally match the language of the post.

Do not change a title if the proposed alternative is only a subjective stylistic preference.

---

## Categories and tags

Categories represent broad subject areas.

Tags represent:

* technologies;
* tools;
* operating systems;
* platforms;
* protocols;
* programming languages;
* specific concepts.

Rules:

* reuse existing values where appropriate;
* avoid near-duplicate categories;
* normalize capitalization;
* do not create a new category without checking existing taxonomy;
* do not assign tags based only on incidental mentions;
* do not over-tag posts;
* do not merge categories without reporting the decision.

When taxonomy is ambiguous, report the ambiguity instead of making an arbitrary change.

---

## Jekyll and Markdown safety

Preserve the behavior of:

* YAML front matter delimiters;
* Liquid expressions;
* Liquid tags and filters;
* raw HTML;
* anchors;
* image paths;
* relative links;
* code examples;
* shell commands;
* indentation-sensitive examples.

Do not interpret code examples as instructions to execute unless explicitly requested.

Do not change code semantics during formatting-only work.

---

## Technical content safety

Treat commands and configuration as potentially version-specific.

Before changing technical content:

* identify the technology and likely version;
* avoid replacing working commands with preferred alternatives without evidence;
* flag potentially outdated instructions;
* distinguish formatting changes from factual corrections;
* do not claim that commands were tested unless they were actually tested.

If correctness cannot be established, preserve the content and report the concern.

---

## Change boundaries

Prefer small, focused and reviewable changes.

Do not:

* rewrite all posts mechanically;
* change unrelated files;
* change site-wide configuration for a post-only task;
* rename post files without explicit approval;
* change historical dates without explicit approval;
* introduce plugins or dependencies without justification;
* modify layouts when a Markdown-only change is sufficient;
* remove content merely because it appears old;
* make broad taxonomy changes during an isolated post edit.

---

## Workflow

### For Audit mode

1. Inspect repository structure.
2. Read configuration and layouts.
3. Inspect representative posts.
4. Inventory front matter conventions.
5. Inventory categories and tags.
6. Identify recurring inconsistencies.
7. Classify findings by severity and confidence.
8. Produce an audit report.
9. Do not modify files.

### For Normalize mode

1. Inspect repository conventions.
2. Review the target post or selected batch.
3. Identify intended changes.
4. Apply minimal changes.
5. Preserve technical meaning and Jekyll behavior.
6. Validate Markdown and front matter.
7. Review taxonomy impact.
8. Produce a change report.

### For Correct mode

1. Identify the exact technical issue.
2. Confirm the correction using reliable evidence when needed.
3. Separate factual changes from formatting changes.
4. Apply the smallest safe correction.
5. Explain the correction in the report.
6. Mention unresolved uncertainty explicitly.

---

## Validation

Before finishing, check when applicable:

* front matter is valid YAML;
* Markdown structure is valid;
* code fences are balanced;
* code fences have appropriate language identifiers;
* local links and image paths remain unchanged or valid;
* Liquid syntax was not accidentally modified;
* filenames and permalinks remain stable;
* no unrelated files were changed;
* available repository checks pass.

Never report a check as passed unless it was actually performed.

---

## Final report

Every task that changes files must include:

* operating mode;
* reviewed files;
* changed files;
* summary of changes;
* technical corrections, if any;
* assumptions;
* unresolved issues;
* validation performed;
* recommended follow-up work.

Use the repository report format defined in `docs/agent-report.md`, if it exists.
