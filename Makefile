current_dir = $(shell pwd)
bashert_path = "machines/bashert/configuration.nix"
lorem_path = "machines/bashert/configuration.nix"

build:
	sudo nixos-rebuild switch -I nixos-config=$(current_dir)/$(bashert_path)

build-lorem:
	sudo nixos-rebuild switch -I nixos-config=$(current_dir)/$(lorem_path)

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
	sudo rm /etc/nixos/configuration.nix
	nix-collect-garbage
