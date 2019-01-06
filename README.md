# docker-chromium-armhf
This is a Google Chromium container for any generic armhf device.
Currently, it provides widevine CDM support, and GPU acceleration, 
if you can provide the needed debs.

It will look for extra debs to install in a tarball "packages.tgz".
Please put the tarball file in the same directory as the Dockerfile.

## Build

```
git clone https://github.com/teacupx/docker-chromium-armhf
cd docker-chromium-armhf
docker build -t teacupx/chromium-armhf .
docker volume create chromium_home
```

## Run the container:
```
docker run --rm --privileged \
 -e DISPLAY=unix$DISPLAY \
 -v chromium_home:/home \
 -v /tmp/.X11-unix:/tmp/.X11-unix \
 -v /dev:/dev -v /run:/run \
 -v /etc/machine-id:/etc/machine-id \
 teacupx/chromium-armhf \
 chromium-streaming
```
Or simply use the script armhf-run:
```
sudo install -m 755 armhf-run /usr/local/bin
armhf-run chromium-streaming
```
Notice that using the wrapper chromium-streaming will make Chromium fail for many pages, like the settings page.
To prevent this, you can also run the regular chromium-browser:
```
armhf-run chromium-browser
```
