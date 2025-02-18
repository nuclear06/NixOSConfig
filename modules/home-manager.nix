{
  inputs,
  user,
  system,
  nixpkgs-stable,
  myNUR,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${user} = import ../${user}/home.nix;
        backupFileExtension = "backup";
        # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        extraSpecialArgs = {
          inherit
            system
            user
            inputs
            nixpkgs-stable
            myNUR
            ;
        };
      };
    }
  ];
}
