#!/usr/bin/env bash

# Install dependencies
sudo apt install -y libccid pcscd

# Download deb file for Ubuntu 20.04 & Debian 10 from https://www.dnielectronico.es/PortalDNIe/PRF1_Cons02.action?pag=REF_1112
wget https://www.dnielectronico.es/descargas/distribuciones_linux/libpkcs11-dnie_1.6.6_amd64.deb -O /tmp/libpkcs11-dnie.deb

# Install deb
sudo dpkg -i /tmp/libpkcs11-dnie.deb

