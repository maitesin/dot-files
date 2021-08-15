#!/usr/bin/env bash

echo "To configure a VPN (L2TP) in Linux follow the following guide:"
echo "https://gist.github.com/pastleo/aa3a9524664864c505d637b771d079c9"
echo ""
echo "You need to install the following dependencies:"
echo "sudo apt install network-manager-l2tp{,-gnome}"
echo ""
echo "Then run the following command replacing the required values with your personal ones:"
echo "nmcli c add con-name CON_NAME type vpn vpn-type l2tp vpn.data 'gateway=GATEWAY_HOST, ipsec-enabled=yes, ipsec-psk=PRE_SHARED_KEY, password-flags=2, user=USERNAME'"
