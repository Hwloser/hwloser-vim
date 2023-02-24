install:
	@echo "git submodule update for lazy.nvim"
	git submodule update --init
	@echo "avoid ~/.config is not exists. try mkdir firstly"
	mkdir -p ~/.config
	@echo "check if nvim should be backup"
	if [ -d ~/.config/nvim ]; then \
    mv ~/.config/nvim ~/.config/nvim_backup; \
  fi
	@echo "soft link this repository"
	ln -s $(realpath ./) ~/.config/nvim

uninstall:
	@echo "remove the the soft link of nvim config"
	# Note that, only remove soft link
	rm ~/.config/nvim

.PHONY = uninstall test install
