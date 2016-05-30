#!/bin/bash

aptitude_install=aptitude install -y

sudo apt-get install aptitude git zsh oh-my-zsh
sudo add-apt-repository ppa:webupd8team/y-ppa-manager ppa:neovim-ppa/unstable
sudo aptitude update

`$aptitude_install` python-dev python-pip python3-dev python3-pip
`$aptitude_install` y-ppa-manager nvim


