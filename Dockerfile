FROM ruby:3.1.2-alpine

# 環境変数（ENV文で宣言）は、Dockerfileが解釈する変数として特定の命令で使用することもできます。
# 環境変数を定義している
# 環境変数はDockerfileでは$variable_nameまたは${variable_name}で表記されます。
ENV APP_HOME /var/app

# サーバーのタイムゾーンを設定する
ENV TZ Asia/Tokyo

RUN apk add --update --no-cache \
      bash \
      curl \
      g++ \
      git \
      make \
      postgresql-client \
      postgresql-dev \
      build-base \
      openssl \
      tzdata \
      nodejs \
      yarn

WORKDIR $APP_HOME

RUN gem i bundler

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle i

COPY . .

CMD ["./bin/development.sh"]
