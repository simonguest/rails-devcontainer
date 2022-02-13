FROM ruby:2.7

# apt update and required libs
RUN apt-get update && \ 
    apt-get install -y nodejs npm --no-install-recommends

# Install MySQL Native Client
RUN apt-get -y install mariadb-client-core-10.5

# Install rails and bundler
RUN gem install rails bundler

# Install yarn
RUN npm i -g yarn

# Set working directory
WORKDIR /app

# Copy Gemfile and bundle install so we can install rails
COPY ./Gemfile /app/Gemfile
RUN bundle install

EXPOSE 3000
