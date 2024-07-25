#!/bin/sh

# Create victoriametrics user
groupadd -r victorialogs
useradd -g victorialogs -d /var/lib/victoria-logs-data -s /sbin/nologin --system victorialogs

mkdir -p /var/lib/victoria-logs-data
chown -R victorialogs:victorialogs /var/lib/victoria-logs-data

rm -rf /var/lib/apt/lists/*
apt update
DEBIAN_FRONTEND=noninteractive apt -y full-upgrade
DEBIAN_FRONTEND=noninteractive apt -y install curl git wget software-properties-common
rm -rf /var/log/kern.log
rm -rf /var/log/ufw.log