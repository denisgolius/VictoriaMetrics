#!/bin/sh

# Wait for cloud-init
cloud-init status --wait

wget https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${VM_VERSION}/victoria-logs-linux-amd64-v${VM_VERSION}.tar.gz -O /tmp/victoria-logs.tar.gz
tar xvf /tmp/victoria-logs.tar.gz -C /usr/bin
chmod +x /usr/bin/victoria-logs-prod
chown root:root /usr/bin/victoria-logs-prod


# Enable VictoriaMetrics on boot
systemctl enable vlsingle.service