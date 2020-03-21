---
title: .gitlab-ci.yml sample
category: GitLab
date: 2020-03-21
---

-----

```yaml
build site:
  image: node:7
  stage: build
  script:
    - npm install --progress=false
    - npm run build
  only:
      - publish
  artifacts:
    paths:
    - int-build/

deploy:
  image: alpine
  stage: deploy
  script:
    - apk add --no-cache rsync openssh
    - mkdir -p ~/.ssh
    - echo "$SSH_PRIVATE_KEY" >> ~/.ssh/id_dsa
    - chmod 600 ~/.ssh/id_dsa
    - echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
    - rsync -ravO int-build/ user@11.122.133.144:/var/www/html/
  only:
      - publish
```

-----

[Source](https://medium.com/@rosswritescode/deploy-your-site-with-gitlab-ci-cd-2944816dcb4a)

-----
