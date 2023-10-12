FROM ruby:3.0
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN apt update
RUN apt install -y nodejs yarn
ENV BUNDLE_PATH /of-the-new-day/.gems
ENV GEM_HOME /of-the-new-day/.gems
RUN gem install rails -v '7.1.1'
RUN gem install bundler
