FROM alpine:edge
MAINTAINER Alvaro Lizama Molina <me@alvarolizama.net>
RUN apk --no-cache add -U musl musl-dev ncurses-libs
COPY ./src/_build/prod/rel /rel
WORKDIR /rel
CMD /rel/web_app/bin/web_app foreground
