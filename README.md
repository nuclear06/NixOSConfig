### TODO:

- [ ] migerate config to NixCat
  - [ ] add neovim nightly overlay
- [x] configure Rime
  - [x] write Rime-ice package
- [x] Configure Regeet, autologin after boot
- [ ] change theme of swayNC
- [ ] add custom package to NUR

### Reference

#### Recommand to read

- [nix.div](https://nix.dev/guides)

#### how to write package?

- [stackexchange](https://unix.stackexchange.com/questions/717168/how-to-package-my-software-in-nix-or-write-my-own-package-derivation-for-nixpkgs/717169#717169)
- [Nix Pills](https://nixos.org/guides/nix-pills)
- [Nix Manual](https://nixos.org/manual/nixpkgs/unstable/#chap-quick-start)

#### automatic package update

- [github issue](https://github.com/NixOS/nixpkgs/issues/295028)
- [Nixos Wiki](https://wiki.nixos.org/wiki/Nixpkgs/Update_Scripts)
  you can find definition of `unstableGitUpdater` and `gitUpdater` in this link.
