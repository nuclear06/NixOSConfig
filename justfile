nixbase:="/etc/nixos"
homepath:=nixbase / "saniter"

default:
	@just --list
gitupdate msg="update":fmt
	git add -u && git commit -m '{{msg}}'
fmt:
	sudo nix fmt {{nixbase}}
desktop dir="":
	nvim {{homepath}}/desktop/{{dir}}/default.nix
program dir="":
	nvim {{homepath}}/programs/{{dir}}/default.nix
home:
	sudo nvim {{homepath}}/home.nix
module:
	sudo nvim {{nixbase}}/modules
switch:gitupdate
	nixos-rebuild switch --use-remote-sudo
conf:
	sudo nvim {{nixbase}}/configuration.nix
flake:
	sudo nvim {{nixbase}}/flake.nix
history:
  nix profile history --profile /nix/var/nix/profiles/system

repl:
  nix repl -f flake:nixpkgs

clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
  # garbage collect all unused nix store entries
  sudo nix-collect-garbage --delete-old

debug:
  nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose

up:
  nix flake update 
test:gitupdate
  nixos-rebuild test --use-remote-sudo
