#!/bin/sh
#
# Configured as part of the DigitalOcean 1-Click Image build process

myip=$(hostname -I | awk '{print$1}')
cat <<EOF
********************************************************************************

Welcome to DigitalOcean's 1-Click VictoriaLogs Droplet.
To keep this Droplet secure, the UFW firewall is enabled.
All ports are BLOCKED except 22 (SSH), 80 (HTTP), and 443 (HTTPS), 9428 (VictoriaLogs HTTP)

In a web browser, you can view:
 * The VictoriaLogs 1-Click Quickstart guide: https://kutt.it/1click-vlogs-quickstart

On the server:
  * The default VictoriaLogs root is located at /var/lib/victoria-logs-data
  * VictoriaLogs is running on ports: 9428 and it is bound to the local interface.

********************************************************************************
  # This image includes VL_VERSION version of VictoriaLogs. 
  # See Release notes https://github.com/VictoriaMetrics/VictoriaMetrics/releases/tag/vVL_VERSION

  # Welcome to VictoriaLogs droplet!

  # Website:       https://victoriametrics.com
  # Documentation: https://docs.victoriametrics.com
  # VictoriaLogs Github : https://github.com/VictoriaMetrics/VictoriaMetrics
  # VictoriaMetrics Slack Community: https://slack.victoriametrics.com
  # VictoriaMetrics Telegram Community: https://t.me/VictoriaMetrics_en

  # VictoriaMetrics config:   /etc/victorialogs/single/victorialogs.conf

********************************************************************************
EOF