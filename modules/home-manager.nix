{
  inputs,
  user,
  system,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import ../${user}/home.nix;
      home-manager.backupFileExtension = "backup";
      home-manager.extraSpecialArgs = {
        inherit system user inputs;
      };
      # Optionally, use home-manager.extraSpecialArgs to pass
      # arguments to home.nix
    }
  ];
}
