{ config, ... }:
{
  home.file = {
    ".config/scripts".source = config.lib.file.mkOutOfStoreSymlink ./.;
  };
}
