#!/usr/bin/env bash
set -eo pipefail

# just for install
installer_path=$(cd $(dirname $0); pwd)

# 1. setting the path of prefix for INSTALL hwloser-vim
INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"

# 2. the common homes, { data, cache, config } 
XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

# 3. custom dir for hwloser
# HWLOSER_VIM_RUNTIME_DIR="${HWLOSER_VIM_RUNTIME_DIR:-"$XDG_DATA_HOME/hwloser-vim"}"
# HWLOSER_VIM_CONFIG_DIR="${HWLOSER_VIM_CONFIG_DIR:-"$XDG_CONFIG_HOME/hvim"}"
# HWLOSER_VIM_CACHE_DIR="${HWLOSER_VIM_CACHE_DIR:-"$XDG_CACHE_HOME/hvim"}"
# 
# LUNARVIM_BASE_DIR="${LUNARVIM_BASE_DIR:-"$LUNARVIM_RUNTIME_DIR/hvim"}"

# 4. function
function welcome()
{
  echo
  cat $installer_path/../share/resource/banner.txt
  echo
  echo "welcome use hwloser-vim."
}
function main()
{
  # 1. create link for hvim
  ln -s $(realpath $installer_path/bin/hvim) $INSTALL_PREFIX/bin/hvim
}

# function setup_shim() {
#   local src="$LUNARVIM_BASE_DIR/utils/bin/lvim.template"
#   local dst="$INSTALL_PREFIX/bin/lvim"
# 
#   [ ! -d "$INSTALL_PREFIX/bin" ] && mkdir -p "$INSTALL_PREFIX/bin"
# 
#   # remove outdated installation so that `cp` doesn't complain
#   rm -f "$dst"
# 
#   cp "$src" "$dst"
# 
#   sed -e s"#RUNTIME_DIR_VAR#\"${LUNARVIM_RUNTIME_DIR}\"#"g \
#     -e s"#CONFIG_DIR_VAR#\"${LUNARVIM_CONFIG_DIR}\"#"g \
#     -e s"#CACHE_DIR_VAR#\"${LUNARVIM_CACHE_DIR}\"#"g "$src" \
#     | tee "$dst" >/dev/null
# 
#   chmod u+x "$dst"
# }
# setup_shim "$@"

# echo "You can start LunarVim by running: $INSTALL_PREFIX/bin/lvim"
