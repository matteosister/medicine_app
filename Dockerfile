FROM matteosister/elixir

# base
RUN apt-get update && apt-get -qqy install git && rm -r /var/lib/apt/lists/*

# node
RUN apt-get update && apt-get -qqy install curl && rm -r /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup | bash -

RUN apt-get update && apt-get -qqy install nodejs && rm -r /var/lib/apt/lists/*

# inotify
RUN apt-get update && apt-get -qqy install inotify-tools mysql-client && rm -r /var/lib/apt/lists/*

# elm
RUN apt-get update && apt-get -qqy install ghc cabal-install && rm -r /var/lib/apt/lists/*
RUN cabal update && cabal install cabal-install --prefix=/usr/local
WORKDIR /root
RUN wget https://raw.githubusercontent.com/elm-lang/elm-platform/master/installers/BuildFromSource.hs
RUN cd /usr/local && runhaskell /root/BuildFromSource.hs 0.15.1
ENV PATH /usr/local/Elm-Platform/0.15.1/.cabal-sandbox/bin:$PATH

# app
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix hex.info

WORKDIR /app

CMD ["./startup.sh"]
