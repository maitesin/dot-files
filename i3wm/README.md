i3 SetUp
========

# Information
How to setup my i3 configuration in a Ubuntu (16.04) system.

# Steps to set it up

## Step 1. Install packages
```bash
sudo apt-get install i3 i3status git dmenu feh lxappearance compton scrot
```

## Step 2. Linking config folders
### GNU/LINUX
```bash
rm -rf ~/.config/i3
ln -s ~/workspace/dot-files/i3wm ~/.config/i3
ln -s ~/workspace/dot-files/i3status ~/.config/i3status
# Place your wallpaper image in ~/.wallpaper.jpg
```
### FreeBSD/OpenBSD 
```bash
rm -rf ~/.i3
ln -s ~/workspace/dot-files/i3wm ~/.i3
ln -s ~/workspace/dot-files/i3status/config ~/.i3status.conf
# Place your wallpaper image in ~/.wallpaper.jpg
```
## Step 3. Set up the Arc Theme
[Arc Theme (Darker)](https://github.com/horst3180/arc-theme)
