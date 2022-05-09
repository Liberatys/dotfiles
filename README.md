# System Setup

This is my NixOs based setup for my development environment.

## First installation

### Bashert (Laptop/Desktop)

    sudo nix-shell https://github.com/samuela/nixos-up/archive/main.tar.gz

    git clone https://github.com/Liberatys/dotfiles $HOME/dotfiles
    cd $HOME/dotfiles
    make clean
    make build

### Lorem (Virtual Machine)

    nix-env -i spice-vdagentd
    sudo nix-shell https://github.com/samuela/nixos-up/archive/main.tar.gz
    git clone https://github.com/Liberatys/dotfiles $HOME/dotfiles
    cd $HOME/dotfiles
    make clean
    make build-lorem

### Lasam (Remote Server)

## Builds on update

    make clean
    make build

## System update

    make upgrade

## Configuration

### Home-Modules

#### Code

#### Operations

- [git](./home-modules/git.nix)
- [window management](./home-modules/wm.nix)
- [tmux](./home-modules/tmux.nix)
- [nvim](./home-modules/neovim.nix)
