nixbase := "/etc/nixos"
homepath := nixbase / "saniter"
editor := "hx"

edit:
    {{ editor }} /etc/nixos/justfile

editreadme:
    {{ editor }} /etc/nixos/README.md

editignore:
    {{ editor }} /etc/nixos/.gitignore

default:
    @just --list

gitaddall msg="update":
    cd {{ nixbase }} && git add * ; git commit -m '{{ msg }}' || true

gitupdate:
    cd {{ nixbase }} && git add * || true

fmt:
    nix fmt {{ nixbase }}

desktop dir="":
    {{ editor }} {{ homepath }}/desktop/{{ dir }}/default.nix

program dir="":
    {{ editor }} {{ homepath }}/programs/{{ dir }}/default.nix

home:
    {{ editor }} {{ homepath }}/home.nix

module:
    {{ editor }} {{ nixbase }}/modules

switch: fmt gitupdate
    nh os switch {{ nixbase }}

conf:
    {{ editor }} {{ nixbase }}/configuration.nix

flake:
    {{ editor }} {{ nixbase }}/flake.nix

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

debug: fmt gitupdate
    nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose

up: gitupdate
    nix flake update 

test: fmt gitupdate
    nh os test {{ nixbase }}

update_secret msg="update":
    cd /etc/nixos/secret && git add * && git commit -m '{{ msg }}' || true

check: fmt gitupdate
    nix flake check
