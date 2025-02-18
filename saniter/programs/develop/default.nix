{config, ...}: let
  cfg = config.languages;
in {
  imports = [
    ./module.nix
  ];
  languages = {
    python = true;
    java = false;
    go = false;
    node = true;
  };
}
