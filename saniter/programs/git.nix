{
  programs.git = {
    enable = true;
    userName = "Saniter";
    userEmail = "91713418+nuclear06@users.noreply.github.com";
    delta = {
      enable = true;
      options = {
        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-decoration-style = "none";
          file-style = "bold yellow ul";
        };
        features = "decorations";
        whitespace-error-style = "22 reverse";
      };
    };
    ignores = [
      ".cache/"
      ".idea/"
      "*.swp"
      ".direnv/"
      "node_modules"
    ];
    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      color.ui = "1";
    };
  };
}
