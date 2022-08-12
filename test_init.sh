#!/bin/bash

dir_name=$(cd $(dirname $0); pwd)
# 
# options_path=$dir_name/lua/

export LUA_PATH="$dir_name/lua/core/?.lua;;"

lua $dir_name/init.lua
