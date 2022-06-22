current_dir = $(shell pwd)
bashert_path = "machines/bashert/configuration.nix"
lorem_path = "machines/bashert/configuration.nix"

build:
	sudo nixos-rebuild switch
	bash scripts/startup

lint:
	nix-env -i nixpkgs-fmt
	nixpkgs-fmt .

lint-check:
	nix-env -f https://github.com/nix-community/nixpkgs-fmt/archive/master.tar.gz -iA nixpkgs-fmt
	nixpkgs-fmt . --check

update:
	sudo nixos-rebuild --upgrade boot

test:
	./nix-runner dry-run -I nixos-config=$(current_dir)/$(bashert_path)

gen:
	./nix-conf --dir $(current_dir)/machines/bashert

clean:
	sudo rm -f /etc/nixos/configuration.nix
	sudo nix-collect-garbage -d

reset: clean
	make link

link:
	sudo ln -s $(current_dir)/machines/bashert/configuration.nix /etc/nixos/configuration.nix

logs:
	journalctl -f
