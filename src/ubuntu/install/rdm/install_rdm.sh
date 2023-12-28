#!/usr/bin/env bash
set -ex
wget -q https://cdn.devolutions.net/download/Linux/RDM/2023.3.1.4/RemoteDesktopManager_2023.3.1.4_amd64.deb -O rdm.deb
apt-get update
apt-get install -y ./rdm.deb
cp /usr/share/applications/remotedesktopmanager.desktop $HOME/Desktop/
chmod +x $HOME/Desktop/remotedesktopmanager.desktop
chown 1000:1000 $HOME/Desktop/remotedesktopmanager.desktop
rm rdm.deb

# Cleanup
if [ -z ${SKIP_CLEAN+x} ]; then
  apt-get autoclean
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/*
fi
