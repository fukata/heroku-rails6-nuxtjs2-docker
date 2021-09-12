FROM ruby:3.0.2-bullseye

ARG RAILS_ENV=production

RUN mkdir /app

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install -j4

COPY . .

CMD bin/rails server -b 0.0.0.0
