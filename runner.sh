#!/bin/sh

if [ ! -d "/var/log/vpnserver" ]; then
  mkdir -p /var/log/vpnserver/security_log
  mkdir -p /var/log/vpnserver/packet_log
  mkdir -p /var/log/vpnserver/server_log
fi

if [ -d "/usr/local/vpnserver/backup.vpn_server.config" ]; then
  if [ ! -L "/usr/local/vpnserver/backup.vpn_server.config" ]; then
    mkdir -p /etc/vpnserver/config/backup.vpn_server.config
    mv /usr/local/vpnserver/backup.vpn_server.config /etc/vpnserver/config/
    ln -s /etc/vpnserver/config/backup.vpn_server.config /usr/local/vpnserver/
  fi
else
  mkdir -p /etc/vpnserver/config/backup.vpn_server.config
  ln -s /etc/vpnserver/config/backup.vpn_server.config /usr/local/vpnserver/
fi

if [ -f "/usr/local/vpnserver/vpn_server.config" ]; then
  if [ ! -L "/usr/local/vpnserver/vpn_server.config" ]; then
    mv /usr/local/vpnserver/vpn_server.config /etc/vpnserver/config/
    ln -s /etc/vpnserver/config/vpn_server.config /usr/local/vpnserver/vpn_server.config
  fi
else
  touch /etc/vpnserver/config/vpn_server.config
  ln -s /etc/vpnserver/config/vpn_server.config /usr/local/vpnserver/vpn_server.config
fi

if [ -f "/usr/local/vpnserver/lang.config" ]; then
  if [ ! -L "/usr/local/vpnserver/lang.config" ]; then
    mv /usr/local/vpnserver/lang.config /etc/vpnserver/config/
    ln -s /etc/vpnserver/config/lang.config /usr/local/vpnserver/lang.config
  fi
else
  touch /etc/vpnserver/config/lang.config
  ln -s /etc/vpnserver/config/lang.config /usr/local/vpnserver/lang.config
fi

ln -s /var/log/vpnserver/*_log /usr/local/vpnserver/

exec /usr/local/vpnserver/vpnserver execsvc

exit $?
