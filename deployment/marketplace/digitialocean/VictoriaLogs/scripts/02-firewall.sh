#!/bin/sh

sed -e 's|DEFAULT_FORWARD_POLICY=.*|DEFAULT_FORWARD_POLICY="ACCEPT"|g' \
    -i /etc/default/ufw

ufw allow ssh comment "SSH port"
ufw allow http comment "HTTP port"
ufw allow https comment "HTTPS port"
ufw allow 9428 comment "VictoriaLogs Single HTTP port"

ufw --force enable