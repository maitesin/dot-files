URxvt SetUp
========

# Information
How to setup my URxvt configuration in a Ubuntu (16.04) system.

# Steps to set it up

## Step 1. Install packages
```bash
sudo apt-get install rxvt-unicode-256color
```

## Step 2. Linking config file
```bash
ln -s ~/workspace/dot-files/urxvt/.Xresources ~/.Xresources
xrdb -merge ~/.Xresources
```

