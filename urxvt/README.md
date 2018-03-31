URxvt
=====

## Symlink the `.Xresources` file to the right place

```bash
ln -s ~/.dot-files/urxvt/.Xresources ~/.Xresources
xrdb -merge ~/.Xresources
```

