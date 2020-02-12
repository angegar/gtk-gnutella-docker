FROM alpine/git

ENV USER=gtkgnutella
ENV UID=12345
ENV GID=23456

RUN addgroup --gid "$GID" "$USER" \
    && adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$USER" \
    --no-create-home \
    --uid "$UID" \
    "$USER"
    
WORKDIR /
RUN git clone https://github.com/gtk-gnutella/gtk-gnutella.git &&\
    apk update && apk add --no-cache -y make build-base gettext gtk+2.0-dev glib-dev zlib

#  su - username -c 'gtk-gnutella --daemonize'
WORKDIR /gtk-gnutella
RUN git checkout devel && git pull origin devel && ./build.sh

USER "$USER"
ENTRYPOINT ['/bin/sh','-c','src/gtk-gnutella']