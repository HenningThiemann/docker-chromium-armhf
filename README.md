# docker-chromium-armhf
This is a Google Chromium container using the armhf architecture.
Currently, it provides widevine CDM support, and GPU acceleration, 
if you can provide the needed debs. Also provides Pulseaudio
support.

It will look for extra debs to install in the directory "packages".
Please put your chromium-widevine deb into that directory, as well
as any other extra deb required for GPU acceleration.

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
