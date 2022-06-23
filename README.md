# System Setup

This is my NixOs based setup for my development environment.

## First installation

### Bashert (Laptop/Desktop)

    sudo nix-shell https://github.com/samuela/nixos-up/archive/main.tar.gz

    git clone https://github.com/Liberatys/dotfiles $HOME/dotfiles --depth 1
    cd $HOME/dotfiles
    make clean
    make link
    make

## Builds on update

    make clean
    make link
    make

## System update

    make update

## Configuration

### Modules

#### System

##### Admin

##### Security

##### Manage

##### Home

#### Work

##### Company

#### Admin

##### Mail

#### Dev

##### Fish

##### DevOps

##### Terminal

##### Web

##### Lazy

##### Remote

##### Git

##### Database

##### WM

##### Tmux

#### Browsers

#### Editors
