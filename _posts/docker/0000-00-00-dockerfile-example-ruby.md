---
title: Dockerfile example ruby
category: Docker
date: 2023-02-06
---

-----

```docker
FROM ruby:2.3 as builder

WORKDIR /myapp

ENV DEBIAN_FRONTEND noninteractive

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -qq -y --no-install-recommends build-essential nodejs yarn

COPY Gemfile* ./

RUN bundle config git.allow_insecure true && \
    bundle check || \
    bundle install --clean --jobs 20 --quiet --retry 5

RUN yarn install && \
    yarn global add gulp && \
    gulp

COPY . .

RUN rake RAILS_ENV=staging DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile



FROM ruby:2.3-slim

WORKDIR /myapp

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -qq -y --no-install-recommends curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt-get install -qq -y --no-install-recommends libpq-dev git nodejs fontconfig imagemagick nginx-light

COPY --from=builder /myapp ./
COPY --from=builder /usr/local/bundle /usr/local/bundle

RUN mv staging/secrets/bundle_config /usr/local/bundle/config && \
    cp -r staging/nginx/* /etc/nginx/

RUN apt-get clean && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/nginx/sites*
```

-----
