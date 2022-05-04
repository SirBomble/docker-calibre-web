## Buildstage ##
FROM ghcr.io/linuxserver/baseimage-ubuntu:arm64v8-focal

RUN \
  echo "**** install runtime packages ****" && \
  pacman -Sy --noconfirm --needed \
    calibre && \
  dbus-uuidgen > /etc/machine-id && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/* \
    /var/cache/pacman/pkg/* \
    /var/lib/pacman/sync/*

# add local files
COPY root/ /
