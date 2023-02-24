install:
	@echo "backup your older nvim config"
	mv ~/.config/nvim ~/.config/nvim_bak
	@echo "soft link this repository"
	ln -s $(realpath ./) ~/.config/nvim

uninstall:
	@echo "remove the the soft link of nvim config"
	# Note that, only remove soft link
	rm ~/.config/nvim

.PHONY = uninstall
