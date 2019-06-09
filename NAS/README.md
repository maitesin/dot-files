# NAS

## Network

Replace the content of `/etc/netplan/50-cloud-init.yaml` with:

```
# This file is generated from information provided by
# the datasource.  Changes to it will not persist across an instance.
# To disable cloud-init's network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    version: 2
    renderer: networkd
    ethernets:
        enp7s0:
            dhcp4: no
        enp8s0:
            dhcp4: true

    bridges:
        br0:
            interfaces: [enp7s0]
            dhcp4: no
            addresses: [192.168.0.88/24, ]
            gateway4: 192.168.0.1
            nameservers:
                addresses: [192.168.0.1]
```

And run

```
sudo netplan apply
```
