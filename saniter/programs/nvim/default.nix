{
  inputs,
  system,
  ...
}: let
  plugins =
    builtins.map (f: ./plugins/${f})
    (builtins.attrNames (builtins.readDir ./plugins));
in {
  imports =
    [
      inputs.nixvim.homeManagerModules.nixvim
      ./options.nix
      ./keymaps.nix
      ./autocmds.nix
    ]
    ++ plugins;

  programs.nixvim = {
    package = inputs.neovim-nightly.packages.${system}.default;
    enable = true;
  };
}
