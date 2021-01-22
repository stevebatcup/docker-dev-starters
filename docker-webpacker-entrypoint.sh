#!/bin/bash -e

echo "Bundle check || install"
bundle check || bundle install

echo "Installing webpacker..."
bundle exec rails webpacker:install
# bundle exec rails webpacker:install:typescript
# bundle exec rails webpacker:install:vue

echo "Starting webpack dev server...."
ruby /usr/src/app/bin/webpack-dev-server