# docker-chromium-armhf
This is a Google Chromium container using the armhf architecture.
Currently, it provides widevine CDM support.

## Build
To build the application, you have to clone it first,
```
sudo apt install docker docker.io
git clone
cd docker-chromium-armhf
sudo docker build -t hthiemann/chromium-armhf .
```

## Run the container:
You need to enabel xhost forwarding first:
```
xhost +local:docker
```
If the xhost command can not be found, make sure to install it first (on manjaro, the required package is 'xorg-xhost').

Although not required, it is recommended to save chromium settings in a volume, to make it persistent through container restarts.
```
sudo docker volume create chromium_home
``` 
After creating the volume, you can run the image using the following command:
```
sudo docker pull hthiemann/docker-chromium-armhf

docker run --rm --privileged \
 -e DISPLAY=unix$DISPLAY \
 -v chromium_home:/home \
 -v /tmp/.X11-unix:/tmp/.X11-unix \
 -v /dev:/dev -v /run:/run \
 -v /etc/machine-id:/etc/machine-id \
 --ipc=host \
 --device /dev/dri \
 --group-add video \
 hthiemann/docker-chromium-armhf
```
Or simply use the script chromium-armhf:
```
sudo install -m 755 chromium-armhf /usr/local/bin
chromium-armhf
```

## Known Bugs
- HW accelaration not working (check chrome://gpu)
- Settings Tab crashed directly after loading
