{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkOption
    mkDefault
    types
    ;
in {
  options = {
    nvim.nightly = mkOption {
      type = types.bool;
      default = true;
      description = "Wether to use neovim nighlt build";
    };
  };
}
