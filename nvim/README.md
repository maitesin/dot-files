Vim SetUp
========

# Information
How to setup my Vim configuration in a Ubuntu (16.04) system.

# Steps to set it up

## Step 1. Install packages
```bash
sudo apt-get install vim vim-nox-py2 python-dev python3-dev cmake 
```

## Step 2. Linking config file
```bash
ln -s ~/workspace/dot-files/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
```

## Step 3. Clone Vundle and install plugins
[https://github.com/VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

## Step 4. Configure YouCompleteMe
```bash
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
