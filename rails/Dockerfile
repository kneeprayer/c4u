FROM ruby:2.4.0-alpine
MAINTAINER kneeprayer <kneeprayer@gmail.com>
ENV LANG ja_JP.UTF-8
ENV RAILS_ENV development
ENV BUILD_PACKAGES="curl-dev ruby-dev build-base bash git" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev mysql-dev" \
    RUBY_PACKAGES="ruby-json yaml nodejs openssh"

# Update and install base packages and nokogiri gem that requires a
# native compilation
RUN apk update && \
    apk upgrade && \
    apk add --update\
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /usr/src/app

# Copy the app into the working directory. This assumes your Gemfile
# is in the root directory and includes your version of Rails that you
# want to run.
ONBUILD WORKDIR /usr/src/app
#ONBUILD ADD ./src /usr/src/app
ONBUILD RUN bundle config build.nokogiri --use-system-libraries && \
            bundle install && \
            bundle clean


#CMD ["rails", "s", "-b", "0.0.0.0", "-p", "3000"]
