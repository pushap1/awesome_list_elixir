FROM elixir:1.10.1

RUN apt-get update && apt-get install -y build-essential

RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - && apt-get install -y nodejs

RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix archive.install hex phx_new 1.4.0 --force

WORKDIR /awesome