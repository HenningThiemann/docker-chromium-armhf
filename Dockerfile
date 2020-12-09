FROM docker.io/arm32v7/ubuntu:bionic
MAINTAINER Furkan Kardame <furkan@fkardame.com>

# Install dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  git fontconfig fontconfig-config fonts-dejavu-core gconf-service gconf2-common \
  libasn1-8-heimdal libasound2 libasound2-data libatk1.0-0 libatk1.0-data libavahi-client3 libavahi-common-data \
  libavahi-common3 libcairo2 libcups2 libdatrie1 libdbus-1-3 libdbus-glib-1-2 libexpat1 libfontconfig1 \
  libfreetype6 libgconf-2-4 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgmp10 \
  libgnutls30 libgraphite2-3 libgssapi-krb5-2 libgssapi3-heimdal libgtk2.0-0 \
  libgtk2.0-common libharfbuzz0b libhcrypto4-heimdal libheimbase1-heimdal libheimntlm0-heimdal libhogweed4 \
  libhx509-5-heimdal libjbig0 libk5crypto3 libkeyutils1 \
  libkrb5-26-heimdal libkrb5-3 libkrb5support0 libldap-2.4-2 libnettle6 libnspr4 libnss3 \
  libp11-kit0 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpixman-1-0 libpng16-16 libroken18-heimdal \
  libsasl2-2 libsasl2-modules-db libsqlite3-0 libtasn1-6 libthai-data libthai0 libtiff5 libwind0-heimdal libx11-6 \
  libx11-data libxau6 libxcb-render0 libxcb-shm0 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxdmcp6 \
  libxext6 libxfixes3 libxi6 libxinerama1 libxml2 libxrandr2 libxrender1 libxss1 libxtst6 shared-mime-info ucf \
  x11-common xdg-utils libpulse0 pulseaudio-utils wget libatk-bridge2.0-0 libatspi2.0-0 libgtk-3-0 \
  mesa-va-drivers mesa-vdpau-drivers mesa-utils libosmesa6 libegl1-mesa libwayland-egl1-mesa libgl1-mesa-dri

# Add chromium dependencies
ADD dependencies/chromium-browser_78.0.3904.97-0ubuntu0.16.04.1_armhf.deb chromium-browser.deb
ADD dependencies/chromium-codecs-ffmpeg-extra_78.0.3904.97-0ubuntu0.16.04.1_armhf.deb chromium-codecs.deb
RUN echo "Updating Chromium..." && dpkg -i chromium-codecs.deb && dpkg -i chromium-browser.deb

# Add settings
#ADD chromium-settings /etc/chromium-browser/default

# Install Widevine
ADD widevine/libwidevinecdm.so /usr/lib/chromium-browser
ADD widevine/PepperFlash /usr/lib/chromium-browser/pepper

# Install Netflix 1080P Extension
ADD widevine/netflix-1080p-1.20.1 /usr/lib/chromium-browser/netflix-1080p

# Copy Pulseaudio config
COPY pulse-client.conf /etc/pulse/client.conf

# Set up the user
ENV UNAME mediaguy
RUN export UNAME=$UNAME UID=1000 GID=1000 && \
    mkdir -p "/home/${UNAME}" && \
    echo "${UNAME}:x:${UID}:${GID}:${UNAME} User,,,:/home/${UNAME}:/bin/bash" >> /etc/passwd && \
    echo "${UNAME}:x:${UID}:" >> /etc/group && \
    mkdir -p /etc/sudoers.d && \
    echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UNAME} && \
    chmod 0440 /etc/sudoers.d/${UNAME} && \
    chown ${UID}:${GID} -R /home/${UNAME} && \
    gpasswd -a ${UNAME} audio
USER $UNAME
ENV HOME /home/${UNAME}

CMD ["/usr/bin/chromium-browser", "--user-agent='Mozilla/5.0 (X11; CrOS armv7l 12607.82.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.123 Safari/537.36'"]
