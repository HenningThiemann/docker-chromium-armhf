# docker-chromium-armhf
This is a Google Chromium container for any generic armhf device.
Currently, it provides widevine CDM support, and GPU acceleration, 
if you can provide the needed debs.

It will look for extra debs to install in a tarball "packages.tgz".
Please put the tarball file in the same directory as the Dockerfile.

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
docker run --privileged --memory 512mb -e DISPLAY=unix:0.0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/mali0:/host/dev/mali0 -v /dev/fb0:/host/dev/fb0 teacupx/chromium-armhf
