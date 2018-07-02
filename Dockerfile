FROM gitreg.systemadmin.com/door3/credmo-infrastructure/docker-cypress-base:latest

ARG FIREFOX_VERSION=57.0.2

# "fake" dbus address to prevent errors
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
ENV WORKDIR /src
# a few environment variables to make NPM installs easier
# good colors for most applications
ENV TERM xterm
# avoid million NPM install messages
ENV npm_config_loglevel warn
# allow installing when the main user is root
ENV npm_config_unsafe_perm true

# install Chromebrowser
RUN \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub \
    | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
  && apt-get -qq update \
  && apt-get -qqy install dbus-x11 google-chrome-stable \
  && apt-get -qqy clean \
  && rm -rf /var/lib/apt/lists/*

# Commented out because cypress does not yet support firefox
# # install Firefox browser
# RUN \
#   wget -q -O - https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2 \
#     | tar -C /opt -xjf - \
#   && ln -fs /opt/firefox/firefox /usr/bin/firefox

# Add zip utility - cypress uses it during install
RUN apt-get -qq update \
    && apt-get -qqy install zip git \
    && apt-get -qqy clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p ${WORKDIR}
WORKDIR ${WORKDIR}

COPY src/package.json .
COPY src/cypress.json .
COPY src/cypress ./cypress

RUN npm install

# versions of local tools
RUN node -v \
    && npm -v \
    && yarn -v \
    && google-chrome --version \
    # firefox --version \
    && zip --version \
    && git --version \
    && $(npm bin)/cypress -v

# start the tests
CMD ["npm","start"]
