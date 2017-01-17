FROM ruby:2.4.0-alpine
ENV LANG C.UTF-8
ENV BUILD_PACKAGES="curl-dev ruby-dev build-base bash" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev mysql-dev" \
    RUBY_PACKAGES="ruby-json yaml nodejs"


RUN apk update && \
    apk upgrade && \
    apk add --update\
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /usr/src/app

RUN mkdir /myapp
WORKDIR /myapp
ADD ./rails/src /myapp
EXPOSE 3000
RUN gem install nokogiri -- --use-system-libraries && \
    gem install rails --pre && \
    bundle install && \
    bundle clean

CMD ["rails", "s", "-b", "0.0.0.0", "-p", "3000"]
