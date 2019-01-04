# docker-chromium-armhf
This is a Google Chromium container for any generic armhf device.
Currently, it provides widevine CDM support, and GPU acceleration, 
if you can provide the needed debs. Also provides Pulseaudio
support.

It will look for extra debs to install in a tarball "packages.tgz".
Please put the tarball file in the same directory as the Dockerfile.

## Build

```
git clone https://github.com/teacupx/docker-chromium-armhf
cd docker-chromium-armhf
cp /path/to/packages.tgz .
docker build -t teacupx/chromium-armhf .
```

## Run the container:
```
docker run --privileged -e DISPLAY=unix$DISPLAY \
 -v /tmp/.X11-unix:/tmp/.X11-unix \
 -v /dev:/dev -v /run:/run \
 -v /etc/machine-id:/etc/machine-id \
 teacupx/chromium-armhf chromium-streaming
```
