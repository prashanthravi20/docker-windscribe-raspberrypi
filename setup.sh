#!/bin/bash
set -e

#
# Install windscribe
#
apt update
#Install dirmngr and apt-transport-https if not already installed
apt-get install dirmngr apt-transport-https

#Add the Windscribe signing key to apt as root
apt-key adv --keyserver keyserver.ubuntu.com --recv-key FDC247B7

#Add the repository to your sources.list
sh -c "echo 'deb https://repo.windscribe.com/debian buster main' > /etc/apt/sources.list.d/windscribe-repo.list"

#Run apt-get update
apt update

#Install windscribe-cli and resolvconf
apt install -y resolvconf
apt install -y windscribe-cli

# Common tools to check tht everything is alright
apt-get install -y vim dnsutils geoip-bin

#
# Cleaning the cache to limit the size of the image
#
apt clean
