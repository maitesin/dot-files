#!/bin/bash
ifconfig $1 | grep -e "netmask" | awk '{print $2}'
