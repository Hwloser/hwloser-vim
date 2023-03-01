#!/bin/bash

work_dir=$HOME/.hwloser-vim
sudo apt-get update -y
sudo apt-get install neovim git make -y

git clone https://github.com/Hwloser/hwloser-vim.git $work_dir
cd $work_dir
make
