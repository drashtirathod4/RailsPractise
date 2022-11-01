FROM ruby:3.0.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /Practise
WORKDIR /Practise

ADD Gemfile /Practise/Gemfile
ADD Gemfile.lock /Practise/Gemfile.lock

RUN bundle install
ADD . /Practise

CMD bash -c "rm -f tmp/pids/server.pid && rails s -p 3000 -b '0.0.0.0'"
