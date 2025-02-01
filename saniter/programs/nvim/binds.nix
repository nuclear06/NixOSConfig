{ lib, ... }:
let
  inherit (lib.nvim.binds) mkKeymap;
in
{
  config.vimConf = {
    ui.borders.plugins.which-key.enable = true;
    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;

    };
    keymaps = [
      (mkKeymap [ "n" "x" ] "j" "v:count == 0 ? 'gj' : 'j'" {
        desc = "Down";
        expr = true;
        silent = true;
      })
    ];
  };
}
