#!/bin/sh

if [ ! -d "/var/log/vpnserver" ]; then
  mkdir -p /var/log/vpnserver/security_log
  mkdir -p /var/log/vpnserver/packet_log
  mkdir -p /var/log/vpnserver/server_log
  ln -s /var/log/vpnserver/*_log /usr/local/vpnserver/
fi

if [ ! -d "/etc/vpnserver/config" ]; then
  mkdir -p /etc/vpnserver/config
  mv /usr/local/vpnserver/*.config /etc/vpnserver/config/
  ln -s /etc/vpnserver/config/* /usr/local/vpnserver/
fi

exec /usr/local/vpnserver/vpnserver execsvc

exit $?
