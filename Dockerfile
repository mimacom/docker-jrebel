FROM alpine:3.8
MAINTAINER sysadmin@mimacom.com

# Setup useful environment variables
ENV JREBEL_INSTALL  /opt/jrebel
ENV JREBEL_VERSION  3.6.3
ENV JREBEL_DOWNLOAD_URL https://dl.zeroturnaround.com/license-server/releases/license-server-${JREBEL_VERSION}.zip
LABEL Description="jRebel license server" Version="${JREBEL_VERSION}"

RUN \
  apk add --no-cache bash openjdk8 && \
  mkdir -p "${JREBEL_INSTALL}" && \
  cd "${JREBEL_INSTALL}" && \
  wget "${JREBEL_DOWNLOAD_URL}" -O /tmp/jrebel.zip && \
  unzip -d "${JREBEL_INSTALL}" /tmp/jrebel.zip && \
  rm /tmp/jrebel.zip

CMD [ "bash", "-c", "${JREBEL_INSTALL}/license-server/bin/license-server.sh run" ]
