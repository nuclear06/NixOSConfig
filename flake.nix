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
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    Neve.url = "github:redyf/Neve";
    flake-utils.url = "github:numtide/flake-utils";
    minegrub-theme.url = "github:Lxtharia/minegrub-theme";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      user = "saniter";
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;
      nixosConfigurations.BlueDeep = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs user system; };
        inherit system;
        modules = [
          ./configuration.nix
          ./modules
          inputs.minegrub-theme.nixosModules.default
        ];
      };
    };
}
