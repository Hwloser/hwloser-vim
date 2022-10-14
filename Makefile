SHELL := /usr/bin/env bash

install:
	@echo starting LunarVim installer
	bash ./utils/installer/install.sh

install-bin:
	@echo starting LunarVim bin-installer
	bash ./utils/installer/install_bin.sh

install-neovim-binary:
	@echo installing Neovim from github releases
	bash ./utils/installer/install-neovim-from-release

.PHONY: install install-neovim-binary uninstall lint style test
