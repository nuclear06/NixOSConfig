{ inputs, ... }:

{
  imports = [ inputs.agenix.nixosModules.default ];
  age = inputs.agenix;
  age.secrets."saniter.prv".file = ../secret/saniter.prv.age;
}
