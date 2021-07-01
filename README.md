Author: Matt Roth  
Date: Thu-01-Jul-2021  
Subject: Dotfile Dir Readme  

---------------------------------

### This repo was created to store an additional backup of my config files. 
And this readme was created because Future Me often forgets such things and could probably use the help if these details are ever important. If you're readng this Future Me, keep writing documentation. Sincerly, Past/Present Me.

### Steps to create this repo

**Move dotfiles from their original location to this directory**

```
mkcd dotfiles
mv ~/.vimrc .
mv ~/.bashrc .
mv ~/.mozilla/firefox/i8k3gkvw.default-1609888438900/chrome .
```

**Create Symbolic Links**

```
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/chrome ~/.mozilla/firefox/i8k3gkvw.default-1609888438900/chrome
ln -s ~/dotfiles/.vimrc ~/.vimrc
```
