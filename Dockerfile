# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
# Base Stage
ARG RUBY_VERSION=3.0.6
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Rails app lives here
ENV APP_HOME /of-the-new-day
ENV RAILS_LOG_TO_STDOUT true
ENV LANG=C.UTF-
ENV LC_ALL=C.UTF-8
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev libvips pkg-config

ENV BUNDLE_PATH $APP_HOME/.gems
ENV GEM_HOME $APP_HOME/.gems

# Install application gems
COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

# Copy application code
COPY . .

RUN gem install bundler:2.4.21

RUN bundle config unset frozen && \
    bundle config set frozen false && \
    bundle install && \
    bundle exec bootsnap precompile --gemfile

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Entrypoint prepares the database.
ENTRYPOINT ["/of-the-new-day/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
