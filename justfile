nixbase:="/etc/nixos"
homepath:=nixbase / "saniter"

edit:
  nvim /etc/nixos/justfile
editignore:
  nvim /etc/nixos/.gitignore
default:
  @just --list
gitupdate msg="update":
  cd {{nixbase}} && git add * ; git commit -m '{{msg}}' || true
fmt:
  sudo nix fmt {{nixbase}}
desktop dir="":
  nvim {{homepath}}/desktop/{{dir}}/default.nix
program dir="":
  nvim {{homepath}}/programs/{{dir}}/default.nix
home:
  nvim {{homepath}}/home.nix
module:
  nvim {{nixbase}}/modules
switch :fmt 
  nh os switch {{nixbase}}
conf:
  nvim {{nixbase}}/configuration.nix
flake:
  nvim {{nixbase}}/flake.nix
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

debug:fmt 
  nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose

up:
  nix flake update 
test :fmt 
  nh os test {{nixbase}}
update_secret msg="update":
  cd /etc/nixos/secret && git add * && git commit -m '{{msg}}' || true
check:fmt 
  nix flake check
