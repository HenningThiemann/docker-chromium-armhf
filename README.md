# docker-chromium-armhf
Please note that this container is **NOT** stable yet !
This is a Google Chromium container for Raspberry Pi (armhf)

## Build

```
git clone https://github.com/icebob/docker-chromium-armhf
cd docker-chromium-armhf
docker build -t icebob/chromium-armhf .
```

## Running

```
docker run -v /tmp/.X11-unix:/tmp/.X11-unix --memory 512mb -e DISPLAY=unix:$DISPLAY icebob/chromium-armhf https://www.docker.com/
```
