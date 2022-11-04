FROM ruby:3.0.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ADD . /Practise
WORKDIR /Practise 

ADD Gemfile /Practise/Gemfile
ADD Gemfile.lock /Practise/Gemfile.lock
RUN bundle install

EXPOSE 3000
CMD ["bash"]
