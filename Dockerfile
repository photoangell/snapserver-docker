FROM alpine:latest
RUN apk -U upgrade \
    && apk add --no-cache snapcast-server
COPY snapserver.conf /etc/snapserver.conf

#now snap web - build
RUN apk add --no-cache --virtual .build-deps git make npm \
    && npm install -g typescript \
    && git clone https://github.com/badaix/snapweb.git \snapweb \
    && make -C snapweb \
    && npm uninstall -g typescript \
    && apk del --no-cache .build-deps

#cleanup
RUN mv /snapweb/dist/ /www \
    && rm -rf /snapweb

EXPOSE 1704 1705 1780
ENTRYPOINT ["snapserver"]
