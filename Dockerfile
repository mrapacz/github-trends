FROM elixir:1.4.2

WORKDIR /github_trends
ADD github_trends /github_trends
ENV CLIENT_ID "c72d23ae4941bc4c754a"
ENV CLIENT_SECRET "c17705f084c600a97b2b5bdeced2f64136f59780"
ENV REDIRECT_URI http://127.0.0.1:4000/auth/github/callback

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
