FROM ruby:2.6.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# nodejs
# https://github.com/nodesource/distributions#installation-instructions
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y --no-install-recommends nodejs

RUN mkdir /src
WORKDIR /src
ADD Gemfile /src/Gemfile
ADD Gemfile.lock /src/Gemfile.lock
RUN gem update --system && gem install bundler
RUN bundle install
ADD . /src
