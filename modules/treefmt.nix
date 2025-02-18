# treefmt.nix
{pkgs, ...}: {
  # Used to find the project root
  projectRootFile = "flake.nix";
  settings = {
    excludes = ["*.gif" "*.png" "*.jpg" ".gitignore" "*.lock" "*.txt"];
  };
  programs = {
    gofmt.enable = true;
    prettier.enable = true;
    google-java-format.enable = true;
    # python
    black.enable = true;
    isort.enable = true;
    # bash
    shfmt.enable = true;
    # nix
    alejandra.enable = true;
    # lua
    stylua.enable = true;
    # just
    just.enable = true;
  };
}
