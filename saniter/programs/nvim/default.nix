{
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [
    inputs.nvf.homeManagerModules.default
    ./completion.nix
    ./base.nix
    ./plugins
    ./theme.nix
  ];
  options.vimConf = lib.mkOption {
    type = lib.types.attrs;
    default = { };
    description = "nvf settings";
  };
  config = {
    programs.nvf.settings.vim = config.vimConf;
  };
}
