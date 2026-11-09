FROM ruby:3.2.4-slim-bookworm AS base

ENV BUNDLE_PATH=/usr/local/bundle

WORKDIR /rails

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y libpq5 libvips42 && \
    rm -rf /var/lib/apt/lists/*

FROM base AS build

ARG BUNDLE_WITHOUT="development:test"

ENV BUNDLE_WITHOUT=${BUNDLE_WITHOUT}

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libpq-dev nodejs npm && \
    npm install --global yarn@1.22.21 && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

FROM build AS development

ENV RAILS_ENV=development \
    BUNDLE_WITHOUT=""

CMD ["bundle", "exec", "foreman", "start", "-f", "Procfile.dev"]

FROM build AS assets

RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

FROM base AS production

ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_WITHOUT=development:test \
    RAILS_LOG_TO_STDOUT=1

RUN groupadd --system --gid 1000 rails && \
    useradd --system --uid 1000 --gid rails --create-home --shell /bin/bash rails

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails/Gemfile /rails/Gemfile.lock /rails/Rakefile /rails/config.ru ./
COPY --from=build /rails/app ./app
COPY --from=build /rails/bin ./bin
COPY --from=build /rails/config ./config
COPY --from=build /rails/db ./db
COPY --from=build /rails/lib ./lib
COPY --from=assets /rails/public ./public

RUN mkdir -p log tmp/pids storage && \
    chown -R rails:rails /rails

USER rails

EXPOSE 3000

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
