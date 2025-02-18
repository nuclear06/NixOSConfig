args: let
  inherit (args) inputs nixpkgs-stable pkgs;
in (final: prev: {
  basedpyright = nixpkgs-stable.basedpyright;
  tmuxPlugins =
    prev.tmuxPlugins
    // {
      resurrect = nixpkgs-stable.tmuxPlugins.resurrect;
    };
})
