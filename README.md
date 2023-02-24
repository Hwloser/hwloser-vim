# hwloser-vim

- [hwloser-vim](#hwloser-vim)
  * [Our expectation](#our-expectation)
  * [How to Use?](#how-to-use-)
    + [Requirements](#requirements)
      - [neovim](#neovim)
      - [git](#git)
    + [How to install](#how-to-install)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>


A easy to use vim config manager.

---

## Our expectation

1. Don`t conflict with other nvim config, so you can easy to change the environment of neovim.
2. Modularizer each plugin manager.

## How to Use?

### Requirements

1. neovim
2. git
3. make

#### neovim

```bash
# macos -- please use brew install
brew install neovim

# ubuntu
apt-get update && apt-get install neovim
```

#### git

```bash
# macos -- please use brew install
brew install git

# ubuntu
apt-get update && apt-get install git
```

#### make

```bash
# macos -- please use brew install
brew install make

# ubuntu
apt-get update && apt-get install make
```


### How to install hwloser-vim

```bash
# install this manager
make

# uninstall this manager
make uninstall
```
