FROM alpine:latest
RUN apk -U upgrade
RUN apk add --no-cache snapcast-server
COPY snapserver.conf /etc/snapserver.conf

#now snap web
RUN apk add --no-cache git make npm
RUN npm install -g typescript
#build
RUN git clone https://github.com/badaix/snapweb.git
RUN cd snapweb
RUN make -C snapweb
RUN mv /snapweb/dist/ /www
#clean up
RUN rm -rf /snapweb
RUN npm uninstall -g typescript
RUN apk del git make npm

EXPOSE 1704 1705 1780
ENTRYPOINT ["snapserver"]
