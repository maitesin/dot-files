i3 SetUp
========

# Information
How to setup my i3 configuration in a Ubuntu (16.04) system.

# Steps to set it up

## Step 1. Install packages
```bash
sudo apt-get install i3 i3blocks git rofi feh lxappearance compton scrot
```

## Step 2. Install i3-gaps, i3blocks-gaps and i3lock-fancy
[i3-gaps](https://github.com/Airblader/i3)
[i3blocks](https://github.com/vivien/i3blocks)
[i3lock-fancy](https://github.com/meskarune/i3lock-fancy)


## Step 3. Linking config folders
```bash
rm -rf ~/.config/i3
ln -s ~/workspace/dot-files/i3wm ~/.config/i3
ln -s ~/workspace/dot-files/fonts ~/.fonts
# Place your wallpaper image in /home/maitesin/.wallpaper.jpg
sudo ln -s ~/workspace/i3lock-fancy/lock /usr/bin/lock
```

## Step 4. Set up the Arc Theme
[Arc Theme (Darker)](https://github.com/horst3180/arc-theme)
