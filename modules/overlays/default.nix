args:
# execute and import all overlay files in the current directory with the given args
builtins.map (f: (import (./. + "/${f}") args)) # execute and import the overlay file
  (builtins.filter (f: f != "default.nix") (builtins.attrNames (builtins.readDir ./.)))
