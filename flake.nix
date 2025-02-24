{
  description = "nixos flake";
  nixConfig = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
  inputs = {
    # private repo store agenix secret
    mySecret = {
      url = "git+ssh://git@github.com/nuclear06/NixSecret.git";
      flake = false;
    };
    hyprswitch.url = "github:h3rmt/hyprswitch/release";
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };
    stylix.url = "github:danth/stylix";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
    minegrub-theme.url = "github:Lxtharia/minegrub-theme";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nix-alien.url = "github:thiagokokada/nix-alien";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    flake-utils,
    self,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    nixpkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};
    myNUR = inputs.nur.legacyPackages.${system}.repos.nuclear06;
    user = "saniter";
    inherit (flake-utils.lib) eachDefaultSystem;
    treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./modules/treefmt.nix;
  in {
    formatter.${system} = treefmtEval.config.build.wrapper;
    nixpkgs.overlays = import ./overlays inputs;
    nixosConfigurations.BlueDeep = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          user
          system
          nixpkgs-stable
          myNUR
          ;
      };
      inherit system;
      modules = [
        ./configuration.nix
        ./modules
        ./overlays
      ];
    };
  };
}
