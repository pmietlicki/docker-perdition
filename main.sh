#!/bin/bash

CRT="/etc/perdition/perdition.crt.pem"
KEY="/etc/perdition/perdition.key.pem"

/etc/init.d/rsyslog start

/etc/init.d/perdition start

tail -f /var/log/syslog