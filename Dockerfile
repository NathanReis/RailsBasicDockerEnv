FROM ruby:2.6

RUN apt update \
    && apt upgrade -y \
    && apt autoclean

# Install NodeJs v14 - LTS
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs

RUN npm install -g yarn

RUN gem install rails -v 5.2 \
    && gem install pry

# Create a config file for irb to use pry
RUN echo "require 'rubygems'\nrequire 'pry'\n\nPry.start\n\nexit" \
    > ~/.irbrc
