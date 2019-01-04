FROM arm32v7/ubuntu

MAINTAINER JMCC <JMCC@locahost>

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
  fontconfig fontconfig-config fonts-dejavu-core gconf-service gconf-service-backend gconf2-common \
  libasn1-8-heimdal libasound2 libasound2-data libatk1.0-0 libatk1.0-data libavahi-client3 libavahi-common-data \
  libavahi-common3 libcairo2 libcups2 libdatrie1 libdbus-1-3 libdbus-glib-1-2 libexpat1 libfontconfig1 \
  libfreetype6 libgconf-2-4 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgmp10 libgnome-keyring-common \
  libgnome-keyring0 libgnutls-deb0-28 libgraphite2-3 libgssapi-krb5-2 libgssapi3-heimdal libgtk2.0-0 \
  libgtk2.0-common libharfbuzz0b libhcrypto4-heimdal libheimbase1-heimdal libheimntlm0-heimdal libhogweed2 \
  libhx509-5-heimdal libicu52 libjasper1 libjbig0 libjpeg-turbo8 libjpeg8 libk5crypto3 libkeyutils1 \
  libkrb5-26-heimdal libkrb5-3 libkrb5support0 libldap-2.4-2 libnettle4 libnspr4 libnss3 libnss3-nssdb \
  libp11-kit0 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpixman-1-0 libpng12-0 libroken18-heimdal \
  libsasl2-2 libsasl2-modules-db libsqlite3-0 libtasn1-6 libthai-data libthai0 libtiff5 libwind0-heimdal libx11-6 \
  libx11-data libxau6 libxcb-render0 libxcb-shm0 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxdmcp6 \
  libxext6 libxfixes3 libxi6 libxinerama1 libxml2 libxrandr2 libxrender1 libxss1 libxtst6 shared-mime-info ucf \
  x11-common xdg-utils chromium-browser

# Add settings
ADD chromium-settings /etc/chromium-browser/default

ENTRYPOINT [ "/usr/bin/chromium-browser" ]

CMD [ "" ]
