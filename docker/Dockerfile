FROM node:8-jessie

LABEL maintainer = "Hadi Tajallaei"
LABEL license = "MIT"

USER root

RUN echo "Updating the list of debian packages"
RUN apt-get update -y

RUN echo "Updating global npm to latest version"
RUN npm install npm@latest -g

RUN echo "Installing binary dependencies for Cypress"
RUN apt-get install -y \
    zip \
    git \
    wget \
    xvfb \
    libgtk2.0-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    xterm

RUN echo "Installing Chrome browser [Cypress browser dependency]"
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    apt-get update && apt-get install -y \
    dbus-x11 \
    google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# "Fake" dbus address to prevent errors [https://github.com/SeleniumHQ/docker-selenium/issues/87]
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

# Good colors for most applications [Colouring for results of integration]
ENV TERM xterm

# Avoid million NPM install messages
ENV npm_config_loglevel warn

# Allow installing when the main user is root
ENV npm_config_unsafe_perm true

RUN mkdir -p /var/cypress

WORKDIR /var/cypress

COPY docker/entry-point.sh /usr/bin

ENTRYPOINT ["entry-point.sh"]