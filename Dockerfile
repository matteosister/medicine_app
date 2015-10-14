FROM matteosister/elixir

# base
RUN apt-get update && apt-get -qqy install git && rm -r /var/lib/apt/lists/*

# node
RUN apt-get update && apt-get -qqy install curl && rm -r /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup | bash -

RUN apt-get update && apt-get -qqy install nodejs && rm -r /var/lib/apt/lists/*

# inotify
RUN apt-get update && apt-get -qqy install inotify-tools mysql-client && rm -r /var/lib/apt/lists/*

# app
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix hex.info

WORKDIR /app

CMD ["./startup.sh"]
