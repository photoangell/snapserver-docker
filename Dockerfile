FROM multiarch/alpine:latest
RUN apk -U upgrade
RUN apk add --no-cache snapcast-server
COPY snapserver.conf /etc/snapserver.conf
EXPOSE 1704 1705 1780
ENTRYPOINT snapserver
