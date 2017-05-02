FROM elixir:1.4.2

WORKDIR /github_trends
ADD github_trends /github_trends

# Install nodeJS
RUN apt-get update \
    && apt-get -y install curl \
    && curl -sL https://deb.nodesource.com/setup_7.x | bash - \
    && apt-get install -y nodejs

# Install dependencies
RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix deps.get \
    && npm install
