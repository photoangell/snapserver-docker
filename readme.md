a super small snapserver image based on Alpine linux

clocks in at 11.5mb

build with
docker build -t photoangell/snapserver .

run with
docker run --rm -d -p 1704:1704 -p 1705:1705 -p 1780:1780 -v /tmp/snapfifo:/tmp/snapfifo -v /tmp/ttsfifo:/tmp/ttsfifo --name snapserver photoangell/snapserver

copy the service file
cp ~/snapserverdocker/docker.snapserver.service /etc/systemd/system/
systemctl daemon-reload 
dietpi-services restart docker.snapserver
docker logs -f snapserver
