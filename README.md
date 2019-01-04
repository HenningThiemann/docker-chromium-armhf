# docker-chromium-armhf
This is a Google Chromium container for any generic armhf device.
Currently, it provides widevine CDM support, and GPU acceleration on
Rockchip RK3399 devices.

## Build

```
git clone https://github.com/icebob/docker-chromium-armhf
cd docker-chromium-armhf
docker build -t teacupx/chromium-armhf .
```

## Running
On the host, you need to allow the docker user access to your local X session
```
xhost +local:docker
```
If `xhost` is not found, install the `x11-xserver-utils` package.

### Run the container:
```
docker run -v /tmp/.X11-unix:/tmp/.X11-unix --memory 512mb -e DISPLAY=unix$DISPLAY teacupx/chromium-armhf https://www.docker.com/
```
