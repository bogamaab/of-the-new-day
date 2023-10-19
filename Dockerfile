FROM ruby:3.0-bulleye as base

RUN apt update --qq && apt install -y build-essential apt-utils libpq-dev nodejs yarn

WORKDIR .

ENV BUNDLE_PATH /of-the-new-day/.gems
ENV GEM_HOME /of-the-new-day/.gems

RUN gem install bundler

COPY Gemfile* ./

ARG DEFAULT_PORT 3000

EXPOSE ${DEFAULT_PORT}
