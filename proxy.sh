#!/bin/sh

SERVICE="Wi-Fi" # or Ethernet
PROXY_HOST=$1
PROXY_PORT=$2

if $@ < 3; then
	echo 'usage: ./proxy.sh <host> <port> <on/off>'
    exit
fi


case "$3" in
on)
  networksetup -setwebproxystate $SERVICE on
  networksetup -setwebproxy $SERVICE $PROXY_HOST $PROXY_PORT off
  networksetup -setsecurewebproxystate $SERVICE on
  networksetup -setsecurewebproxy $SERVICE $PROXY_HOST $PROXY_PORT off
  echo 'Web proxy is on'
;;
off)
  networksetup -setwebproxystate $SERVICE off
  networksetup -setsecurewebproxystate $SERVICE off
  echo 'Web proxy is off'
;;
*)
echo 'Wrong last parameter'
;;	
esac
