i3 SetUp
========

# Information
How to setup my i3 configuration in a Ubuntu (16.04) system.

# Steps to set it up

## Step 1. Install packages
```bash
sudo apt-get install i3 i3blocks git rofi feh 
```

## Step 2. Linking config folders
```bash
rm -rf ~/.config/i3
ln -s ~/workspace/dot-files/i3wm ~/.config/i3
ln -s ~/workspace/dot-files/fonts ~/.fonts
# Place your wallpaper image in /home/maitesin/.wallpaper.jpg
```
