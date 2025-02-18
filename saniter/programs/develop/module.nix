{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkOption
    mkEnableOption
    mkIf
    optionals
    ;
  cfg = config.languages;
in {
  options = {
    languages = {
      python = mkEnableOption "enable python environment";
      java = mkEnableOption "enable java environment";
      go = mkEnableOption "enable golang environment";
      node = mkEnableOption "enable nodejs environment";
    };
  };
  config = {
    home.sessionVariables = {
      GOPROXY = "https://mirrors.ustc.edu.cn/golang/,direct";
    };
    home.packages = with pkgs;
      [
        nixd
        alejandra
      ]
      ++ (optionals cfg.python ([python313] ++ (with python313Packages; [])))
      ++ (optionals cfg.node [nodejs_23]);
    programs = with cfg; {
      go = {
        enable = go;
      };
      java = {
        enable = java;
        package = pkgs.jdk21_headless;
      };
    };
  };
}
