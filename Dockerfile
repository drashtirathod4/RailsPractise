FROM ruby:3.0.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ARG DEFAULT_PORT=3000

ADD . /Practise
WORKDIR /Practise 

ADD Gemfile /Practise/Gemfile
ADD Gemfile.lock /Practise/Gemfile.lock
RUN bundle install

ENV PORT $DEFAULT_PORT
EXPOSE $PORT
CMD ["bash"]
