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
On the host, you need to allow the docker user access to your local X session
```
xhost +local:docker
```
If `xhost` is not found, install the `x11-xserver-utils` package.

### Run the container:
```
docker run -v /tmp/.X11-unix:/tmp/.X11-unix --memory 512mb -e DISPLAY=unix$DISPLAY icebob/chromium-armhf https://www.docker.com/
```
