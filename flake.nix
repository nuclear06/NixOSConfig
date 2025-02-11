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
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minegrub-theme.url = "github:Lxtharia/minegrub-theme";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nix-alien.url = "github:thiagokokada/nix-alien";

  };

  outputs =
    inputs@{
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nixpkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};
      myNUR = inputs.nur.legacyPackages.${system}.repos.nuclear06;
      user = "saniter";
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;
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
