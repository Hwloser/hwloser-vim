#!/bin/bash

work_dir="~/.hwloser-vim"
sudo apt-get update
sudo apt-get install neovim git make

git clone https://github.com/Hwloser/hwloser-vim.git $work_dir
cd $work_dir
make
