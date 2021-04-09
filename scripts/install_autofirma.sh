#!/usr/bin/env bash

autofirma_file=/tmp/AutoFirma_Linux.zip

# Install dependencies
sudo apt install -y openjdk-8-jre libnss3-tools

# Download AutoFirma
wget https://estaticos.redsara.es/comunes/autofirma/currentversion/AutoFirma_Linux.zip -O ${autofirma_file}

# Unpack AutoFirma and install it
unzip ${autofirma_file} -d /tmp
sudo dpkg -i /tmp/AutoFirma*.deb
