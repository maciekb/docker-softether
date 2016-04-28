#!/bin/sh

if [ ! -d "/var/log/vpnserver/security_log" ]; then
  mkdir -p /var/log/vpnserver/security_log
fi

if [ ! -d "/var/log/vpnserver/packet_log" ]; then
  mkdir -p /var/log/vpnserver/packet_log
fi

if [ ! -d "/var/log/vpnserver/server_log" ]; then
  mkdir -p /var/log/vpnserver/server_log
fi

if [ ! -d "/usr/local/vpnserver/config" ]; then
  mkdir -p /usr/local/vpnserver/config
  mv /usr/local/vpnserver/vpn_server.conf /usr/local/vpnserver/config/
  ln -s /usr/local/vpnserver/config/* /usr/local/vpnserver/
fi

ln -s /var/log/vpnserver/*_log /usr/local/vpnserver/

exec /usr/local/vpnserver/vpnserver execsvc

exit $?
