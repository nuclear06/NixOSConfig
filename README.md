Sorry, I'm not FOSS enough😭.

### Reference && Q&A

#### Recommand to read

- [nix.div](https://nix.dev/guides)

#### how to write package?

- [stackexchange](https://unix.stackexchange.com/questions/717168/how-to-package-my-software-in-nix-or-write-my-own-package-derivation-for-nixpkgs/717169#717169)
- [Nix Pills](https://nixos.org/guides/nix-pills)
- [Nix Manual](https://nixos.org/manual/nixpkgs/unstable/#chap-quick-start)

#### why some theme package just put file at $out/share and then work? whats happened?

nix will link relevant assert to `$XDG_DATA_DIRS`

```bash
# you can try below commands
echo $XDG_DATA_DIRS | sed "s/:/\n/g"
ls -l /run/current-system/sw/share/icons/
```

Further reading:

- [xdg specification](https://specifications.freedesktop.org/basedir-spec/latest/)
- example:[yazi](https://github.com/nix-community/home-manager/blob/master/modules/programs/yazi.nix)

#### automatic package update

- [github issue](https://github.com/NixOS/nixpkgs/issues/295028)
- [Nixos Wiki](https://wiki.nixos.org/wiki/Nixpkgs/Update_Scripts)
  you can find definition of `unstableGitUpdater` and `gitUpdater` in this link.

### Credits

- Image source: Internet / If there’s an issue, let me know.
