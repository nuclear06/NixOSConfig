{ inputs, user, ... }:

let
  mySecret = inputs.mySecret;
in
{
  imports = [ inputs.agenix.nixosModules.default ];
  age = {
    identityPaths = [
      "/home/${user}/.ssh/id_rsa"
    ];
  };
  age.secrets."saniter.prv" = {
    file = "${mySecret}/saniter.prv.age";
    mode = "600";
    owner = "saniter";
  };
}
