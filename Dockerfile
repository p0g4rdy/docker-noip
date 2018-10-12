FROM alpine:3.8
MAINTAINER MqllR <>

ARG NOIP_VERSION=2.1.9-1
ARG NOIP_URL=http://www.noip.com/client/linux/noip-duc-linux.tar.gz

RUN apk --no-cache add --virtual .build \
            gcc \
            make \
            libc-dev

RUN cd /tmp && \
    wget $NOIP_URL && \
    tar xzf noip-duc-linux.tar.gz && \
    cd noip-$NOIP_VERSION && \
    make noip2 && \
    mv noip2 /usr/local/bin/noip2 && \
    cd / && \
    rm -rf /tmp/noip-$NOIP_VERSION && \
    apk del .build

COPY entrypoint.sh /entrypoint.sh

VOLUME /usr/local/etc

ENTRYPOINT ["./entrypoint.sh"]
