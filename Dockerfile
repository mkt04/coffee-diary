FROM ruby:3.0.3

# yarnパッケージ管理ツールをインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget vim && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

RUN apt-get update -qq && apt-get install -y nodejs yarn
RUN mkdir /coffee-diary
WORKDIR /coffee-diary
COPY Gemfile /coffee-diary/Gemfile
COPY Gemfile.lock /coffee-diary/Gemfile.lock
RUN bundle install
COPY . /coffee-diary

RUN yarn install --check-files
RUN yarn add resolve-url-loader@^4.0.0
RUN yarn add acorn@^8.5.0

RUN bundle exec rails webpacker:compile

ENV TZ '/usr/share/zoneinfo/Asia/Tokyo'
ENV LANG ja_JP.UTF-8
ENV LC_ALL C.UTF-8
ENV LANGUAGE ja_JP.UTF-8

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]