current_dir = $(shell pwd)
config_path = "/machines/bashert/configuration.nix"

build:
	sudo nixos-rebuild switch -I nixos-config=$(current_dir)/${config_path}

lint:
	nix-env -i nixpkgs-fmt
	nixpkgs-fmt .

setup:
	nix-env -i git
	git clone https://github.com/Liberatys/.dotfiles
	cd .dotfiles && nix-env -i python3 python3Packages.psutil python3Packages.requests && exec python3 ./scripts/nixos-up.py

clean:
	nix-collect-garbage
