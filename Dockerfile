FROM ruby:2.7.2-buster
RUN gem install bundler
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
COPY . ./
RUN chmod +x ./entrypoints/docker-entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

