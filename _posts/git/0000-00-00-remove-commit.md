---
title: Remove commit
category: Git
date: 2026-04-24
---

-----

```bash
You can use git cherry-pick for this. Let's say your git log looks like this. and you want to remove the 2nd commit from your branch.

COMMITS    MESSAGES
abcd123    4th commit message
xyze456    3rd commit message
98y65r4    2nd commit message wants to be removed.
bl8976t    1st commit message
STEP 1 - Checkout the last correct commit: git checkout bl8976t

STEP 2 - Create a new branch from there: git checkout -b commit-remove

STEP 3 - Cherry pick commits you want to keep: git cherry-pick xyze456 and git cherry-pick abcd123

STEP 4 - Checkout your original branch: git checkout master

STEP 5 - Reset original branch to last usable commit: git reset --hard bl8976t

STEP 6 - Merge the new branch onto the original branch: git merge commit-remove

STEP 7 - Check that the original branch has the correct commits: git log

STEP 8 - Push the original branch to the remote repo: git push --force origin original-branch-name

You are done.

Beware that this could have adverse effects on other users who are working on the same repository/branch.

```

-----
