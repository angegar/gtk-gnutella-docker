FROM alpine/git


WORKDIR /
RUN git clone https://github.com/gtk-gnutella/gtk-gnutella.git &&\
    apk update && apk add --no-cache -y make build-base gettext gtk+2.0-dev glib-dev zlib

RUN cd gtk-gnutella && git checkout devel && git pull origin devel && ./build.sh
