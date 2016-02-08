#!/bin/bash
if [ ! -f /etc/openvpn/server.conf ]
then
    cp /usr/share/openvpn/examples/server.conf /etc/openvpn/server.conf
fi
openvpn /etc/openvpn/server.conf
